/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 30:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 30 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 : Poly :=
[
  term (1 : Rat) [],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (-1 : Rat) [(12, 2)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(13, 2)],
  term (-2 : Rat) [(14, 1)]
]

/-- Coefficient term 0 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0000 : Poly :=
[
  term ((-18 : Rat) / 67) []
]

/-- Partial product 0 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0000 : Poly :=
[
  term ((-18 : Rat) / 67) [],
  term ((-36 : Rat) / 67) [(12, 1), (14, 1)],
  term ((18 : Rat) / 67) [(12, 2)],
  term ((-36 : Rat) / 67) [(13, 1), (15, 1)],
  term ((18 : Rat) / 67) [(13, 2)],
  term ((36 : Rat) / 67) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0000
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0001 : Poly :=
[
  term ((1405492480 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 1 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0001 : Poly :=
[
  term ((1405492480 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)],
  term ((2810984960 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1405492480 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((2810984960 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1405492480 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-2810984960 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0001
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0002 : Poly :=
[
  term ((21960820 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 2 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0002 : Poly :=
[
  term ((43921640 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-21960820 : Rat) / 12247399) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((21960820 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)],
  term ((-43921640 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((43921640 : Rat) / 12247399) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-21960820 : Rat) / 12247399) [(0, 1), (3, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0002
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0003 : Poly :=
[
  term ((-1267453040 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 3 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0003 : Poly :=
[
  term ((-2534906080 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((1267453040 : Rat) / 330679773) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-2534906080 : Rat) / 330679773) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((1267453040 : Rat) / 330679773) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((2534906080 : Rat) / 330679773) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-1267453040 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0003
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0004 : Poly :=
[
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 4 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0004 : Poly :=
[
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0004
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0005 : Poly :=
[
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 5 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0005 : Poly :=
[
  term ((-383761392 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0005
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0006 : Poly :=
[
  term ((3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 6 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0006 : Poly :=
[
  term ((7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0006
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0007 : Poly :=
[
  term ((-3004144640 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 7 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0007 : Poly :=
[
  term ((-3004144640 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1)],
  term ((-6008289280 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((3004144640 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-6008289280 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((3004144640 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((6008289280 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0007
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0008 : Poly :=
[
  term ((-140819280 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 8 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0008 : Poly :=
[
  term ((-281638560 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((140819280 : Rat) / 12247399) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-140819280 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)],
  term ((281638560 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((-281638560 : Rat) / 12247399) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((140819280 : Rat) / 12247399) [(0, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0008
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0009 : Poly :=
[
  term ((2709094720 : Rat) / 110226591) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 9 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0009 : Poly :=
[
  term ((5418189440 : Rat) / 110226591) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2709094720 : Rat) / 110226591) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((5418189440 : Rat) / 110226591) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-2709094720 : Rat) / 110226591) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-5418189440 : Rat) / 110226591) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((2709094720 : Rat) / 110226591) [(0, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0009
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0010 : Poly :=
[
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 10 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0010 : Poly :=
[
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0010
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0011 : Poly :=
[
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 11 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0011 : Poly :=
[
  term ((419816432 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0011
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0012 : Poly :=
[
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 12 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0012 : Poly :=
[
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0012
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0013 : Poly :=
[
  term ((-996047360 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 13 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0013 : Poly :=
[
  term ((-1992094720 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((996047360 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-996047360 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1)],
  term ((1992094720 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1992094720 : Rat) / 330679773) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((996047360 : Rat) / 330679773) [(0, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0013
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0014 : Poly :=
[
  term ((8893168640 : Rat) / 330679773) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 14 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0014 : Poly :=
[
  term ((17786337280 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8893168640 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((17786337280 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-8893168640 : Rat) / 330679773) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-17786337280 : Rat) / 330679773) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((8893168640 : Rat) / 330679773) [(0, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0014
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0015 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(0, 1), (11, 2)]
]

/-- Partial product 15 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0015 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(0, 1), (11, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (11, 2), (12, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (11, 2), (13, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0015
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0016 : Poly :=
[
  term ((4694531440 : Rat) / 330679773) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 16 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0016 : Poly :=
[
  term ((9389062880 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4694531440 : Rat) / 330679773) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-9389062880 : Rat) / 330679773) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((4694531440 : Rat) / 330679773) [(0, 1), (13, 1), (15, 1)],
  term ((9389062880 : Rat) / 330679773) [(0, 1), (13, 2), (15, 2)],
  term ((-4694531440 : Rat) / 330679773) [(0, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0016
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0017 : Poly :=
[
  term ((-15948800 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 17 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0017 : Poly :=
[
  term ((-31897600 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((15948800 : Rat) / 12247399) [(0, 1), (12, 2), (13, 2)],
  term ((-15948800 : Rat) / 12247399) [(0, 1), (13, 2)],
  term ((31897600 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)],
  term ((-31897600 : Rat) / 12247399) [(0, 1), (13, 3), (15, 1)],
  term ((15948800 : Rat) / 12247399) [(0, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0017
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0018 : Poly :=
[
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (15, 2)]
]

/-- Partial product 18 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0018 : Poly :=
[
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (12, 2), (15, 2)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (13, 1), (15, 3)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (13, 2), (15, 2)],
  term ((16134596480 : Rat) / 330679773) [(0, 1), (14, 1), (15, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0018
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0019 : Poly :=
[
  term ((-1405492480 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 19 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0019 : Poly :=
[
  term ((-1405492480 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)],
  term ((-2810984960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((1405492480 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-2810984960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((1405492480 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((2810984960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0019
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0020 : Poly :=
[
  term ((-21960820 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 20 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0020 : Poly :=
[
  term ((-43921640 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((21960820 : Rat) / 12247399) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((-21960820 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)],
  term ((43921640 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((-43921640 : Rat) / 12247399) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((21960820 : Rat) / 12247399) [(1, 1), (2, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0020
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0021 : Poly :=
[
  term ((1267453040 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 21 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0021 : Poly :=
[
  term ((2534906080 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1267453040 : Rat) / 330679773) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((2534906080 : Rat) / 330679773) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-1267453040 : Rat) / 330679773) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-2534906080 : Rat) / 330679773) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((1267453040 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0021
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0022 : Poly :=
[
  term ((-576880640 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1)]
]

/-- Partial product 22 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0022 : Poly :=
[
  term ((-576880640 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((1153761280 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0022
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0023 : Poly :=
[
  term ((-9013760 : Rat) / 12247399) [(1, 1), (4, 1), (13, 1)]
]

/-- Partial product 23 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0023 : Poly :=
[
  term ((-18027520 : Rat) / 12247399) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (4, 1), (12, 2), (13, 1)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (4, 1), (13, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (4, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0023
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0024 : Poly :=
[
  term ((520222720 : Rat) / 330679773) [(1, 1), (4, 1), (15, 1)]
]

/-- Partial product 24 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0024 : Poly :=
[
  term ((1040445440 : Rat) / 330679773) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0024
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0025 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1)]
]

/-- Partial product 25 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0025 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0025
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0026 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1)]
]

/-- Partial product 26 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0026 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0026
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0027 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(1, 1), (10, 1), (15, 1)]
]

/-- Partial product 27 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0027 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0027
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0028 : Poly :=
[
  term ((4809620480 : Rat) / 330679773) [(1, 1), (11, 1)]
]

/-- Partial product 28 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0028 : Poly :=
[
  term ((4809620480 : Rat) / 330679773) [(1, 1), (11, 1)],
  term ((9619240960 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-4809620480 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2)],
  term ((9619240960 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4809620480 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2)],
  term ((-9619240960 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0028
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0029 : Poly :=
[
  term ((1020723200 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 29 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0029 : Poly :=
[
  term ((1020723200 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)],
  term ((2041446400 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1020723200 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-2041446400 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((2041446400 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-1020723200 : Rat) / 330679773) [(1, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0029
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0030 : Poly :=
[
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 30 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0030 : Poly :=
[
  term ((-19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)],
  term ((19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0030
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0031 : Poly :=
[
  term ((15948800 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 31 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0031 : Poly :=
[
  term ((15948800 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)],
  term ((-31897600 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((31897600 : Rat) / 12247399) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-15948800 : Rat) / 12247399) [(1, 1), (12, 1), (13, 3)],
  term ((31897600 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-15948800 : Rat) / 12247399) [(1, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0031
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0032 : Poly :=
[
  term ((-920473600 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 32 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0032 : Poly :=
[
  term ((-1840947200 : Rat) / 330679773) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((920473600 : Rat) / 330679773) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((1840947200 : Rat) / 330679773) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-920473600 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)],
  term ((-1840947200 : Rat) / 330679773) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((920473600 : Rat) / 330679773) [(1, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0032
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0033 : Poly :=
[
  term ((75150320 : Rat) / 12247399) [(1, 1), (13, 1)]
]

/-- Partial product 33 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0033 : Poly :=
[
  term ((150300640 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-75150320 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1)],
  term ((75150320 : Rat) / 12247399) [(1, 1), (13, 1)],
  term ((-150300640 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)],
  term ((150300640 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)],
  term ((-75150320 : Rat) / 12247399) [(1, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0033
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0034 : Poly :=
[
  term ((-155477840 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 34 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0034 : Poly :=
[
  term ((-310955680 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((155477840 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-155477840 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)],
  term ((310955680 : Rat) / 12247399) [(1, 1), (13, 1), (14, 2)],
  term ((-310955680 : Rat) / 12247399) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((155477840 : Rat) / 12247399) [(1, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0034
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0035 : Poly :=
[
  term ((8973292480 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 35 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0035 : Poly :=
[
  term ((17946584960 : Rat) / 330679773) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-8973292480 : Rat) / 330679773) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((17946584960 : Rat) / 330679773) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-8973292480 : Rat) / 330679773) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((8973292480 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)],
  term ((-17946584960 : Rat) / 330679773) [(1, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0035
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0036 : Poly :=
[
  term ((-4337247040 : Rat) / 330679773) [(1, 1), (15, 1)]
]

/-- Partial product 36 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0036 : Poly :=
[
  term ((-8674494080 : Rat) / 330679773) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((4337247040 : Rat) / 330679773) [(1, 1), (12, 2), (15, 1)],
  term ((-8674494080 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((4337247040 : Rat) / 330679773) [(1, 1), (13, 2), (15, 1)],
  term ((8674494080 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)],
  term ((-4337247040 : Rat) / 330679773) [(1, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0036
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0037 : Poly :=
[
  term ((604549120 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 37 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0037 : Poly :=
[
  term ((604549120 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0037
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0038 : Poly :=
[
  term ((9446080 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 38 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0038 : Poly :=
[
  term ((18892160 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (5, 1), (12, 2), (13, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0038
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0039 : Poly :=
[
  term ((-545173760 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 39 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0039 : Poly :=
[
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0039
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0040 : Poly :=
[
  term ((-214323200 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 40 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0040 : Poly :=
[
  term ((-214323200 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1)],
  term ((-428646400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((214323200 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((-428646400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((214323200 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((428646400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0040
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0041 : Poly :=
[
  term ((-10046400 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 41 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0041 : Poly :=
[
  term ((-20092800 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((10046400 : Rat) / 12247399) [(2, 1), (7, 1), (12, 2), (13, 1)],
  term ((-10046400 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)],
  term ((20092800 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((-20092800 : Rat) / 12247399) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((10046400 : Rat) / 12247399) [(2, 1), (7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0041
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0042 : Poly :=
[
  term ((193273600 : Rat) / 110226591) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 42 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0042 : Poly :=
[
  term ((386547200 : Rat) / 110226591) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-193273600 : Rat) / 110226591) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((386547200 : Rat) / 110226591) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-193273600 : Rat) / 110226591) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((-386547200 : Rat) / 110226591) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((193273600 : Rat) / 110226591) [(2, 1), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0042
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0043 : Poly :=
[
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 43 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0043 : Poly :=
[
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 2)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0043
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0044 : Poly :=
[
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 44 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0044 : Poly :=
[
  term ((-18892160 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0044
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0045 : Poly :=
[
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 45 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0045 : Poly :=
[
  term ((1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0045
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0046 : Poly :=
[
  term ((-1027317760 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 46 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0046 : Poly :=
[
  term ((-2054635520 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1027317760 : Rat) / 330679773) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1027317760 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)],
  term ((2054635520 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((-2054635520 : Rat) / 330679773) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((1027317760 : Rat) / 330679773) [(2, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0046
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0047 : Poly :=
[
  term ((960225280 : Rat) / 110226591) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 47 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0047 : Poly :=
[
  term ((1920450560 : Rat) / 110226591) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-960225280 : Rat) / 110226591) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((1920450560 : Rat) / 110226591) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-960225280 : Rat) / 110226591) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1920450560 : Rat) / 110226591) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((960225280 : Rat) / 110226591) [(2, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0047
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0048 : Poly :=
[
  term ((2141705600 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 48 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0048 : Poly :=
[
  term ((4283411200 : Rat) / 330679773) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2141705600 : Rat) / 330679773) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((-4283411200 : Rat) / 330679773) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((2141705600 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)],
  term ((4283411200 : Rat) / 330679773) [(2, 1), (13, 2), (15, 2)],
  term ((-2141705600 : Rat) / 330679773) [(2, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0048
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0049 : Poly :=
[
  term ((-16051840 : Rat) / 12247399) [(2, 1), (13, 2)]
]

/-- Partial product 49 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0049 : Poly :=
[
  term ((-32103680 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((16051840 : Rat) / 12247399) [(2, 1), (12, 2), (13, 2)],
  term ((-16051840 : Rat) / 12247399) [(2, 1), (13, 2)],
  term ((32103680 : Rat) / 12247399) [(2, 1), (13, 2), (14, 1)],
  term ((-32103680 : Rat) / 12247399) [(2, 1), (13, 3), (15, 1)],
  term ((16051840 : Rat) / 12247399) [(2, 1), (13, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0049
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0050 : Poly :=
[
  term ((-865917440 : Rat) / 110226591) [(2, 1), (15, 2)]
]

/-- Partial product 50 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0050 : Poly :=
[
  term ((-1731834880 : Rat) / 110226591) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((865917440 : Rat) / 110226591) [(2, 1), (12, 2), (15, 2)],
  term ((-1731834880 : Rat) / 110226591) [(2, 1), (13, 1), (15, 3)],
  term ((865917440 : Rat) / 110226591) [(2, 1), (13, 2), (15, 2)],
  term ((1731834880 : Rat) / 110226591) [(2, 1), (14, 1), (15, 2)],
  term ((-865917440 : Rat) / 110226591) [(2, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0050
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0051 : Poly :=
[
  term ((63365120 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1)]
]

/-- Partial product 51 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0051 : Poly :=
[
  term ((63365120 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (12, 2)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-63365120 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (13, 2)],
  term ((-126730240 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0051
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0052 : Poly :=
[
  term ((8910720 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1)]
]

/-- Partial product 52 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0052 : Poly :=
[
  term ((17821440 : Rat) / 12247399) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8910720 : Rat) / 12247399) [(3, 1), (4, 1), (12, 2), (13, 1)],
  term ((8910720 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1)],
  term ((-17821440 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(3, 1), (4, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0052
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0053 : Poly :=
[
  term ((-57141760 : Rat) / 36742197) [(3, 1), (4, 1), (15, 1)]
]

/-- Partial product 53 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0053 : Poly :=
[
  term ((-114283520 : Rat) / 36742197) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(3, 1), (4, 1), (12, 2), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((57141760 : Rat) / 36742197) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((114283520 : Rat) / 36742197) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-57141760 : Rat) / 36742197) [(3, 1), (4, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0053
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0054 : Poly :=
[
  term ((-223847680 : Rat) / 36742197) [(3, 1), (11, 1)]
]

/-- Partial product 54 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0054 : Poly :=
[
  term ((-223847680 : Rat) / 36742197) [(3, 1), (11, 1)],
  term ((-447695360 : Rat) / 36742197) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((223847680 : Rat) / 36742197) [(3, 1), (11, 1), (12, 2)],
  term ((-447695360 : Rat) / 36742197) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((223847680 : Rat) / 36742197) [(3, 1), (11, 1), (13, 2)],
  term ((447695360 : Rat) / 36742197) [(3, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0054
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0055 : Poly :=
[
  term ((-423610880 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 55 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0055 : Poly :=
[
  term ((-423610880 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)],
  term ((-847221760 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((423610880 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((847221760 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-847221760 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((423610880 : Rat) / 330679773) [(3, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0055
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0056 : Poly :=
[
  term ((1579110400 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 56 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0056 : Poly :=
[
  term ((3158220800 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-1579110400 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((3158220800 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1579110400 : Rat) / 330679773) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((1579110400 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)],
  term ((-3158220800 : Rat) / 330679773) [(3, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0056
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0057 : Poly :=
[
  term ((-6618920 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 57 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0057 : Poly :=
[
  term ((-6618920 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)],
  term ((13237840 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13237840 : Rat) / 12247399) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((6618920 : Rat) / 12247399) [(3, 1), (12, 1), (13, 3)],
  term ((-13237840 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((6618920 : Rat) / 12247399) [(3, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0057
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0058 : Poly :=
[
  term ((382006240 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 58 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0058 : Poly :=
[
  term ((764012480 : Rat) / 330679773) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-382006240 : Rat) / 330679773) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-764012480 : Rat) / 330679773) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((382006240 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)],
  term ((764012480 : Rat) / 330679773) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-382006240 : Rat) / 330679773) [(3, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0058
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0059 : Poly :=
[
  term ((-31478580 : Rat) / 12247399) [(3, 1), (13, 1)]
]

/-- Partial product 59 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0059 : Poly :=
[
  term ((-62957160 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((31478580 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1)],
  term ((-31478580 : Rat) / 12247399) [(3, 1), (13, 1)],
  term ((62957160 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)],
  term ((-62957160 : Rat) / 12247399) [(3, 1), (13, 2), (15, 1)],
  term ((31478580 : Rat) / 12247399) [(3, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0059
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0060 : Poly :=
[
  term ((24673600 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 60 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0060 : Poly :=
[
  term ((49347200 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((-24673600 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((24673600 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)],
  term ((-49347200 : Rat) / 12247399) [(3, 1), (13, 1), (14, 2)],
  term ((49347200 : Rat) / 12247399) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-24673600 : Rat) / 12247399) [(3, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0060
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0061 : Poly :=
[
  term ((-1424019200 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 61 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0061 : Poly :=
[
  term ((-2848038400 : Rat) / 330679773) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((1424019200 : Rat) / 330679773) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2848038400 : Rat) / 330679773) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((1424019200 : Rat) / 330679773) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-1424019200 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)],
  term ((2848038400 : Rat) / 330679773) [(3, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0061
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0062 : Poly :=
[
  term ((201862640 : Rat) / 36742197) [(3, 1), (15, 1)]
]

/-- Partial product 62 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0062 : Poly :=
[
  term ((403725280 : Rat) / 36742197) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-201862640 : Rat) / 36742197) [(3, 1), (12, 2), (15, 1)],
  term ((403725280 : Rat) / 36742197) [(3, 1), (13, 1), (15, 2)],
  term ((-201862640 : Rat) / 36742197) [(3, 1), (13, 2), (15, 1)],
  term ((-403725280 : Rat) / 36742197) [(3, 1), (14, 1), (15, 1)],
  term ((201862640 : Rat) / 36742197) [(3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0062
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0063 : Poly :=
[
  term ((-63365120 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1)]
]

/-- Partial product 63 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0063 : Poly :=
[
  term ((-63365120 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1)],
  term ((-126730240 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((63365120 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (12, 2)],
  term ((-126730240 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((63365120 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (13, 2)],
  term ((126730240 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0063
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0064 : Poly :=
[
  term ((-8910720 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1)]
]

/-- Partial product 64 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0064 : Poly :=
[
  term ((-17821440 : Rat) / 12247399) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((8910720 : Rat) / 12247399) [(4, 1), (5, 1), (12, 2), (13, 1)],
  term ((-8910720 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1)],
  term ((17821440 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((-17821440 : Rat) / 12247399) [(4, 1), (5, 1), (13, 2), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(4, 1), (5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0064
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0065 : Poly :=
[
  term ((57141760 : Rat) / 36742197) [(4, 1), (5, 1), (15, 1)]
]

/-- Partial product 65 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0065 : Poly :=
[
  term ((114283520 : Rat) / 36742197) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-57141760 : Rat) / 36742197) [(4, 1), (5, 1), (12, 2), (15, 1)],
  term ((114283520 : Rat) / 36742197) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-57141760 : Rat) / 36742197) [(4, 1), (5, 1), (13, 2), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(4, 1), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0065
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0066 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(4, 1), (11, 1), (15, 1)]
]

/-- Partial product 66 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0066 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(4, 1), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0066
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0067 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(4, 1), (13, 1), (15, 1)]
]

/-- Partial product 67 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0067 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((18278400 : Rat) / 12247399) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (13, 1), (15, 1)],
  term ((-18278400 : Rat) / 12247399) [(4, 1), (13, 2), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0067
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0068 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(4, 1), (15, 2)]
]

/-- Partial product 68 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0068 : Poly :=
[
  term ((351641600 : Rat) / 110226591) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(4, 1), (12, 2), (15, 2)],
  term ((351641600 : Rat) / 110226591) [(4, 1), (13, 1), (15, 3)],
  term ((-175820800 : Rat) / 110226591) [(4, 1), (13, 2), (15, 2)],
  term ((-351641600 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(4, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0068
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0069 : Poly :=
[
  term ((-366 : Rat) / 67) [(5, 1), (9, 1)]
]

/-- Partial product 69 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0069 : Poly :=
[
  term ((-366 : Rat) / 67) [(5, 1), (9, 1)],
  term ((-732 : Rat) / 67) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((366 : Rat) / 67) [(5, 1), (9, 1), (12, 2)],
  term ((-732 : Rat) / 67) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((366 : Rat) / 67) [(5, 1), (9, 1), (13, 2)],
  term ((732 : Rat) / 67) [(5, 1), (9, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0069
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0070 : Poly :=
[
  term ((1276314131456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 70 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0070 : Poly :=
[
  term ((1276314131456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)],
  term ((2552628262912 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1276314131456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (12, 2)],
  term ((2552628262912 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1276314131456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (13, 2)],
  term ((-2552628262912 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0070
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0071 : Poly :=
[
  term ((19942408304 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 71 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0071 : Poly :=
[
  term ((39884816608 : Rat) / 1163502905) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-19942408304 : Rat) / 1163502905) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((19942408304 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)],
  term ((-39884816608 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((39884816608 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((-19942408304 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0071
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0072 : Poly :=
[
  term ((-1150961850688 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 72 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0072 : Poly :=
[
  term ((-2301923701376 : Rat) / 31414578435) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((1150961850688 : Rat) / 31414578435) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((-2301923701376 : Rat) / 31414578435) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((1150961850688 : Rat) / 31414578435) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((2301923701376 : Rat) / 31414578435) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1150961850688 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0072
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0073 : Poly :=
[
  term ((5322306101068 : Rat) / 94243735305) [(5, 1), (11, 1)]
]

/-- Partial product 73 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0073 : Poly :=
[
  term ((5322306101068 : Rat) / 94243735305) [(5, 1), (11, 1)],
  term ((10644612202136 : Rat) / 94243735305) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-5322306101068 : Rat) / 94243735305) [(5, 1), (11, 1), (12, 2)],
  term ((10644612202136 : Rat) / 94243735305) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5322306101068 : Rat) / 94243735305) [(5, 1), (11, 1), (13, 2)],
  term ((-10644612202136 : Rat) / 94243735305) [(5, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0073
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0074 : Poly :=
[
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 74 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0074 : Poly :=
[
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)],
  term ((-18448059392 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((18448059392 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-18448059392 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0074
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0075 : Poly :=
[
  term ((5178880 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 75 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0075 : Poly :=
[
  term ((10357760 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5178880 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-10357760 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5178880 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((10357760 : Rat) / 110226591) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-5178880 : Rat) / 110226591) [(5, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0075
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0076 : Poly :=
[
  term ((-697048576 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 76 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0076 : Poly :=
[
  term ((-1394097152 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((697048576 : Rat) / 36742197) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-1394097152 : Rat) / 36742197) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((697048576 : Rat) / 36742197) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((-697048576 : Rat) / 36742197) [(5, 1), (11, 1), (14, 1)],
  term ((1394097152 : Rat) / 36742197) [(5, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0076
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0077 : Poly :=
[
  term ((112977920 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 77 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0077 : Poly :=
[
  term ((225955840 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-112977920 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((225955840 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-112977920 : Rat) / 110226591) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-225955840 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((112977920 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0077
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0078 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 78 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0078 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 2), (12, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0078
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0079 : Poly :=
[
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 79 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0079 : Poly :=
[
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)],
  term ((864752784 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-864752784 : Rat) / 12247399) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 3)],
  term ((-864752784 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((432376392 : Rat) / 12247399) [(5, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0079
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0080 : Poly :=
[
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 80 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0080 : Poly :=
[
  term ((16162386592 : Rat) / 110226591) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-16162386592 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)],
  term ((16162386592 : Rat) / 110226591) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-8081193296 : Rat) / 110226591) [(5, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0080
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0081 : Poly :=
[
  term ((164739614879 : Rat) / 6981017430) [(5, 1), (13, 1)]
]

/-- Partial product 81 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0081 : Poly :=
[
  term ((164739614879 : Rat) / 3490508715) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-164739614879 : Rat) / 6981017430) [(5, 1), (12, 2), (13, 1)],
  term ((164739614879 : Rat) / 6981017430) [(5, 1), (13, 1)],
  term ((-164739614879 : Rat) / 3490508715) [(5, 1), (13, 1), (14, 1)],
  term ((164739614879 : Rat) / 3490508715) [(5, 1), (13, 2), (15, 1)],
  term ((-164739614879 : Rat) / 6981017430) [(5, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0081
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0082 : Poly :=
[
  term ((-98022456 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 82 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0082 : Poly :=
[
  term ((-196044912 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((98022456 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-98022456 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)],
  term ((196044912 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)],
  term ((-196044912 : Rat) / 12247399) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((98022456 : Rat) / 12247399) [(5, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0082
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0083 : Poly :=
[
  term ((87496960 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 83 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0083 : Poly :=
[
  term ((174993920 : Rat) / 110226591) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-87496960 : Rat) / 110226591) [(5, 1), (12, 2), (13, 1), (15, 2)],
  term ((-174993920 : Rat) / 110226591) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((87496960 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)],
  term ((174993920 : Rat) / 110226591) [(5, 1), (13, 2), (15, 3)],
  term ((-87496960 : Rat) / 110226591) [(5, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0083
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0084 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 84 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0084 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (12, 2), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (13, 3), (15, 2)],
  term ((913920 : Rat) / 12247399) [(5, 1), (13, 4), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0084
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0085 : Poly :=
[
  term ((589104296 : Rat) / 36742197) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 85 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0085 : Poly :=
[
  term ((1178208592 : Rat) / 36742197) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-589104296 : Rat) / 36742197) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((1178208592 : Rat) / 36742197) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-589104296 : Rat) / 36742197) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((589104296 : Rat) / 36742197) [(5, 1), (14, 1), (15, 1)],
  term ((-1178208592 : Rat) / 36742197) [(5, 1), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0085
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0086 : Poly :=
[
  term ((-4739848371644 : Rat) / 94243735305) [(5, 1), (15, 1)]
]

/-- Partial product 86 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0086 : Poly :=
[
  term ((-9479696743288 : Rat) / 94243735305) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((4739848371644 : Rat) / 94243735305) [(5, 1), (12, 2), (15, 1)],
  term ((-9479696743288 : Rat) / 94243735305) [(5, 1), (13, 1), (15, 2)],
  term ((4739848371644 : Rat) / 94243735305) [(5, 1), (13, 2), (15, 1)],
  term ((9479696743288 : Rat) / 94243735305) [(5, 1), (14, 1), (15, 1)],
  term ((-4739848371644 : Rat) / 94243735305) [(5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0086
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0087 : Poly :=
[
  term ((-149447680 : Rat) / 110226591) [(5, 1), (15, 3)]
]

/-- Partial product 87 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0087 : Poly :=
[
  term ((-298895360 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((149447680 : Rat) / 110226591) [(5, 1), (12, 2), (15, 3)],
  term ((-298895360 : Rat) / 110226591) [(5, 1), (13, 1), (15, 4)],
  term ((149447680 : Rat) / 110226591) [(5, 1), (13, 2), (15, 3)],
  term ((298895360 : Rat) / 110226591) [(5, 1), (14, 1), (15, 3)],
  term ((-149447680 : Rat) / 110226591) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0087
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0088 : Poly :=
[
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 88 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0088 : Poly :=
[
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1)],
  term ((436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term ((436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (13, 2)],
  term ((-436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0088
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0089 : Poly :=
[
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 89 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0089 : Poly :=
[
  term ((20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)],
  term ((-20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0089
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0090 : Poly :=
[
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 90 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0090 : Poly :=
[
  term ((-393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0090
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0091 : Poly :=
[
  term ((-1896235712 : Rat) / 110226591) [(7, 1), (11, 1)]
]

/-- Partial product 91 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0091 : Poly :=
[
  term ((-1896235712 : Rat) / 110226591) [(7, 1), (11, 1)],
  term ((-3792471424 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((1896235712 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2)],
  term ((-3792471424 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((1896235712 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2)],
  term ((3792471424 : Rat) / 110226591) [(7, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0091
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0092 : Poly :=
[
  term ((11756052224 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 92 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0092 : Poly :=
[
  term ((11756052224 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)],
  term ((23512104448 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11756052224 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-23512104448 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((23512104448 : Rat) / 330679773) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-11756052224 : Rat) / 330679773) [(7, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0092
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0093 : Poly :=
[
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 93 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0093 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0093
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0094 : Poly :=
[
  term ((6791975680 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 94 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0094 : Poly :=
[
  term ((13583951360 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-6791975680 : Rat) / 330679773) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((13583951360 : Rat) / 330679773) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-6791975680 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((6791975680 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)],
  term ((-13583951360 : Rat) / 330679773) [(7, 1), (11, 1), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0094
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0095 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 95 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0095 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((-87910400 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0095
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0096 : Poly :=
[
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 96 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0096 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0096
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0097 : Poly :=
[
  term ((183688316 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 97 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0097 : Poly :=
[
  term ((183688316 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)],
  term ((-367376632 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((367376632 : Rat) / 12247399) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-183688316 : Rat) / 12247399) [(7, 1), (12, 1), (13, 3)],
  term ((367376632 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-183688316 : Rat) / 12247399) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0097
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0098 : Poly :=
[
  term ((-9890725216 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 98 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0098 : Poly :=
[
  term ((-19781450432 : Rat) / 330679773) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((9890725216 : Rat) / 330679773) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((19781450432 : Rat) / 330679773) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9890725216 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)],
  term ((-19781450432 : Rat) / 330679773) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((9890725216 : Rat) / 330679773) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0098
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 30. -/
def rs_R009_ueqv_R009NNNYN_coefficient_30_0099 : Poly :=
[
  term ((-88886049 : Rat) / 12247399) [(7, 1), (13, 1)]
]

/-- Partial product 99 for generator 30. -/
def rs_R009_ueqv_R009NNNYN_partial_30_0099 : Poly :=
[
  term ((-177772098 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((88886049 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1)],
  term ((-88886049 : Rat) / 12247399) [(7, 1), (13, 1)],
  term ((177772098 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)],
  term ((-177772098 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)],
  term ((88886049 : Rat) / 12247399) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 30. -/
theorem rs_R009_ueqv_R009NNNYN_partial_30_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_30_0099
        rs_R009_ueqv_R009NNNYN_generator_30_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_30_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_30_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_30_0000,
  rs_R009_ueqv_R009NNNYN_partial_30_0001,
  rs_R009_ueqv_R009NNNYN_partial_30_0002,
  rs_R009_ueqv_R009NNNYN_partial_30_0003,
  rs_R009_ueqv_R009NNNYN_partial_30_0004,
  rs_R009_ueqv_R009NNNYN_partial_30_0005,
  rs_R009_ueqv_R009NNNYN_partial_30_0006,
  rs_R009_ueqv_R009NNNYN_partial_30_0007,
  rs_R009_ueqv_R009NNNYN_partial_30_0008,
  rs_R009_ueqv_R009NNNYN_partial_30_0009,
  rs_R009_ueqv_R009NNNYN_partial_30_0010,
  rs_R009_ueqv_R009NNNYN_partial_30_0011,
  rs_R009_ueqv_R009NNNYN_partial_30_0012,
  rs_R009_ueqv_R009NNNYN_partial_30_0013,
  rs_R009_ueqv_R009NNNYN_partial_30_0014,
  rs_R009_ueqv_R009NNNYN_partial_30_0015,
  rs_R009_ueqv_R009NNNYN_partial_30_0016,
  rs_R009_ueqv_R009NNNYN_partial_30_0017,
  rs_R009_ueqv_R009NNNYN_partial_30_0018,
  rs_R009_ueqv_R009NNNYN_partial_30_0019,
  rs_R009_ueqv_R009NNNYN_partial_30_0020,
  rs_R009_ueqv_R009NNNYN_partial_30_0021,
  rs_R009_ueqv_R009NNNYN_partial_30_0022,
  rs_R009_ueqv_R009NNNYN_partial_30_0023,
  rs_R009_ueqv_R009NNNYN_partial_30_0024,
  rs_R009_ueqv_R009NNNYN_partial_30_0025,
  rs_R009_ueqv_R009NNNYN_partial_30_0026,
  rs_R009_ueqv_R009NNNYN_partial_30_0027,
  rs_R009_ueqv_R009NNNYN_partial_30_0028,
  rs_R009_ueqv_R009NNNYN_partial_30_0029,
  rs_R009_ueqv_R009NNNYN_partial_30_0030,
  rs_R009_ueqv_R009NNNYN_partial_30_0031,
  rs_R009_ueqv_R009NNNYN_partial_30_0032,
  rs_R009_ueqv_R009NNNYN_partial_30_0033,
  rs_R009_ueqv_R009NNNYN_partial_30_0034,
  rs_R009_ueqv_R009NNNYN_partial_30_0035,
  rs_R009_ueqv_R009NNNYN_partial_30_0036,
  rs_R009_ueqv_R009NNNYN_partial_30_0037,
  rs_R009_ueqv_R009NNNYN_partial_30_0038,
  rs_R009_ueqv_R009NNNYN_partial_30_0039,
  rs_R009_ueqv_R009NNNYN_partial_30_0040,
  rs_R009_ueqv_R009NNNYN_partial_30_0041,
  rs_R009_ueqv_R009NNNYN_partial_30_0042,
  rs_R009_ueqv_R009NNNYN_partial_30_0043,
  rs_R009_ueqv_R009NNNYN_partial_30_0044,
  rs_R009_ueqv_R009NNNYN_partial_30_0045,
  rs_R009_ueqv_R009NNNYN_partial_30_0046,
  rs_R009_ueqv_R009NNNYN_partial_30_0047,
  rs_R009_ueqv_R009NNNYN_partial_30_0048,
  rs_R009_ueqv_R009NNNYN_partial_30_0049,
  rs_R009_ueqv_R009NNNYN_partial_30_0050,
  rs_R009_ueqv_R009NNNYN_partial_30_0051,
  rs_R009_ueqv_R009NNNYN_partial_30_0052,
  rs_R009_ueqv_R009NNNYN_partial_30_0053,
  rs_R009_ueqv_R009NNNYN_partial_30_0054,
  rs_R009_ueqv_R009NNNYN_partial_30_0055,
  rs_R009_ueqv_R009NNNYN_partial_30_0056,
  rs_R009_ueqv_R009NNNYN_partial_30_0057,
  rs_R009_ueqv_R009NNNYN_partial_30_0058,
  rs_R009_ueqv_R009NNNYN_partial_30_0059,
  rs_R009_ueqv_R009NNNYN_partial_30_0060,
  rs_R009_ueqv_R009NNNYN_partial_30_0061,
  rs_R009_ueqv_R009NNNYN_partial_30_0062,
  rs_R009_ueqv_R009NNNYN_partial_30_0063,
  rs_R009_ueqv_R009NNNYN_partial_30_0064,
  rs_R009_ueqv_R009NNNYN_partial_30_0065,
  rs_R009_ueqv_R009NNNYN_partial_30_0066,
  rs_R009_ueqv_R009NNNYN_partial_30_0067,
  rs_R009_ueqv_R009NNNYN_partial_30_0068,
  rs_R009_ueqv_R009NNNYN_partial_30_0069,
  rs_R009_ueqv_R009NNNYN_partial_30_0070,
  rs_R009_ueqv_R009NNNYN_partial_30_0071,
  rs_R009_ueqv_R009NNNYN_partial_30_0072,
  rs_R009_ueqv_R009NNNYN_partial_30_0073,
  rs_R009_ueqv_R009NNNYN_partial_30_0074,
  rs_R009_ueqv_R009NNNYN_partial_30_0075,
  rs_R009_ueqv_R009NNNYN_partial_30_0076,
  rs_R009_ueqv_R009NNNYN_partial_30_0077,
  rs_R009_ueqv_R009NNNYN_partial_30_0078,
  rs_R009_ueqv_R009NNNYN_partial_30_0079,
  rs_R009_ueqv_R009NNNYN_partial_30_0080,
  rs_R009_ueqv_R009NNNYN_partial_30_0081,
  rs_R009_ueqv_R009NNNYN_partial_30_0082,
  rs_R009_ueqv_R009NNNYN_partial_30_0083,
  rs_R009_ueqv_R009NNNYN_partial_30_0084,
  rs_R009_ueqv_R009NNNYN_partial_30_0085,
  rs_R009_ueqv_R009NNNYN_partial_30_0086,
  rs_R009_ueqv_R009NNNYN_partial_30_0087,
  rs_R009_ueqv_R009NNNYN_partial_30_0088,
  rs_R009_ueqv_R009NNNYN_partial_30_0089,
  rs_R009_ueqv_R009NNNYN_partial_30_0090,
  rs_R009_ueqv_R009NNNYN_partial_30_0091,
  rs_R009_ueqv_R009NNNYN_partial_30_0092,
  rs_R009_ueqv_R009NNNYN_partial_30_0093,
  rs_R009_ueqv_R009NNNYN_partial_30_0094,
  rs_R009_ueqv_R009NNNYN_partial_30_0095,
  rs_R009_ueqv_R009NNNYN_partial_30_0096,
  rs_R009_ueqv_R009NNNYN_partial_30_0097,
  rs_R009_ueqv_R009NNNYN_partial_30_0098,
  rs_R009_ueqv_R009NNNYN_partial_30_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_30_0000_0099 : Poly :=
[
  term ((-18 : Rat) / 67) [],
  term ((1405492480 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)],
  term ((2810984960 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1405492480 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((2810984960 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1405492480 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 2)],
  term ((-2810984960 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (14, 1)],
  term ((43921640 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2534906080 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-21960820 : Rat) / 12247399) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((1267453040 : Rat) / 330679773) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((21960820 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)],
  term ((-43921640 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 1)],
  term ((-2534906080 : Rat) / 330679773) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((2453337320 : Rat) / 330679773) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-21960820 : Rat) / 12247399) [(0, 1), (3, 1), (13, 3)],
  term ((2534906080 : Rat) / 330679773) [(0, 1), (3, 1), (14, 1), (15, 1)],
  term ((-1267453040 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)],
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 2)],
  term ((8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 1)],
  term ((7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((-7145271632 : Rat) / 110226591) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 3)],
  term ((-7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (14, 1), (15, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (15, 1)],
  term ((-3004144640 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1)],
  term ((-6008289280 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((3004144640 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-6008289280 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((3004144640 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((6008289280 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (14, 1)],
  term ((-281638560 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((5418189440 : Rat) / 110226591) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((140819280 : Rat) / 12247399) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-2709094720 : Rat) / 110226591) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-140819280 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)],
  term ((281638560 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 1)],
  term ((5418189440 : Rat) / 110226591) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((-5243841760 : Rat) / 110226591) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((140819280 : Rat) / 12247399) [(0, 1), (7, 1), (13, 3)],
  term ((-5418189440 : Rat) / 110226591) [(0, 1), (7, 1), (14, 1), (15, 1)],
  term ((2709094720 : Rat) / 110226591) [(0, 1), (7, 1), (15, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (13, 2)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((23449746416 : Rat) / 330679773) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 3)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (14, 1), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (15, 1)],
  term ((-1992094720 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((17786337280 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((996047360 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-8893168640 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-996047360 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1)],
  term ((1992094720 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1), (14, 1)],
  term ((17786337280 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3628421120 : Rat) / 110226591) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((996047360 : Rat) / 330679773) [(0, 1), (11, 1), (13, 3)],
  term ((-17786337280 : Rat) / 330679773) [(0, 1), (11, 1), (14, 1), (15, 1)],
  term ((8893168640 : Rat) / 330679773) [(0, 1), (11, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(0, 1), (11, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (11, 2), (12, 2)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 1), (11, 2), (13, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (11, 2), (14, 1)],
  term ((9389062880 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-31897600 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4694531440 : Rat) / 330679773) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((15948800 : Rat) / 12247399) [(0, 1), (12, 2), (13, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (12, 2), (15, 2)],
  term ((-9389062880 : Rat) / 330679773) [(0, 1), (13, 1), (14, 1), (15, 1)],
  term ((4694531440 : Rat) / 330679773) [(0, 1), (13, 1), (15, 1)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (13, 1), (15, 3)],
  term ((-15948800 : Rat) / 12247399) [(0, 1), (13, 2)],
  term ((31897600 : Rat) / 12247399) [(0, 1), (13, 2), (14, 1)],
  term ((1939595680 : Rat) / 36742197) [(0, 1), (13, 2), (15, 2)],
  term ((-5555766640 : Rat) / 330679773) [(0, 1), (13, 3), (15, 1)],
  term ((15948800 : Rat) / 12247399) [(0, 1), (13, 4)],
  term ((16134596480 : Rat) / 330679773) [(0, 1), (14, 1), (15, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (15, 2)],
  term ((-1405492480 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)],
  term ((-2810984960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((1405492480 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 2)],
  term ((-2810984960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((1405492480 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((2810984960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 1)],
  term ((-43921640 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((2534906080 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((21960820 : Rat) / 12247399) [(1, 1), (2, 1), (12, 2), (13, 1)],
  term ((-1267453040 : Rat) / 330679773) [(1, 1), (2, 1), (12, 2), (15, 1)],
  term ((-21960820 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)],
  term ((43921640 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 1)],
  term ((2534906080 : Rat) / 330679773) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-2453337320 : Rat) / 330679773) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((21960820 : Rat) / 12247399) [(1, 1), (2, 1), (13, 3)],
  term ((-2534906080 : Rat) / 330679773) [(1, 1), (2, 1), (14, 1), (15, 1)],
  term ((1267453040 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)],
  term ((-576880640 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (12, 2)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (13, 2)],
  term ((1153761280 : Rat) / 330679773) [(1, 1), (4, 1), (11, 1), (14, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (4, 1), (12, 2), (13, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (4, 1), (12, 2), (15, 1)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (4, 1), (13, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 1), (4, 1), (13, 1), (14, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (4, 1), (13, 1), (15, 2)],
  term ((-1006965760 : Rat) / 330679773) [(1, 1), (4, 1), (13, 2), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (4, 1), (13, 3)],
  term ((-1040445440 : Rat) / 330679773) [(1, 1), (4, 1), (14, 1), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (4, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (12, 2)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (10, 1), (11, 1), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (10, 1), (12, 2), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(1, 1), (10, 1), (12, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 1), (14, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((-34032640 : Rat) / 110226591) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 1), (10, 1), (13, 3)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (10, 1), (14, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 1), (10, 1), (15, 1)],
  term ((4809620480 : Rat) / 330679773) [(1, 1), (11, 1)],
  term ((1020723200 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)],
  term ((2041446400 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1020723200 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((2525931520 : Rat) / 110226591) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((-4809620480 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2)],
  term ((3997342720 : Rat) / 110226591) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((-1020723200 : Rat) / 330679773) [(1, 1), (11, 1), (12, 3)],
  term ((-19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((9619240960 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4809620480 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2)],
  term ((9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-6523274240 : Rat) / 110226591) [(1, 1), (11, 1), (14, 1)],
  term ((19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (14, 2)],
  term ((15948800 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)],
  term ((118403040 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-310955680 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1840947200 : Rat) / 330679773) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((1781708800 : Rat) / 330679773) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-15948800 : Rat) / 12247399) [(1, 1), (12, 1), (13, 3)],
  term ((-2277848960 : Rat) / 110226591) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((17946584960 : Rat) / 330679773) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-920473600 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)],
  term ((-75150320 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1)],
  term ((187375440 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((-3604746560 : Rat) / 110226591) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((4337247040 : Rat) / 330679773) [(1, 1), (12, 2), (15, 1)],
  term ((-15948800 : Rat) / 12247399) [(1, 1), (12, 3), (13, 1)],
  term ((920473600 : Rat) / 330679773) [(1, 1), (12, 3), (15, 1)],
  term ((75150320 : Rat) / 12247399) [(1, 1), (13, 1)],
  term ((-305778480 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)],
  term ((17946584960 : Rat) / 330679773) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((310955680 : Rat) / 12247399) [(1, 1), (13, 1), (14, 2)],
  term ((-8674494080 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((-17369095840 : Rat) / 330679773) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((8395364320 : Rat) / 330679773) [(1, 1), (13, 2), (15, 1)],
  term ((-75150320 : Rat) / 12247399) [(1, 1), (13, 3)],
  term ((155477840 : Rat) / 12247399) [(1, 1), (13, 3), (14, 1)],
  term ((5882595520 : Rat) / 110226591) [(1, 1), (14, 1), (15, 1)],
  term ((-17946584960 : Rat) / 330679773) [(1, 1), (14, 2), (15, 1)],
  term ((-4337247040 : Rat) / 330679773) [(1, 1), (15, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 2)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (13, 2)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 1)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (5, 1), (12, 2), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (5, 1), (12, 2), (15, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((1055262080 : Rat) / 330679773) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (5, 1), (13, 3)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (5, 1), (14, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)],
  term ((-214323200 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1)],
  term ((-428646400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((214323200 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (12, 2)],
  term ((-428646400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((214323200 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((428646400 : Rat) / 110226591) [(2, 1), (7, 1), (11, 1), (14, 1)],
  term ((-20092800 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((386547200 : Rat) / 110226591) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((10046400 : Rat) / 12247399) [(2, 1), (7, 1), (12, 2), (13, 1)],
  term ((-193273600 : Rat) / 110226591) [(2, 1), (7, 1), (12, 2), (15, 1)],
  term ((-10046400 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)],
  term ((20092800 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 1)],
  term ((386547200 : Rat) / 110226591) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-374108800 : Rat) / 110226591) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((10046400 : Rat) / 12247399) [(2, 1), (7, 1), (13, 3)],
  term ((-386547200 : Rat) / 110226591) [(2, 1), (7, 1), (14, 1), (15, 1)],
  term ((193273600 : Rat) / 110226591) [(2, 1), (7, 1), (15, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 2)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (13, 2)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (14, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (9, 1), (12, 2), (13, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (9, 1), (12, 2), (15, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((-1055262080 : Rat) / 330679773) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 3)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (14, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)],
  term ((-2054635520 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((1920450560 : Rat) / 110226591) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((1027317760 : Rat) / 330679773) [(2, 1), (11, 1), (12, 2), (13, 1)],
  term ((-960225280 : Rat) / 110226591) [(2, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1027317760 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)],
  term ((2054635520 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 1)],
  term ((1920450560 : Rat) / 110226591) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((-4935311360 : Rat) / 330679773) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((1027317760 : Rat) / 330679773) [(2, 1), (11, 1), (13, 3)],
  term ((-1920450560 : Rat) / 110226591) [(2, 1), (11, 1), (14, 1), (15, 1)],
  term ((960225280 : Rat) / 110226591) [(2, 1), (11, 1), (15, 1)],
  term ((4283411200 : Rat) / 330679773) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-32103680 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-1731834880 : Rat) / 110226591) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((-2141705600 : Rat) / 330679773) [(2, 1), (12, 2), (13, 1), (15, 1)],
  term ((16051840 : Rat) / 12247399) [(2, 1), (12, 2), (13, 2)],
  term ((865917440 : Rat) / 110226591) [(2, 1), (12, 2), (15, 2)],
  term ((-4283411200 : Rat) / 330679773) [(2, 1), (13, 1), (14, 1), (15, 1)],
  term ((2141705600 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)],
  term ((-1731834880 : Rat) / 110226591) [(2, 1), (13, 1), (15, 3)],
  term ((-16051840 : Rat) / 12247399) [(2, 1), (13, 2)],
  term ((32103680 : Rat) / 12247399) [(2, 1), (13, 2), (14, 1)],
  term ((6881163520 : Rat) / 330679773) [(2, 1), (13, 2), (15, 2)],
  term ((-3008504960 : Rat) / 330679773) [(2, 1), (13, 3), (15, 1)],
  term ((16051840 : Rat) / 12247399) [(2, 1), (13, 4)],
  term ((1731834880 : Rat) / 110226591) [(2, 1), (14, 1), (15, 2)],
  term ((-865917440 : Rat) / 110226591) [(2, 1), (15, 2)],
  term ((63365120 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (12, 1), (14, 1)],
  term ((-63365120 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (12, 2)],
  term ((126730240 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (13, 1), (15, 1)],
  term ((-63365120 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (13, 2)],
  term ((-126730240 : Rat) / 36742197) [(3, 1), (4, 1), (11, 1), (14, 1)],
  term ((17821440 : Rat) / 12247399) [(3, 1), (4, 1), (12, 1), (13, 1), (14, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (4, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(3, 1), (4, 1), (12, 2), (13, 1)],
  term ((57141760 : Rat) / 36742197) [(3, 1), (4, 1), (12, 2), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1)],
  term ((-17821440 : Rat) / 12247399) [(3, 1), (4, 1), (13, 1), (14, 1)],
  term ((-114283520 : Rat) / 36742197) [(3, 1), (4, 1), (13, 1), (15, 2)],
  term ((110606080 : Rat) / 36742197) [(3, 1), (4, 1), (13, 2), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(3, 1), (4, 1), (13, 3)],
  term ((114283520 : Rat) / 36742197) [(3, 1), (4, 1), (14, 1), (15, 1)],
  term ((-57141760 : Rat) / 36742197) [(3, 1), (4, 1), (15, 1)],
  term ((-223847680 : Rat) / 36742197) [(3, 1), (11, 1)],
  term ((-423610880 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)],
  term ((-847221760 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((423610880 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (13, 2)],
  term ((-3182036480 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((3158220800 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((223847680 : Rat) / 36742197) [(3, 1), (11, 1), (12, 2)],
  term ((-2426332160 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((423610880 : Rat) / 330679773) [(3, 1), (11, 1), (12, 3)],
  term ((3158220800 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-447695360 : Rat) / 36742197) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((223847680 : Rat) / 36742197) [(3, 1), (11, 1), (13, 2)],
  term ((-1579110400 : Rat) / 330679773) [(3, 1), (11, 1), (13, 2), (14, 1)],
  term ((5608368640 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)],
  term ((-3158220800 : Rat) / 330679773) [(3, 1), (11, 1), (14, 2)],
  term ((-6618920 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)],
  term ((-49719320 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((49347200 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((764012480 : Rat) / 330679773) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-739427920 : Rat) / 330679773) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((6618920 : Rat) / 12247399) [(3, 1), (12, 1), (13, 3)],
  term ((2869515040 : Rat) / 330679773) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2848038400 : Rat) / 330679773) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((382006240 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)],
  term ((31478580 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1)],
  term ((-37911440 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((2188031680 : Rat) / 330679773) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((-201862640 : Rat) / 36742197) [(3, 1), (12, 2), (15, 1)],
  term ((6618920 : Rat) / 12247399) [(3, 1), (12, 3), (13, 1)],
  term ((-382006240 : Rat) / 330679773) [(3, 1), (12, 3), (15, 1)],
  term ((-31478580 : Rat) / 12247399) [(3, 1), (13, 1)],
  term ((87630760 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)],
  term ((-2848038400 : Rat) / 330679773) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-49347200 : Rat) / 12247399) [(3, 1), (13, 1), (14, 2)],
  term ((403725280 : Rat) / 36742197) [(3, 1), (13, 1), (15, 2)],
  term ((2756393600 : Rat) / 330679773) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((-390734120 : Rat) / 36742197) [(3, 1), (13, 2), (15, 1)],
  term ((31478580 : Rat) / 12247399) [(3, 1), (13, 3)],
  term ((-24673600 : Rat) / 12247399) [(3, 1), (13, 3), (14, 1)],
  term ((-5057546720 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)],
  term ((2848038400 : Rat) / 330679773) [(3, 1), (14, 2), (15, 1)],
  term ((201862640 : Rat) / 36742197) [(3, 1), (15, 1)],
  term ((-63365120 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1)],
  term ((-126730240 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((63365120 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (12, 2)],
  term ((-126730240 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((63365120 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (13, 2)],
  term ((126730240 : Rat) / 36742197) [(4, 1), (5, 1), (11, 1), (14, 1)],
  term ((-17821440 : Rat) / 12247399) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((114283520 : Rat) / 36742197) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(4, 1), (5, 1), (12, 2), (13, 1)],
  term ((-57141760 : Rat) / 36742197) [(4, 1), (5, 1), (12, 2), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1)],
  term ((17821440 : Rat) / 12247399) [(4, 1), (5, 1), (13, 1), (14, 1)],
  term ((114283520 : Rat) / 36742197) [(4, 1), (5, 1), (13, 1), (15, 2)],
  term ((-110606080 : Rat) / 36742197) [(4, 1), (5, 1), (13, 2), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(4, 1), (5, 1), (13, 3)],
  term ((-114283520 : Rat) / 36742197) [(4, 1), (5, 1), (14, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(4, 1), (5, 1), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(4, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(4, 1), (11, 1), (12, 2), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(4, 1), (11, 1), (13, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(4, 1), (11, 1), (13, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(4, 1), (11, 1), (14, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(4, 1), (11, 1), (15, 1)],
  term ((-18278400 : Rat) / 12247399) [(4, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((351641600 : Rat) / 110226591) [(4, 1), (12, 1), (14, 1), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (12, 2), (13, 1), (15, 1)],
  term ((-175820800 : Rat) / 110226591) [(4, 1), (12, 2), (15, 2)],
  term ((18278400 : Rat) / 12247399) [(4, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(4, 1), (13, 1), (15, 1)],
  term ((351641600 : Rat) / 110226591) [(4, 1), (13, 1), (15, 3)],
  term ((-340326400 : Rat) / 110226591) [(4, 1), (13, 2), (15, 2)],
  term ((9139200 : Rat) / 12247399) [(4, 1), (13, 3), (15, 1)],
  term ((-351641600 : Rat) / 110226591) [(4, 1), (14, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(4, 1), (15, 2)],
  term ((-366 : Rat) / 67) [(5, 1), (9, 1)],
  term ((-732 : Rat) / 67) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((366 : Rat) / 67) [(5, 1), (9, 1), (12, 2)],
  term ((-732 : Rat) / 67) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((366 : Rat) / 67) [(5, 1), (9, 1), (13, 2)],
  term ((732 : Rat) / 67) [(5, 1), (9, 1), (14, 1)],
  term ((1276314131456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)],
  term ((2552628262912 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1276314131456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (12, 2)],
  term ((2552628262912 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1276314131456 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (13, 2)],
  term ((-2552628262912 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (14, 1)],
  term ((39884816608 : Rat) / 1163502905) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2301923701376 : Rat) / 31414578435) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-19942408304 : Rat) / 1163502905) [(5, 1), (10, 1), (12, 2), (13, 1)],
  term ((1150961850688 : Rat) / 31414578435) [(5, 1), (10, 1), (12, 2), (15, 1)],
  term ((19942408304 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)],
  term ((-39884816608 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1), (14, 1)],
  term ((-2301923701376 : Rat) / 31414578435) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((2227851899104 : Rat) / 31414578435) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((-19942408304 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 3)],
  term ((2301923701376 : Rat) / 31414578435) [(5, 1), (10, 1), (14, 1), (15, 1)],
  term ((-1150961850688 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)],
  term ((5322306101068 : Rat) / 94243735305) [(5, 1), (11, 1)],
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)],
  term ((10357760 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-18448059392 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 2)],
  term ((26417702982296 : Rat) / 94243735305) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((225955840 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1394097152 : Rat) / 36742197) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-5322306101068 : Rat) / 94243735305) [(5, 1), (11, 1), (12, 2)],
  term ((-5178880 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((-16356913664 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((-112977920 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (15, 2)],
  term ((9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 3)],
  term ((-4192649216 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((10649040144536 : Rat) / 94243735305) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((225955840 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-5322306101068 : Rat) / 94243735305) [(5, 1), (11, 1), (13, 2)],
  term ((697048576 : Rat) / 36742197) [(5, 1), (11, 1), (13, 2), (14, 1)],
  term ((-11402240 : Rat) / 12247399) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-5178880 : Rat) / 110226591) [(5, 1), (11, 1), (13, 3), (15, 1)],
  term ((-12432541799576 : Rat) / 94243735305) [(5, 1), (11, 1), (14, 1)],
  term ((-225955840 : Rat) / 110226591) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((1394097152 : Rat) / 36742197) [(5, 1), (11, 1), (14, 2)],
  term ((112977920 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 2), (12, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 2), (13, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (11, 2), (14, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (15, 1)],
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)],
  term ((411194158319 : Rat) / 3490508715) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((174993920 : Rat) / 110226591) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-196044912 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((16162386592 : Rat) / 110226591) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-15863968352 : Rat) / 110226591) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 3)],
  term ((-23298537279448 : Rat) / 94243735305) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-298895360 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((1178208592 : Rat) / 36742197) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)],
  term ((-164739614879 : Rat) / 6981017430) [(5, 1), (12, 2), (13, 1)],
  term ((-766730328 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-87496960 : Rat) / 110226591) [(5, 1), (12, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(5, 1), (12, 2), (13, 2), (15, 1)],
  term ((14395073704 : Rat) / 110226591) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((4739848371644 : Rat) / 94243735305) [(5, 1), (12, 2), (15, 1)],
  term ((149447680 : Rat) / 110226591) [(5, 1), (12, 2), (15, 3)],
  term ((432376392 : Rat) / 12247399) [(5, 1), (12, 3), (13, 1)],
  term ((-8081193296 : Rat) / 110226591) [(5, 1), (12, 3), (15, 1)],
  term ((164739614879 : Rat) / 6981017430) [(5, 1), (13, 1)],
  term ((-192676014839 : Rat) / 3490508715) [(5, 1), (13, 1), (14, 1)],
  term ((3359631856 : Rat) / 110226591) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((196044912 : Rat) / 12247399) [(5, 1), (13, 1), (14, 2)],
  term ((-9404886842488 : Rat) / 94243735305) [(5, 1), (13, 1), (15, 2)],
  term ((-298895360 : Rat) / 110226591) [(5, 1), (13, 1), (15, 4)],
  term ((-1171755512 : Rat) / 36742197) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((9180785358977 : Rat) / 94243735305) [(5, 1), (13, 2), (15, 1)],
  term ((108147200 : Rat) / 36742197) [(5, 1), (13, 2), (15, 3)],
  term ((-164739614879 : Rat) / 6981017430) [(5, 1), (13, 3)],
  term ((98022456 : Rat) / 12247399) [(5, 1), (13, 3), (14, 1)],
  term ((-103947520 : Rat) / 110226591) [(5, 1), (13, 3), (15, 2)],
  term ((913920 : Rat) / 12247399) [(5, 1), (13, 4), (15, 1)],
  term ((10990749262528 : Rat) / 94243735305) [(5, 1), (14, 1), (15, 1)],
  term ((298895360 : Rat) / 110226591) [(5, 1), (14, 1), (15, 3)],
  term ((-1178208592 : Rat) / 36742197) [(5, 1), (14, 2), (15, 1)],
  term ((-4739848371644 : Rat) / 94243735305) [(5, 1), (15, 1)],
  term ((-149447680 : Rat) / 110226591) [(5, 1), (15, 3)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1)],
  term ((436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (12, 2)],
  term ((436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (13, 2)],
  term ((-436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (14, 1)],
  term ((20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (12, 2), (13, 1)],
  term ((196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (12, 2), (15, 1)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)],
  term ((-20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1), (14, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((380738527184 : Rat) / 10471526145) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 3)],
  term ((393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (14, 1), (15, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 1)],
  term ((-1896235712 : Rat) / 110226591) [(7, 1), (11, 1)],
  term ((11756052224 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1)],
  term ((-9139200 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((23512104448 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-11756052224 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-34889518720 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((13583951360 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((1896235712 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2)],
  term ((4569600 : Rat) / 12247399) [(7, 1), (11, 1), (12, 2), (13, 1), (15, 1)],
  term ((5573376256 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2), (15, 2)],
  term ((-11756052224 : Rat) / 330679773) [(7, 1), (11, 1), (12, 3)],
  term ((13830709760 : Rat) / 330679773) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3833597824 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((175820800 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((1896235712 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2)],
  term ((-6791975680 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-170163200 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 3), (15, 1)],
  term ((18169389952 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-13583951360 : Rat) / 330679773) [(7, 1), (11, 1), (14, 2)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(7, 1), (11, 2), (12, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(7, 1), (11, 2), (13, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(7, 1), (11, 2), (14, 1), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)],
  term ((183688316 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)],
  term ((-545148730 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-19781450432 : Rat) / 330679773) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((19809894280 : Rat) / 330679773) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-183688316 : Rat) / 12247399) [(7, 1), (12, 1), (13, 3)],
  term ((19781450432 : Rat) / 330679773) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9890725216 : Rat) / 330679773) [(7, 1), (12, 1), (15, 1)],
  term ((88886049 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1)],
  term ((367376632 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-19781450432 : Rat) / 330679773) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-183688316 : Rat) / 12247399) [(7, 1), (12, 3), (13, 1)],
  term ((9890725216 : Rat) / 330679773) [(7, 1), (12, 3), (15, 1)],
  term ((-88886049 : Rat) / 12247399) [(7, 1), (13, 1)],
  term ((177772098 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)],
  term ((-177772098 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)],
  term ((88886049 : Rat) / 12247399) [(7, 1), (13, 3)],
  term ((-36 : Rat) / 67) [(12, 1), (14, 1)],
  term ((18 : Rat) / 67) [(12, 2)],
  term ((-36 : Rat) / 67) [(13, 1), (15, 1)],
  term ((18 : Rat) / 67) [(13, 2)],
  term ((36 : Rat) / 67) [(14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 30, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNYN_block_30_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_30_0000_0099
      rs_R009_ueqv_R009NNNYN_block_30_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
