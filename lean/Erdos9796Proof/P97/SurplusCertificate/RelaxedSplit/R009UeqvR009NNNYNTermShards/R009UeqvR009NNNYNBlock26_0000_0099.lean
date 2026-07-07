/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 26:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 26 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(6, 1), (12, 1)],
  term (-1 : Rat) [(6, 2)],
  term (2 : Rat) [(7, 1), (13, 1)],
  term (-1 : Rat) [(7, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0000 : Poly :=
[
  term ((219618560 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 0 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0000 : Poly :=
[
  term ((-439237120 : Rat) / 330679773) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((219618560 : Rat) / 330679773) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((439237120 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-219618560 : Rat) / 330679773) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((439237120 : Rat) / 330679773) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-219618560 : Rat) / 330679773) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((-439237120 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((219618560 : Rat) / 330679773) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0000
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0001 : Poly :=
[
  term ((3431540 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 1 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0001 : Poly :=
[
  term ((-6863080 : Rat) / 12247399) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((3431540 : Rat) / 12247399) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((6863080 : Rat) / 12247399) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-3431540 : Rat) / 12247399) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((6863080 : Rat) / 12247399) [(0, 1), (3, 1), (7, 1), (13, 2)],
  term ((-3431540 : Rat) / 12247399) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((-6863080 : Rat) / 12247399) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((3431540 : Rat) / 12247399) [(0, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0001
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0002 : Poly :=
[
  term ((-198048880 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 2 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0002 : Poly :=
[
  term ((396097760 : Rat) / 330679773) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-198048880 : Rat) / 330679773) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-396097760 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((198048880 : Rat) / 330679773) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((-396097760 : Rat) / 330679773) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((198048880 : Rat) / 330679773) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((396097760 : Rat) / 330679773) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-198048880 : Rat) / 330679773) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0002
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0003 : Poly :=
[
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0003 : Poly :=
[
  term ((8186909696 : Rat) / 110226591) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (6, 2), (11, 1)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (7, 2), (11, 1)],
  term ((8186909696 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-4093454848 : Rat) / 110226591) [(0, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0003
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0004 : Poly :=
[
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 4 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0004 : Poly :=
[
  term ((383761392 : Rat) / 12247399) [(0, 1), (1, 1), (5, 1), (13, 2)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (6, 2), (13, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 1), (5, 1), (7, 1), (13, 2)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (7, 2), (13, 1)],
  term ((383761392 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0004
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0005 : Poly :=
[
  term ((3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 5 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0005 : Poly :=
[
  term ((-7382838208 : Rat) / 110226591) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (7, 2), (15, 1)],
  term ((-7382838208 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0005
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0006 : Poly :=
[
  term ((-66519040 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 6 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0006 : Poly :=
[
  term ((133038080 : Rat) / 330679773) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-66519040 : Rat) / 330679773) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-133038080 : Rat) / 330679773) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((66519040 : Rat) / 330679773) [(0, 1), (6, 2), (7, 1), (11, 1)],
  term ((-133038080 : Rat) / 330679773) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((66519040 : Rat) / 330679773) [(0, 1), (7, 3), (11, 1)],
  term ((133038080 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((-66519040 : Rat) / 330679773) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0006
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0007 : Poly :=
[
  term ((-1039360 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 7 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0007 : Poly :=
[
  term ((2078720 : Rat) / 12247399) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((-1039360 : Rat) / 12247399) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-2078720 : Rat) / 12247399) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((1039360 : Rat) / 12247399) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((-2078720 : Rat) / 12247399) [(0, 1), (7, 2), (13, 2)],
  term ((1039360 : Rat) / 12247399) [(0, 1), (7, 3), (13, 1)],
  term ((2078720 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-1039360 : Rat) / 12247399) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0007
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0008 : Poly :=
[
  term ((59985920 : Rat) / 330679773) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 8 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0008 : Poly :=
[
  term ((-119971840 : Rat) / 330679773) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((59985920 : Rat) / 330679773) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((119971840 : Rat) / 330679773) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-59985920 : Rat) / 330679773) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((119971840 : Rat) / 330679773) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-59985920 : Rat) / 330679773) [(0, 1), (7, 3), (15, 1)],
  term ((-119971840 : Rat) / 330679773) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((59985920 : Rat) / 330679773) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0008
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0009 : Poly :=
[
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 9 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0009 : Poly :=
[
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (6, 2), (9, 1), (11, 1)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((-26868251648 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0009
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0010 : Poly :=
[
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 10 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0010 : Poly :=
[
  term ((-419816432 : Rat) / 12247399) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0010
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0011 : Poly :=
[
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 11 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0011 : Poly :=
[
  term ((24229405504 : Rat) / 330679773) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0011
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0012 : Poly :=
[
  term ((-576880640 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 12 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0012 : Poly :=
[
  term ((1153761280 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-576880640 : Rat) / 330679773) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-1153761280 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((576880640 : Rat) / 330679773) [(0, 1), (6, 2), (11, 1), (13, 1)],
  term ((-1153761280 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((576880640 : Rat) / 330679773) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((1153761280 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-576880640 : Rat) / 330679773) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0012
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0013 : Poly :=
[
  term ((8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 13 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0013 : Poly :=
[
  term ((-17891829760 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((17891829760 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-8945914880 : Rat) / 330679773) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((17891829760 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8945914880 : Rat) / 330679773) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((-17891829760 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0013
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0014 : Poly :=
[
  term ((4294280560 : Rat) / 330679773) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 14 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0014 : Poly :=
[
  term ((-8588561120 : Rat) / 330679773) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((4294280560 : Rat) / 330679773) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((8588561120 : Rat) / 330679773) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4294280560 : Rat) / 330679773) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((8588561120 : Rat) / 330679773) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-4294280560 : Rat) / 330679773) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((-8588561120 : Rat) / 330679773) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((4294280560 : Rat) / 330679773) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0014
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0015 : Poly :=
[
  term ((-9013760 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 15 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0015 : Poly :=
[
  term ((18027520 : Rat) / 12247399) [(0, 1), (1, 1), (13, 3)],
  term ((-9013760 : Rat) / 12247399) [(0, 1), (1, 2), (13, 2)],
  term ((-18027520 : Rat) / 12247399) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((9013760 : Rat) / 12247399) [(0, 1), (6, 2), (13, 2)],
  term ((-18027520 : Rat) / 12247399) [(0, 1), (7, 1), (13, 3)],
  term ((9013760 : Rat) / 12247399) [(0, 1), (7, 2), (13, 2)],
  term ((18027520 : Rat) / 12247399) [(0, 2), (12, 1), (13, 2)],
  term ((-9013760 : Rat) / 12247399) [(0, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0015
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0016 : Poly :=
[
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (15, 2)]
]

/-- Partial product 16 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0016 : Poly :=
[
  term ((16134596480 : Rat) / 330679773) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (1, 2), (15, 2)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (6, 2), (15, 2)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (7, 2), (15, 2)],
  term ((16134596480 : Rat) / 330679773) [(0, 2), (12, 1), (15, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0016
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0017 : Poly :=
[
  term ((785048320 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 17 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0017 : Poly :=
[
  term ((-1570096640 : Rat) / 330679773) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((785048320 : Rat) / 330679773) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((1570096640 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1)],
  term ((-785048320 : Rat) / 330679773) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((1570096640 : Rat) / 330679773) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-785048320 : Rat) / 330679773) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-1570096640 : Rat) / 330679773) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((785048320 : Rat) / 330679773) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0017
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0018 : Poly :=
[
  term ((12266380 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 18 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0018 : Poly :=
[
  term ((-24532760 : Rat) / 12247399) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((12266380 : Rat) / 12247399) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((24532760 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1)],
  term ((-12266380 : Rat) / 12247399) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((24532760 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((-12266380 : Rat) / 12247399) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((-24532760 : Rat) / 12247399) [(1, 2), (2, 1), (13, 2)],
  term ((12266380 : Rat) / 12247399) [(1, 3), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0018
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0019 : Poly :=
[
  term ((-707945360 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 19 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0019 : Poly :=
[
  term ((1415890720 : Rat) / 330679773) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-707945360 : Rat) / 330679773) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-1415890720 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((707945360 : Rat) / 330679773) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((-1415890720 : Rat) / 330679773) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((707945360 : Rat) / 330679773) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((1415890720 : Rat) / 330679773) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-707945360 : Rat) / 330679773) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0019
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0020 : Poly :=
[
  term ((854586880 : Rat) / 36742197) [(1, 1), (11, 1)]
]

/-- Partial product 20 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0020 : Poly :=
[
  term ((-1709173760 : Rat) / 36742197) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((854586880 : Rat) / 36742197) [(0, 2), (1, 1), (11, 1)],
  term ((1709173760 : Rat) / 36742197) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-854586880 : Rat) / 36742197) [(1, 1), (6, 2), (11, 1)],
  term ((1709173760 : Rat) / 36742197) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-854586880 : Rat) / 36742197) [(1, 1), (7, 2), (11, 1)],
  term ((-1709173760 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1)],
  term ((854586880 : Rat) / 36742197) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0020
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0021 : Poly :=
[
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 21 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0021 : Poly :=
[
  term ((-1153761280 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((576880640 : Rat) / 330679773) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((1153761280 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((-576880640 : Rat) / 330679773) [(1, 1), (6, 2), (11, 1), (12, 1)],
  term ((1153761280 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-576880640 : Rat) / 330679773) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term ((-1153761280 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0021
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0022 : Poly :=
[
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 22 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0022 : Poly :=
[
  term ((19901163520 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-9950581760 : Rat) / 330679773) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-19901163520 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((9950581760 : Rat) / 330679773) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((-19901163520 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((9950581760 : Rat) / 330679773) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((19901163520 : Rat) / 330679773) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-9950581760 : Rat) / 330679773) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0022
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0023 : Poly :=
[
  term ((9013760 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 23 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0023 : Poly :=
[
  term ((-18027520 : Rat) / 12247399) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((9013760 : Rat) / 12247399) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (6, 2), (12, 1), (13, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 2), (12, 1), (13, 2)],
  term ((9013760 : Rat) / 12247399) [(1, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0023
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0024 : Poly :=
[
  term ((-520222720 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 24 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0024 : Poly :=
[
  term ((1040445440 : Rat) / 330679773) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0024
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0025 : Poly :=
[
  term ((120176280 : Rat) / 12247399) [(1, 1), (13, 1)]
]

/-- Partial product 25 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0025 : Poly :=
[
  term ((-240352560 : Rat) / 12247399) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((120176280 : Rat) / 12247399) [(0, 2), (1, 1), (13, 1)],
  term ((240352560 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-120176280 : Rat) / 12247399) [(1, 1), (6, 2), (13, 1)],
  term ((240352560 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2)],
  term ((-120176280 : Rat) / 12247399) [(1, 1), (7, 2), (13, 1)],
  term ((-240352560 : Rat) / 12247399) [(1, 2), (13, 2)],
  term ((120176280 : Rat) / 12247399) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0025
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0026 : Poly :=
[
  term ((-155477840 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 26 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0026 : Poly :=
[
  term ((310955680 : Rat) / 12247399) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-155477840 : Rat) / 12247399) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-310955680 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((155477840 : Rat) / 12247399) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term ((-310955680 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((155477840 : Rat) / 12247399) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((310955680 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((-155477840 : Rat) / 12247399) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0026
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0027 : Poly :=
[
  term ((8973292480 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 27 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0027 : Poly :=
[
  term ((-17946584960 : Rat) / 330679773) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((8973292480 : Rat) / 330679773) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((17946584960 : Rat) / 330679773) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8973292480 : Rat) / 330679773) [(1, 1), (6, 2), (14, 1), (15, 1)],
  term ((17946584960 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8973292480 : Rat) / 330679773) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((-17946584960 : Rat) / 330679773) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((8973292480 : Rat) / 330679773) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0027
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0028 : Poly :=
[
  term ((-770654240 : Rat) / 36742197) [(1, 1), (15, 1)]
]

/-- Partial product 28 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0028 : Poly :=
[
  term ((1541308480 : Rat) / 36742197) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-770654240 : Rat) / 36742197) [(0, 2), (1, 1), (15, 1)],
  term ((-1541308480 : Rat) / 36742197) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((770654240 : Rat) / 36742197) [(1, 1), (6, 2), (15, 1)],
  term ((-1541308480 : Rat) / 36742197) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((770654240 : Rat) / 36742197) [(1, 1), (7, 2), (15, 1)],
  term ((1541308480 : Rat) / 36742197) [(1, 2), (13, 1), (15, 1)],
  term ((-770654240 : Rat) / 36742197) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0028
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0029 : Poly :=
[
  term ((1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 29 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0029 : Poly :=
[
  term ((-3490242560 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((1745121280 : Rat) / 330679773) [(0, 2), (2, 1), (5, 1), (11, 1)],
  term ((-3490242560 : Rat) / 330679773) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((1745121280 : Rat) / 330679773) [(1, 2), (2, 1), (5, 1), (11, 1)],
  term ((3490242560 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (6, 2), (11, 1)],
  term ((3490242560 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0029
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0030 : Poly :=
[
  term ((27267520 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 30 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0030 : Poly :=
[
  term ((-54535040 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((27267520 : Rat) / 12247399) [(0, 2), (2, 1), (5, 1), (13, 1)],
  term ((-54535040 : Rat) / 12247399) [(1, 1), (2, 1), (5, 1), (13, 2)],
  term ((27267520 : Rat) / 12247399) [(1, 2), (2, 1), (5, 1), (13, 1)],
  term ((54535040 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-27267520 : Rat) / 12247399) [(2, 1), (5, 1), (6, 2), (13, 1)],
  term ((54535040 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (13, 2)],
  term ((-27267520 : Rat) / 12247399) [(2, 1), (5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0030
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0031 : Poly :=
[
  term ((-1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 31 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0031 : Poly :=
[
  term ((3147450880 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-1573725440 : Rat) / 330679773) [(0, 2), (2, 1), (5, 1), (15, 1)],
  term ((3147450880 : Rat) / 330679773) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-1573725440 : Rat) / 330679773) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((-3147450880 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((-3147450880 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0031
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0032 : Poly :=
[
  term ((-18780160 : Rat) / 12247399) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 32 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0032 : Poly :=
[
  term ((37560320 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-18780160 : Rat) / 12247399) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((37560320 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-18780160 : Rat) / 12247399) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-37560320 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((18780160 : Rat) / 12247399) [(2, 1), (6, 2), (7, 1), (11, 1)],
  term ((-37560320 : Rat) / 12247399) [(2, 1), (7, 2), (11, 1), (13, 1)],
  term ((18780160 : Rat) / 12247399) [(2, 1), (7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0032
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0033 : Poly :=
[
  term ((-7922880 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 33 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0033 : Poly :=
[
  term ((15845760 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-7922880 : Rat) / 12247399) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((15845760 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((-7922880 : Rat) / 12247399) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-15845760 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((7922880 : Rat) / 12247399) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((-15845760 : Rat) / 12247399) [(2, 1), (7, 2), (13, 2)],
  term ((7922880 : Rat) / 12247399) [(2, 1), (7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0033
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0034 : Poly :=
[
  term ((16935680 : Rat) / 12247399) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 34 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0034 : Poly :=
[
  term ((-33871360 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((16935680 : Rat) / 12247399) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-33871360 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((16935680 : Rat) / 12247399) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((33871360 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-16935680 : Rat) / 12247399) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((33871360 : Rat) / 12247399) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-16935680 : Rat) / 12247399) [(2, 1), (7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0034
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0035 : Poly :=
[
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 35 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0035 : Poly :=
[
  term ((1209098240 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-604549120 : Rat) / 330679773) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((1209098240 : Rat) / 330679773) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-604549120 : Rat) / 330679773) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (6, 2), (9, 1), (11, 1)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0035
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0036 : Poly :=
[
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 36 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0036 : Poly :=
[
  term ((18892160 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-9446080 : Rat) / 12247399) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((18892160 : Rat) / 12247399) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((-9446080 : Rat) / 12247399) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (7, 1), (9, 1), (13, 2)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0036
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0037 : Poly :=
[
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 37 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0037 : Poly :=
[
  term ((-1090347520 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((-1090347520 : Rat) / 330679773) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0037
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0038 : Poly :=
[
  term ((63365120 : Rat) / 36742197) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 38 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0038 : Poly :=
[
  term ((-126730240 : Rat) / 36742197) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((63365120 : Rat) / 36742197) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-126730240 : Rat) / 36742197) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((63365120 : Rat) / 36742197) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((126730240 : Rat) / 36742197) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-63365120 : Rat) / 36742197) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((126730240 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((-63365120 : Rat) / 36742197) [(2, 1), (7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0038
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0039 : Poly :=
[
  term ((-205300480 : Rat) / 330679773) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 39 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0039 : Poly :=
[
  term ((410600960 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-205300480 : Rat) / 330679773) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((410600960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-205300480 : Rat) / 330679773) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-410600960 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((205300480 : Rat) / 330679773) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((-410600960 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((205300480 : Rat) / 330679773) [(2, 1), (7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0039
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0040 : Poly :=
[
  term ((-66765220 : Rat) / 36742197) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0040 : Poly :=
[
  term ((133530440 : Rat) / 36742197) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-66765220 : Rat) / 36742197) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((133530440 : Rat) / 36742197) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-66765220 : Rat) / 36742197) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-133530440 : Rat) / 36742197) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((66765220 : Rat) / 36742197) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-133530440 : Rat) / 36742197) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((66765220 : Rat) / 36742197) [(2, 1), (7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0040
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0041 : Poly :=
[
  term ((8910720 : Rat) / 12247399) [(2, 1), (13, 2)]
]

/-- Partial product 41 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0041 : Poly :=
[
  term ((-17821440 : Rat) / 12247399) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((8910720 : Rat) / 12247399) [(0, 2), (2, 1), (13, 2)],
  term ((-17821440 : Rat) / 12247399) [(1, 1), (2, 1), (13, 3)],
  term ((8910720 : Rat) / 12247399) [(1, 2), (2, 1), (13, 2)],
  term ((17821440 : Rat) / 12247399) [(2, 1), (6, 1), (12, 1), (13, 2)],
  term ((-8910720 : Rat) / 12247399) [(2, 1), (6, 2), (13, 2)],
  term ((17821440 : Rat) / 12247399) [(2, 1), (7, 1), (13, 3)],
  term ((-8910720 : Rat) / 12247399) [(2, 1), (7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0041
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0042 : Poly :=
[
  term ((185137040 : Rat) / 330679773) [(2, 1), (15, 2)]
]

/-- Partial product 42 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0042 : Poly :=
[
  term ((-370274080 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((185137040 : Rat) / 330679773) [(0, 2), (2, 1), (15, 2)],
  term ((-370274080 : Rat) / 330679773) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((185137040 : Rat) / 330679773) [(1, 2), (2, 1), (15, 2)],
  term ((370274080 : Rat) / 330679773) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((-185137040 : Rat) / 330679773) [(2, 1), (6, 2), (15, 2)],
  term ((370274080 : Rat) / 330679773) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-185137040 : Rat) / 330679773) [(2, 1), (7, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0042
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0043 : Poly :=
[
  term ((876485120 : Rat) / 110226591) [(3, 1), (11, 1)]
]

/-- Partial product 43 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0043 : Poly :=
[
  term ((-1752970240 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((876485120 : Rat) / 110226591) [(0, 2), (3, 1), (11, 1)],
  term ((-1752970240 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((876485120 : Rat) / 110226591) [(1, 2), (3, 1), (11, 1)],
  term ((1752970240 : Rat) / 110226591) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-876485120 : Rat) / 110226591) [(3, 1), (6, 2), (11, 1)],
  term ((1752970240 : Rat) / 110226591) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-876485120 : Rat) / 110226591) [(3, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0043
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0044 : Poly :=
[
  term ((-63365120 : Rat) / 36742197) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 44 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0044 : Poly :=
[
  term ((126730240 : Rat) / 36742197) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-63365120 : Rat) / 36742197) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((126730240 : Rat) / 36742197) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-63365120 : Rat) / 36742197) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((-126730240 : Rat) / 36742197) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((63365120 : Rat) / 36742197) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((-126730240 : Rat) / 36742197) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((63365120 : Rat) / 36742197) [(3, 1), (7, 2), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0044
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0045 : Poly :=
[
  term ((-1403073280 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 45 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0045 : Poly :=
[
  term ((2806146560 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1403073280 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((2806146560 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1403073280 : Rat) / 330679773) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-2806146560 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((1403073280 : Rat) / 330679773) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((-2806146560 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((1403073280 : Rat) / 330679773) [(3, 1), (7, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0045
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0046 : Poly :=
[
  term ((-8910720 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 46 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0046 : Poly :=
[
  term ((17821440 : Rat) / 12247399) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((-8910720 : Rat) / 12247399) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((17821440 : Rat) / 12247399) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((-8910720 : Rat) / 12247399) [(1, 2), (3, 1), (12, 1), (13, 1)],
  term ((-17821440 : Rat) / 12247399) [(3, 1), (6, 1), (12, 2), (13, 1)],
  term ((8910720 : Rat) / 12247399) [(3, 1), (6, 2), (12, 1), (13, 1)],
  term ((-17821440 : Rat) / 12247399) [(3, 1), (7, 1), (12, 1), (13, 2)],
  term ((8910720 : Rat) / 12247399) [(3, 1), (7, 2), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0046
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0047 : Poly :=
[
  term ((57141760 : Rat) / 36742197) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 47 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0047 : Poly :=
[
  term ((-114283520 : Rat) / 36742197) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-114283520 : Rat) / 36742197) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((57141760 : Rat) / 36742197) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((114283520 : Rat) / 36742197) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-57141760 : Rat) / 36742197) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((114283520 : Rat) / 36742197) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-57141760 : Rat) / 36742197) [(3, 1), (7, 2), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0047
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0048 : Poly :=
[
  term ((41085240 : Rat) / 12247399) [(3, 1), (13, 1)]
]

/-- Partial product 48 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0048 : Poly :=
[
  term ((-82170480 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((41085240 : Rat) / 12247399) [(0, 2), (3, 1), (13, 1)],
  term ((-82170480 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2)],
  term ((41085240 : Rat) / 12247399) [(1, 2), (3, 1), (13, 1)],
  term ((82170480 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-41085240 : Rat) / 12247399) [(3, 1), (6, 2), (13, 1)],
  term ((82170480 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2)],
  term ((-41085240 : Rat) / 12247399) [(3, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0048
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0049 : Poly :=
[
  term ((-21923020 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 49 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0049 : Poly :=
[
  term ((43846040 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-21923020 : Rat) / 12247399) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((43846040 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-21923020 : Rat) / 12247399) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-43846040 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((21923020 : Rat) / 12247399) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((-43846040 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((21923020 : Rat) / 12247399) [(3, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0049
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0050 : Poly :=
[
  term ((1265271440 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 50 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0050 : Poly :=
[
  term ((-2530542880 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((1265271440 : Rat) / 330679773) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-2530542880 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((1265271440 : Rat) / 330679773) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((2530542880 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1265271440 : Rat) / 330679773) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((2530542880 : Rat) / 330679773) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1265271440 : Rat) / 330679773) [(3, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0050
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0051 : Poly :=
[
  term ((-790401760 : Rat) / 110226591) [(3, 1), (15, 1)]
]

/-- Partial product 51 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0051 : Poly :=
[
  term ((1580803520 : Rat) / 110226591) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-790401760 : Rat) / 110226591) [(0, 2), (3, 1), (15, 1)],
  term ((1580803520 : Rat) / 110226591) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-790401760 : Rat) / 110226591) [(1, 2), (3, 1), (15, 1)],
  term ((-1580803520 : Rat) / 110226591) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((790401760 : Rat) / 110226591) [(3, 1), (6, 2), (15, 1)],
  term ((-1580803520 : Rat) / 110226591) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((790401760 : Rat) / 110226591) [(3, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0051
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0052 : Poly :=
[
  term ((-72 : Rat) / 67) [(5, 1), (9, 1)]
]

/-- Partial product 52 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0052 : Poly :=
[
  term ((144 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (12, 1)],
  term ((-72 : Rat) / 67) [(0, 2), (5, 1), (9, 1)],
  term ((144 : Rat) / 67) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((-72 : Rat) / 67) [(1, 2), (5, 1), (9, 1)],
  term ((-144 : Rat) / 67) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((72 : Rat) / 67) [(5, 1), (6, 2), (9, 1)],
  term ((-144 : Rat) / 67) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((72 : Rat) / 67) [(5, 1), (7, 2), (9, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0052
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0053 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 53 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0053 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-19496960 : Rat) / 110226591) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (6, 2), (10, 1), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (7, 2), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0053
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0054 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 54 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0054 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (6, 2), (10, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(5, 1), (7, 2), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0054
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0055 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 55 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0055 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (6, 2), (10, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (7, 2), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0055
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0056 : Poly :=
[
  term ((635412020 : Rat) / 110226591) [(5, 1), (11, 1)]
]

/-- Partial product 56 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0056 : Poly :=
[
  term ((-1270824040 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((635412020 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1)],
  term ((-1270824040 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((635412020 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1)],
  term ((1270824040 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-635412020 : Rat) / 110226591) [(5, 1), (6, 2), (11, 1)],
  term ((1270824040 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-635412020 : Rat) / 110226591) [(5, 1), (7, 2), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0056
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0057 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 57 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0057 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0057
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0058 : Poly :=
[
  term ((-738133760 : Rat) / 330679773) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 58 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0058 : Poly :=
[
  term ((1476267520 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-738133760 : Rat) / 330679773) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((1476267520 : Rat) / 330679773) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((-738133760 : Rat) / 330679773) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((-1476267520 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((738133760 : Rat) / 330679773) [(5, 1), (6, 2), (11, 1), (14, 1)],
  term ((-1476267520 : Rat) / 330679773) [(5, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((738133760 : Rat) / 330679773) [(5, 1), (7, 2), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0058
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0059 : Poly :=
[
  term ((-72243200 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 59 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0059 : Poly :=
[
  term ((144486400 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-72243200 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((144486400 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-72243200 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((-144486400 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((72243200 : Rat) / 110226591) [(5, 1), (6, 2), (11, 1), (15, 2)],
  term ((-144486400 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((72243200 : Rat) / 110226591) [(5, 1), (7, 2), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0059
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0060 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 60 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0060 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (6, 2), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (7, 2), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0060
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0061 : Poly :=
[
  term ((27008709 : Rat) / 12247399) [(5, 1), (13, 1)]
]

/-- Partial product 61 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0061 : Poly :=
[
  term ((-54017418 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((27008709 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1)],
  term ((-54017418 : Rat) / 12247399) [(1, 1), (5, 1), (13, 2)],
  term ((27008709 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1)],
  term ((54017418 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-27008709 : Rat) / 12247399) [(5, 1), (6, 2), (13, 1)],
  term ((54017418 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2)],
  term ((-27008709 : Rat) / 12247399) [(5, 1), (7, 2), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0061
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0062 : Poly :=
[
  term ((-11533340 : Rat) / 12247399) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 62 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0062 : Poly :=
[
  term ((23066680 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11533340 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((23066680 : Rat) / 12247399) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((-11533340 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((-23066680 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((11533340 : Rat) / 12247399) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((-23066680 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((11533340 : Rat) / 12247399) [(5, 1), (7, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0062
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0063 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 63 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0063 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(5, 1), (6, 2), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(5, 1), (7, 2), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0063
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0064 : Poly :=
[
  term ((310281112 : Rat) / 330679773) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 64 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0064 : Poly :=
[
  term ((-620562224 : Rat) / 330679773) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((310281112 : Rat) / 330679773) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-620562224 : Rat) / 330679773) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((310281112 : Rat) / 330679773) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((620562224 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-310281112 : Rat) / 330679773) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((620562224 : Rat) / 330679773) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-310281112 : Rat) / 330679773) [(5, 1), (7, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0064
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0065 : Poly :=
[
  term ((-430756774 : Rat) / 110226591) [(5, 1), (15, 1)]
]

/-- Partial product 65 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0065 : Poly :=
[
  term ((861513548 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-430756774 : Rat) / 110226591) [(0, 2), (5, 1), (15, 1)],
  term ((861513548 : Rat) / 110226591) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-430756774 : Rat) / 110226591) [(1, 2), (5, 1), (15, 1)],
  term ((-861513548 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((430756774 : Rat) / 110226591) [(5, 1), (6, 2), (15, 1)],
  term ((-861513548 : Rat) / 110226591) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((430756774 : Rat) / 110226591) [(5, 1), (7, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0065
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0066 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(5, 1), (15, 3)]
]

/-- Partial product 66 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0066 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(0, 2), (5, 1), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(1, 2), (5, 1), (15, 3)],
  term ((35164160 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (6, 2), (15, 3)],
  term ((35164160 : Rat) / 110226591) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (7, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0066
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0067 : Poly :=
[
  term ((-432987520 : Rat) / 330679773) [(7, 1), (11, 1)]
]

/-- Partial product 67 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0067 : Poly :=
[
  term ((865975040 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-432987520 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1)],
  term ((865975040 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-432987520 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1)],
  term ((-865975040 : Rat) / 330679773) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((432987520 : Rat) / 330679773) [(6, 2), (7, 1), (11, 1)],
  term ((-865975040 : Rat) / 330679773) [(7, 2), (11, 1), (13, 1)],
  term ((432987520 : Rat) / 330679773) [(7, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0067
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0068 : Poly :=
[
  term ((818809600 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 68 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0068 : Poly :=
[
  term ((-1637619200 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((818809600 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-1637619200 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((818809600 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((1637619200 : Rat) / 330679773) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-818809600 : Rat) / 330679773) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((1637619200 : Rat) / 330679773) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-818809600 : Rat) / 330679773) [(7, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0068
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0069 : Poly :=
[
  term ((-6765430 : Rat) / 12247399) [(7, 1), (13, 1)]
]

/-- Partial product 69 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0069 : Poly :=
[
  term ((13530860 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-6765430 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1)],
  term ((13530860 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2)],
  term ((-6765430 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1)],
  term ((-13530860 : Rat) / 12247399) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((6765430 : Rat) / 12247399) [(6, 2), (7, 1), (13, 1)],
  term ((-13530860 : Rat) / 12247399) [(7, 2), (13, 2)],
  term ((6765430 : Rat) / 12247399) [(7, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0069
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0070 : Poly :=
[
  term ((12793900 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 70 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0070 : Poly :=
[
  term ((-25587800 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((12793900 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-25587800 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((12793900 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((25587800 : Rat) / 12247399) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12793900 : Rat) / 12247399) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((25587800 : Rat) / 12247399) [(7, 2), (13, 2), (14, 1)],
  term ((-12793900 : Rat) / 12247399) [(7, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0070
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0071 : Poly :=
[
  term ((-738390800 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 71 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0071 : Poly :=
[
  term ((1476781600 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-738390800 : Rat) / 330679773) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((1476781600 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-738390800 : Rat) / 330679773) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1476781600 : Rat) / 330679773) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((738390800 : Rat) / 330679773) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term ((-1476781600 : Rat) / 330679773) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((738390800 : Rat) / 330679773) [(7, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0071
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0072 : Poly :=
[
  term ((346042289 : Rat) / 330679773) [(7, 1), (15, 1)]
]

/-- Partial product 72 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0072 : Poly :=
[
  term ((-692084578 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((346042289 : Rat) / 330679773) [(0, 2), (7, 1), (15, 1)],
  term ((-692084578 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((346042289 : Rat) / 330679773) [(1, 2), (7, 1), (15, 1)],
  term ((692084578 : Rat) / 330679773) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-346042289 : Rat) / 330679773) [(6, 2), (7, 1), (15, 1)],
  term ((692084578 : Rat) / 330679773) [(7, 2), (13, 1), (15, 1)],
  term ((-346042289 : Rat) / 330679773) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0072
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0073 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 73 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0073 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((19496960 : Rat) / 110226591) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((38993920 : Rat) / 110226591) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-19496960 : Rat) / 110226591) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((38993920 : Rat) / 110226591) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-19496960 : Rat) / 110226591) [(7, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0073
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0074 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 74 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0074 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((913920 : Rat) / 12247399) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((913920 : Rat) / 12247399) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-913920 : Rat) / 12247399) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(7, 1), (9, 1), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(7, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0074
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0075 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 75 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0075 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(7, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0075
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0076 : Poly :=
[
  term ((-535736500 : Rat) / 110226591) [(9, 1), (11, 1)]
]

/-- Partial product 76 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0076 : Poly :=
[
  term ((1071473000 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-535736500 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1)],
  term ((1071473000 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-535736500 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1)],
  term ((-1071473000 : Rat) / 110226591) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((535736500 : Rat) / 110226591) [(6, 2), (9, 1), (11, 1)],
  term ((-1071473000 : Rat) / 110226591) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((535736500 : Rat) / 110226591) [(7, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0076
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0077 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 77 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0077 : Poly :=
[
  term ((5483520 : Rat) / 12247399) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((5483520 : Rat) / 12247399) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-2741760 : Rat) / 12247399) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0077
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0078 : Poly :=
[
  term ((-1060460800 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 78 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0078 : Poly :=
[
  term ((2120921600 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1060460800 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((2120921600 : Rat) / 330679773) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1060460800 : Rat) / 330679773) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2120921600 : Rat) / 330679773) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1060460800 : Rat) / 330679773) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((-2120921600 : Rat) / 330679773) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((1060460800 : Rat) / 330679773) [(7, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0078
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0079 : Poly :=
[
  term ((72243200 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 79 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0079 : Poly :=
[
  term ((-144486400 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((72243200 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-144486400 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((72243200 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((144486400 : Rat) / 110226591) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-72243200 : Rat) / 110226591) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((144486400 : Rat) / 110226591) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-72243200 : Rat) / 110226591) [(7, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0079
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0080 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 80 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0080 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(7, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0080
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0081 : Poly :=
[
  term ((-22336419 : Rat) / 12247399) [(9, 1), (13, 1)]
]

/-- Partial product 81 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0081 : Poly :=
[
  term ((44672838 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-22336419 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1)],
  term ((44672838 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2)],
  term ((-22336419 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1)],
  term ((-44672838 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((22336419 : Rat) / 12247399) [(6, 2), (9, 1), (13, 1)],
  term ((-44672838 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2)],
  term ((22336419 : Rat) / 12247399) [(7, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0081
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0082 : Poly :=
[
  term ((-16569700 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 82 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0082 : Poly :=
[
  term ((33139400 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-16569700 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((33139400 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-16569700 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((-33139400 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((16569700 : Rat) / 12247399) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-33139400 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((16569700 : Rat) / 12247399) [(7, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0082
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0083 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 83 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0083 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(7, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0083
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0084 : Poly :=
[
  term ((1311665768 : Rat) / 330679773) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 84 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0084 : Poly :=
[
  term ((-2623331536 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-2623331536 : Rat) / 330679773) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((1311665768 : Rat) / 330679773) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((2623331536 : Rat) / 330679773) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1311665768 : Rat) / 330679773) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((2623331536 : Rat) / 330679773) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1311665768 : Rat) / 330679773) [(7, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0084
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0085 : Poly :=
[
  term ((400097042 : Rat) / 110226591) [(9, 1), (15, 1)]
]

/-- Partial product 85 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0085 : Poly :=
[
  term ((-800194084 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((400097042 : Rat) / 110226591) [(0, 2), (9, 1), (15, 1)],
  term ((-800194084 : Rat) / 110226591) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((400097042 : Rat) / 110226591) [(1, 2), (9, 1), (15, 1)],
  term ((800194084 : Rat) / 110226591) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-400097042 : Rat) / 110226591) [(6, 2), (9, 1), (15, 1)],
  term ((800194084 : Rat) / 110226591) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-400097042 : Rat) / 110226591) [(7, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0085
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0086 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(9, 1), (15, 3)]
]

/-- Partial product 86 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0086 : Poly :=
[
  term ((35164160 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(0, 2), (9, 1), (15, 3)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(1, 2), (9, 1), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(6, 1), (9, 1), (12, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(6, 2), (9, 1), (15, 3)],
  term ((-35164160 : Rat) / 110226591) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(7, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0086
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0087 : Poly :=
[
  term ((72 : Rat) / 67) [(9, 2)]
]

/-- Partial product 87 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0087 : Poly :=
[
  term ((-144 : Rat) / 67) [(0, 1), (9, 2), (12, 1)],
  term ((72 : Rat) / 67) [(0, 2), (9, 2)],
  term ((-144 : Rat) / 67) [(1, 1), (9, 2), (13, 1)],
  term ((72 : Rat) / 67) [(1, 2), (9, 2)],
  term ((144 : Rat) / 67) [(6, 1), (9, 2), (12, 1)],
  term ((-72 : Rat) / 67) [(6, 2), (9, 2)],
  term ((144 : Rat) / 67) [(7, 1), (9, 2), (13, 1)],
  term ((-72 : Rat) / 67) [(7, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0087
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0088 : Poly :=
[
  term ((578314240 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 88 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0088 : Poly :=
[
  term ((-1156628480 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((578314240 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1156628480 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((578314240 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((1156628480 : Rat) / 330679773) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-578314240 : Rat) / 330679773) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((1156628480 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-578314240 : Rat) / 330679773) [(7, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0088
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0089 : Poly :=
[
  term ((194969600 : Rat) / 110226591) [(11, 1), (13, 1)]
]

/-- Partial product 89 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0089 : Poly :=
[
  term ((-389939200 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((194969600 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1)],
  term ((-389939200 : Rat) / 110226591) [(1, 1), (11, 1), (13, 2)],
  term ((194969600 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1)],
  term ((389939200 : Rat) / 110226591) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-194969600 : Rat) / 110226591) [(6, 2), (11, 1), (13, 1)],
  term ((389939200 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2)],
  term ((-194969600 : Rat) / 110226591) [(7, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0089
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0090 : Poly :=
[
  term ((-578314240 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 90 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0090 : Poly :=
[
  term ((1156628480 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-578314240 : Rat) / 330679773) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((1156628480 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-578314240 : Rat) / 330679773) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1156628480 : Rat) / 330679773) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((578314240 : Rat) / 330679773) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1156628480 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((578314240 : Rat) / 330679773) [(7, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0090
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0091 : Poly :=
[
  term ((107233280 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 91 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0091 : Poly :=
[
  term ((-214466560 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((107233280 : Rat) / 110226591) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-214466560 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((107233280 : Rat) / 110226591) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((214466560 : Rat) / 110226591) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-107233280 : Rat) / 110226591) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((214466560 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-107233280 : Rat) / 110226591) [(7, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0091
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0092 : Poly :=
[
  term ((-10142030080 : Rat) / 330679773) [(11, 1), (15, 1)]
]

/-- Partial product 92 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0092 : Poly :=
[
  term ((20284060160 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-10142030080 : Rat) / 330679773) [(0, 2), (11, 1), (15, 1)],
  term ((20284060160 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10142030080 : Rat) / 330679773) [(1, 2), (11, 1), (15, 1)],
  term ((-20284060160 : Rat) / 330679773) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((10142030080 : Rat) / 330679773) [(6, 2), (11, 1), (15, 1)],
  term ((-20284060160 : Rat) / 330679773) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((10142030080 : Rat) / 330679773) [(7, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0092
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0093 : Poly :=
[
  term ((9036160 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 93 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0093 : Poly :=
[
  term ((-18072320 : Rat) / 12247399) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((9036160 : Rat) / 12247399) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18072320 : Rat) / 12247399) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((9036160 : Rat) / 12247399) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((18072320 : Rat) / 12247399) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-9036160 : Rat) / 12247399) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((18072320 : Rat) / 12247399) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-9036160 : Rat) / 12247399) [(7, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0093
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0094 : Poly :=
[
  term ((-521515520 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 94 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0094 : Poly :=
[
  term ((1043031040 : Rat) / 330679773) [(0, 1), (12, 2), (15, 2)],
  term ((-521515520 : Rat) / 330679773) [(0, 2), (12, 1), (15, 2)],
  term ((1043031040 : Rat) / 330679773) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-521515520 : Rat) / 330679773) [(1, 2), (12, 1), (15, 2)],
  term ((-1043031040 : Rat) / 330679773) [(6, 1), (12, 2), (15, 2)],
  term ((521515520 : Rat) / 330679773) [(6, 2), (12, 1), (15, 2)],
  term ((-1043031040 : Rat) / 330679773) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((521515520 : Rat) / 330679773) [(7, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0094
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0095 : Poly :=
[
  term ((657232640 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 95 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0095 : Poly :=
[
  term ((-1314465280 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((657232640 : Rat) / 330679773) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1314465280 : Rat) / 330679773) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((657232640 : Rat) / 330679773) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((1314465280 : Rat) / 330679773) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-657232640 : Rat) / 330679773) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((1314465280 : Rat) / 330679773) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-657232640 : Rat) / 330679773) [(7, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0095
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0096 : Poly :=
[
  term ((-1602043780 : Rat) / 110226591) [(13, 1), (15, 1)]
]

/-- Partial product 96 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0096 : Poly :=
[
  term ((3204087560 : Rat) / 110226591) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1602043780 : Rat) / 110226591) [(0, 2), (13, 1), (15, 1)],
  term ((3204087560 : Rat) / 110226591) [(1, 1), (13, 2), (15, 1)],
  term ((-1602043780 : Rat) / 110226591) [(1, 2), (13, 1), (15, 1)],
  term ((-3204087560 : Rat) / 110226591) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1602043780 : Rat) / 110226591) [(6, 2), (13, 1), (15, 1)],
  term ((-3204087560 : Rat) / 110226591) [(7, 1), (13, 2), (15, 1)],
  term ((1602043780 : Rat) / 110226591) [(7, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0096
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0097 : Poly :=
[
  term ((9139200 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 97 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0097 : Poly :=
[
  term ((-18278400 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)],
  term ((9139200 : Rat) / 12247399) [(0, 2), (13, 2)],
  term ((-18278400 : Rat) / 12247399) [(1, 1), (13, 3)],
  term ((9139200 : Rat) / 12247399) [(1, 2), (13, 2)],
  term ((18278400 : Rat) / 12247399) [(6, 1), (12, 1), (13, 2)],
  term ((-9139200 : Rat) / 12247399) [(6, 2), (13, 2)],
  term ((18278400 : Rat) / 12247399) [(7, 1), (13, 3)],
  term ((-9139200 : Rat) / 12247399) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0097
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0098 : Poly :=
[
  term ((-9036160 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 98 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0098 : Poly :=
[
  term ((18072320 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-9036160 : Rat) / 12247399) [(0, 2), (13, 2), (14, 1)],
  term ((18072320 : Rat) / 12247399) [(1, 1), (13, 3), (14, 1)],
  term ((-9036160 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((-18072320 : Rat) / 12247399) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((9036160 : Rat) / 12247399) [(6, 2), (13, 2), (14, 1)],
  term ((-18072320 : Rat) / 12247399) [(7, 1), (13, 3), (14, 1)],
  term ((9036160 : Rat) / 12247399) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0098
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 26. -/
def rs_R009_ueqv_R009NNNYN_coefficient_26_0099 : Poly :=
[
  term ((-96701440 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 99 for generator 26. -/
def rs_R009_ueqv_R009NNNYN_partial_26_0099 : Poly :=
[
  term ((193402880 : Rat) / 110226591) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-96701440 : Rat) / 110226591) [(0, 2), (14, 1), (15, 2)],
  term ((193402880 : Rat) / 110226591) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-96701440 : Rat) / 110226591) [(1, 2), (14, 1), (15, 2)],
  term ((-193402880 : Rat) / 110226591) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((96701440 : Rat) / 110226591) [(6, 2), (14, 1), (15, 2)],
  term ((-193402880 : Rat) / 110226591) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((96701440 : Rat) / 110226591) [(7, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 26. -/
theorem rs_R009_ueqv_R009NNNYN_partial_26_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_26_0099
        rs_R009_ueqv_R009NNNYN_generator_26_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_26_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_26_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_26_0000,
  rs_R009_ueqv_R009NNNYN_partial_26_0001,
  rs_R009_ueqv_R009NNNYN_partial_26_0002,
  rs_R009_ueqv_R009NNNYN_partial_26_0003,
  rs_R009_ueqv_R009NNNYN_partial_26_0004,
  rs_R009_ueqv_R009NNNYN_partial_26_0005,
  rs_R009_ueqv_R009NNNYN_partial_26_0006,
  rs_R009_ueqv_R009NNNYN_partial_26_0007,
  rs_R009_ueqv_R009NNNYN_partial_26_0008,
  rs_R009_ueqv_R009NNNYN_partial_26_0009,
  rs_R009_ueqv_R009NNNYN_partial_26_0010,
  rs_R009_ueqv_R009NNNYN_partial_26_0011,
  rs_R009_ueqv_R009NNNYN_partial_26_0012,
  rs_R009_ueqv_R009NNNYN_partial_26_0013,
  rs_R009_ueqv_R009NNNYN_partial_26_0014,
  rs_R009_ueqv_R009NNNYN_partial_26_0015,
  rs_R009_ueqv_R009NNNYN_partial_26_0016,
  rs_R009_ueqv_R009NNNYN_partial_26_0017,
  rs_R009_ueqv_R009NNNYN_partial_26_0018,
  rs_R009_ueqv_R009NNNYN_partial_26_0019,
  rs_R009_ueqv_R009NNNYN_partial_26_0020,
  rs_R009_ueqv_R009NNNYN_partial_26_0021,
  rs_R009_ueqv_R009NNNYN_partial_26_0022,
  rs_R009_ueqv_R009NNNYN_partial_26_0023,
  rs_R009_ueqv_R009NNNYN_partial_26_0024,
  rs_R009_ueqv_R009NNNYN_partial_26_0025,
  rs_R009_ueqv_R009NNNYN_partial_26_0026,
  rs_R009_ueqv_R009NNNYN_partial_26_0027,
  rs_R009_ueqv_R009NNNYN_partial_26_0028,
  rs_R009_ueqv_R009NNNYN_partial_26_0029,
  rs_R009_ueqv_R009NNNYN_partial_26_0030,
  rs_R009_ueqv_R009NNNYN_partial_26_0031,
  rs_R009_ueqv_R009NNNYN_partial_26_0032,
  rs_R009_ueqv_R009NNNYN_partial_26_0033,
  rs_R009_ueqv_R009NNNYN_partial_26_0034,
  rs_R009_ueqv_R009NNNYN_partial_26_0035,
  rs_R009_ueqv_R009NNNYN_partial_26_0036,
  rs_R009_ueqv_R009NNNYN_partial_26_0037,
  rs_R009_ueqv_R009NNNYN_partial_26_0038,
  rs_R009_ueqv_R009NNNYN_partial_26_0039,
  rs_R009_ueqv_R009NNNYN_partial_26_0040,
  rs_R009_ueqv_R009NNNYN_partial_26_0041,
  rs_R009_ueqv_R009NNNYN_partial_26_0042,
  rs_R009_ueqv_R009NNNYN_partial_26_0043,
  rs_R009_ueqv_R009NNNYN_partial_26_0044,
  rs_R009_ueqv_R009NNNYN_partial_26_0045,
  rs_R009_ueqv_R009NNNYN_partial_26_0046,
  rs_R009_ueqv_R009NNNYN_partial_26_0047,
  rs_R009_ueqv_R009NNNYN_partial_26_0048,
  rs_R009_ueqv_R009NNNYN_partial_26_0049,
  rs_R009_ueqv_R009NNNYN_partial_26_0050,
  rs_R009_ueqv_R009NNNYN_partial_26_0051,
  rs_R009_ueqv_R009NNNYN_partial_26_0052,
  rs_R009_ueqv_R009NNNYN_partial_26_0053,
  rs_R009_ueqv_R009NNNYN_partial_26_0054,
  rs_R009_ueqv_R009NNNYN_partial_26_0055,
  rs_R009_ueqv_R009NNNYN_partial_26_0056,
  rs_R009_ueqv_R009NNNYN_partial_26_0057,
  rs_R009_ueqv_R009NNNYN_partial_26_0058,
  rs_R009_ueqv_R009NNNYN_partial_26_0059,
  rs_R009_ueqv_R009NNNYN_partial_26_0060,
  rs_R009_ueqv_R009NNNYN_partial_26_0061,
  rs_R009_ueqv_R009NNNYN_partial_26_0062,
  rs_R009_ueqv_R009NNNYN_partial_26_0063,
  rs_R009_ueqv_R009NNNYN_partial_26_0064,
  rs_R009_ueqv_R009NNNYN_partial_26_0065,
  rs_R009_ueqv_R009NNNYN_partial_26_0066,
  rs_R009_ueqv_R009NNNYN_partial_26_0067,
  rs_R009_ueqv_R009NNNYN_partial_26_0068,
  rs_R009_ueqv_R009NNNYN_partial_26_0069,
  rs_R009_ueqv_R009NNNYN_partial_26_0070,
  rs_R009_ueqv_R009NNNYN_partial_26_0071,
  rs_R009_ueqv_R009NNNYN_partial_26_0072,
  rs_R009_ueqv_R009NNNYN_partial_26_0073,
  rs_R009_ueqv_R009NNNYN_partial_26_0074,
  rs_R009_ueqv_R009NNNYN_partial_26_0075,
  rs_R009_ueqv_R009NNNYN_partial_26_0076,
  rs_R009_ueqv_R009NNNYN_partial_26_0077,
  rs_R009_ueqv_R009NNNYN_partial_26_0078,
  rs_R009_ueqv_R009NNNYN_partial_26_0079,
  rs_R009_ueqv_R009NNNYN_partial_26_0080,
  rs_R009_ueqv_R009NNNYN_partial_26_0081,
  rs_R009_ueqv_R009NNNYN_partial_26_0082,
  rs_R009_ueqv_R009NNNYN_partial_26_0083,
  rs_R009_ueqv_R009NNNYN_partial_26_0084,
  rs_R009_ueqv_R009NNNYN_partial_26_0085,
  rs_R009_ueqv_R009NNNYN_partial_26_0086,
  rs_R009_ueqv_R009NNNYN_partial_26_0087,
  rs_R009_ueqv_R009NNNYN_partial_26_0088,
  rs_R009_ueqv_R009NNNYN_partial_26_0089,
  rs_R009_ueqv_R009NNNYN_partial_26_0090,
  rs_R009_ueqv_R009NNNYN_partial_26_0091,
  rs_R009_ueqv_R009NNNYN_partial_26_0092,
  rs_R009_ueqv_R009NNNYN_partial_26_0093,
  rs_R009_ueqv_R009NNNYN_partial_26_0094,
  rs_R009_ueqv_R009NNNYN_partial_26_0095,
  rs_R009_ueqv_R009NNNYN_partial_26_0096,
  rs_R009_ueqv_R009NNNYN_partial_26_0097,
  rs_R009_ueqv_R009NNNYN_partial_26_0098,
  rs_R009_ueqv_R009NNNYN_partial_26_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_26_0000_0099 : Poly :=
[
  term ((-1570096640 : Rat) / 330679773) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-24532760 : Rat) / 12247399) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((1415890720 : Rat) / 330679773) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((-439237120 : Rat) / 330679773) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((396097760 : Rat) / 330679773) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-6863080 : Rat) / 12247399) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((8186909696 : Rat) / 110226591) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-7382838208 : Rat) / 110226591) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (1, 1), (5, 1), (13, 2)],
  term ((133038080 : Rat) / 330679773) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-119971840 : Rat) / 330679773) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((2078720 : Rat) / 12247399) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-1709173760 : Rat) / 36742197) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((19901163520 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1153761280 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-17891829760 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((1153761280 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((-240352560 : Rat) / 12247399) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((310955680 : Rat) / 12247399) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((-17946584960 : Rat) / 330679773) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((1541308480 : Rat) / 36742197) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((1040445440 : Rat) / 330679773) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((16134596480 : Rat) / 330679773) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((-8588561120 : Rat) / 330679773) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((18027520 : Rat) / 12247399) [(0, 1), (1, 1), (13, 3)],
  term ((219618560 : Rat) / 330679773) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((3431540 : Rat) / 12247399) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-198048880 : Rat) / 330679773) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((-66519040 : Rat) / 330679773) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((-1039360 : Rat) / 12247399) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((59985920 : Rat) / 330679773) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((-576880640 : Rat) / 330679773) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((4294280560 : Rat) / 330679773) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-9013760 : Rat) / 12247399) [(0, 1), (1, 2), (13, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (1, 2), (15, 2)],
  term ((-3490242560 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-54535040 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((3147450880 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((37560320 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((15845760 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((-33871360 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((1209098240 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((18892160 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((-1090347520 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-126730240 : Rat) / 36742197) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((410600960 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((133530440 : Rat) / 36742197) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17821440 : Rat) / 12247399) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((-370274080 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((439237120 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (11, 1), (12, 1)],
  term ((6863080 : Rat) / 12247399) [(0, 1), (3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-396097760 : Rat) / 330679773) [(0, 1), (3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-219618560 : Rat) / 330679773) [(0, 1), (3, 1), (6, 2), (11, 1)],
  term ((-3431540 : Rat) / 12247399) [(0, 1), (3, 1), (6, 2), (13, 1)],
  term ((198048880 : Rat) / 330679773) [(0, 1), (3, 1), (6, 2), (15, 1)],
  term ((439237120 : Rat) / 330679773) [(0, 1), (3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-396097760 : Rat) / 330679773) [(0, 1), (3, 1), (7, 1), (13, 1), (15, 1)],
  term ((6863080 : Rat) / 12247399) [(0, 1), (3, 1), (7, 1), (13, 2)],
  term ((-219618560 : Rat) / 330679773) [(0, 1), (3, 1), (7, 2), (11, 1)],
  term ((-3431540 : Rat) / 12247399) [(0, 1), (3, 1), (7, 2), (13, 1)],
  term ((198048880 : Rat) / 330679773) [(0, 1), (3, 1), (7, 2), (15, 1)],
  term ((-1752970240 : Rat) / 110226591) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((2806146560 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((126730240 : Rat) / 36742197) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-82170480 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((43846040 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2530542880 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((1580803520 : Rat) / 110226591) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((17821440 : Rat) / 12247399) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((-114283520 : Rat) / 36742197) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (6, 2), (11, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (6, 2), (13, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (6, 2), (15, 1)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 1), (5, 1), (7, 1), (13, 2)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (7, 2), (11, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (7, 2), (13, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (7, 2), (15, 1)],
  term ((144 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (12, 1)],
  term ((38993920 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1270824040 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((-5483520 : Rat) / 12247399) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((1476267520 : Rat) / 330679773) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((144486400 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-54017418 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((23066680 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-620562224 : Rat) / 330679773) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((861513548 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((-133038080 : Rat) / 330679773) [(0, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-2078720 : Rat) / 12247399) [(0, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((119971840 : Rat) / 330679773) [(0, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1153761280 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((17891829760 : Rat) / 330679773) [(0, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((8588561120 : Rat) / 330679773) [(0, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(0, 1), (6, 1), (12, 1), (13, 2)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (6, 1), (12, 1), (15, 2)],
  term ((66519040 : Rat) / 330679773) [(0, 1), (6, 2), (7, 1), (11, 1)],
  term ((1039360 : Rat) / 12247399) [(0, 1), (6, 2), (7, 1), (13, 1)],
  term ((-59985920 : Rat) / 330679773) [(0, 1), (6, 2), (7, 1), (15, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (6, 2), (9, 1), (11, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (6, 2), (9, 1), (13, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (6, 2), (9, 1), (15, 1)],
  term ((576880640 : Rat) / 330679773) [(0, 1), (6, 2), (11, 1), (13, 1)],
  term ((-8945914880 : Rat) / 330679773) [(0, 1), (6, 2), (11, 1), (15, 1)],
  term ((-4294280560 : Rat) / 330679773) [(0, 1), (6, 2), (13, 1), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(0, 1), (6, 2), (13, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (6, 2), (15, 2)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (7, 1), (9, 1), (13, 2)],
  term ((865975040 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-1637619200 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((17891829760 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1153761280 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (13, 2)],
  term ((13530860 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((-25587800 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1476781600 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-692084578 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((8588561120 : Rat) / 330679773) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(0, 1), (7, 1), (13, 3)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (7, 2), (9, 1), (11, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (7, 2), (9, 1), (13, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (7, 2), (9, 1), (15, 1)],
  term ((49315840 : Rat) / 36742197) [(0, 1), (7, 2), (11, 1), (13, 1)],
  term ((-8945914880 : Rat) / 330679773) [(0, 1), (7, 2), (11, 1), (15, 1)],
  term ((-463812080 : Rat) / 36742197) [(0, 1), (7, 2), (13, 1), (15, 1)],
  term ((6935040 : Rat) / 12247399) [(0, 1), (7, 2), (13, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (7, 2), (15, 2)],
  term ((66519040 : Rat) / 330679773) [(0, 1), (7, 3), (11, 1)],
  term ((1039360 : Rat) / 12247399) [(0, 1), (7, 3), (13, 1)],
  term ((-59985920 : Rat) / 330679773) [(0, 1), (7, 3), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((1071473000 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((5483520 : Rat) / 12247399) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((2120921600 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-144486400 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((44672838 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((33139400 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2623331536 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-800194084 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-144 : Rat) / 67) [(0, 1), (9, 2), (12, 1)],
  term ((-389939200 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((1156628480 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-214466560 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((20284060160 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1156628480 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1314465280 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((3204087560 : Rat) / 110226591) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((-18278400 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)],
  term ((18072320 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((193402880 : Rat) / 110226591) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((-18072320 : Rat) / 12247399) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((1043031040 : Rat) / 330679773) [(0, 1), (12, 2), (15, 2)],
  term ((785048320 : Rat) / 330679773) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((12266380 : Rat) / 12247399) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((-707945360 : Rat) / 330679773) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((854586880 : Rat) / 36742197) [(0, 2), (1, 1), (11, 1)],
  term ((576880640 : Rat) / 330679773) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((-9950581760 : Rat) / 330679773) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((9013760 : Rat) / 12247399) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((-520222720 : Rat) / 330679773) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((120176280 : Rat) / 12247399) [(0, 2), (1, 1), (13, 1)],
  term ((-155477840 : Rat) / 12247399) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((8973292480 : Rat) / 330679773) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-770654240 : Rat) / 36742197) [(0, 2), (1, 1), (15, 1)],
  term ((1745121280 : Rat) / 330679773) [(0, 2), (2, 1), (5, 1), (11, 1)],
  term ((27267520 : Rat) / 12247399) [(0, 2), (2, 1), (5, 1), (13, 1)],
  term ((-1573725440 : Rat) / 330679773) [(0, 2), (2, 1), (5, 1), (15, 1)],
  term ((-18780160 : Rat) / 12247399) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-7922880 : Rat) / 12247399) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((16935680 : Rat) / 12247399) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((-604549120 : Rat) / 330679773) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-9446080 : Rat) / 12247399) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((63365120 : Rat) / 36742197) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-205300480 : Rat) / 330679773) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-66765220 : Rat) / 36742197) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((8910720 : Rat) / 12247399) [(0, 2), (2, 1), (13, 2)],
  term ((185137040 : Rat) / 330679773) [(0, 2), (2, 1), (15, 2)],
  term ((876485120 : Rat) / 110226591) [(0, 2), (3, 1), (11, 1)],
  term ((-1009523200 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((-1403073280 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((-15773800 : Rat) / 12247399) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((910373600 : Rat) / 330679773) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((41085240 : Rat) / 12247399) [(0, 2), (3, 1), (13, 1)],
  term ((-21923020 : Rat) / 12247399) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((1265271440 : Rat) / 330679773) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-790401760 : Rat) / 110226591) [(0, 2), (3, 1), (15, 1)],
  term ((-72 : Rat) / 67) [(0, 2), (5, 1), (9, 1)],
  term ((-19496960 : Rat) / 110226591) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((635412020 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1)],
  term ((8186909696 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((2741760 : Rat) / 12247399) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-738133760 : Rat) / 330679773) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((-72243200 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((383761392 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-7382838208 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((27008709 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1)],
  term ((-11533340 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((310281112 : Rat) / 330679773) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((-430756774 : Rat) / 110226591) [(0, 2), (5, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(0, 2), (5, 1), (15, 3)],
  term ((-432987520 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1)],
  term ((133038080 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((818809600 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((2078720 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((-119971840 : Rat) / 330679773) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-6765430 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1)],
  term ((12793900 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((-738390800 : Rat) / 330679773) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((346042289 : Rat) / 330679773) [(0, 2), (7, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((913920 : Rat) / 12247399) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((-535736500 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1)],
  term ((-26868251648 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-2741760 : Rat) / 12247399) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1060460800 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((72243200 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-22336419 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1)],
  term ((-16569700 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((1311665768 : Rat) / 330679773) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((400097042 : Rat) / 110226591) [(0, 2), (9, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(0, 2), (9, 1), (15, 3)],
  term ((72 : Rat) / 67) [(0, 2), (9, 2)],
  term ((1153761280 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-5771171840 : Rat) / 110226591) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1)],
  term ((-578314240 : Rat) / 330679773) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((107233280 : Rat) / 110226591) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-10142030080 : Rat) / 330679773) [(0, 2), (11, 1), (15, 1)],
  term ((-8344584800 : Rat) / 330679773) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((18027520 : Rat) / 12247399) [(0, 2), (12, 1), (13, 2)],
  term ((5204360320 : Rat) / 110226591) [(0, 2), (12, 1), (15, 2)],
  term ((657232640 : Rat) / 330679773) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1602043780 : Rat) / 110226591) [(0, 2), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(0, 2), (13, 2)],
  term ((-9036160 : Rat) / 12247399) [(0, 2), (13, 2), (14, 1)],
  term ((-96701440 : Rat) / 110226591) [(0, 2), (14, 1), (15, 2)],
  term ((219618560 : Rat) / 330679773) [(0, 3), (3, 1), (11, 1)],
  term ((3431540 : Rat) / 12247399) [(0, 3), (3, 1), (13, 1)],
  term ((-198048880 : Rat) / 330679773) [(0, 3), (3, 1), (15, 1)],
  term ((-4093454848 : Rat) / 110226591) [(0, 3), (5, 1), (11, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 3), (5, 1), (13, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 3), (5, 1), (15, 1)],
  term ((-66519040 : Rat) / 330679773) [(0, 3), (7, 1), (11, 1)],
  term ((-1039360 : Rat) / 12247399) [(0, 3), (7, 1), (13, 1)],
  term ((59985920 : Rat) / 330679773) [(0, 3), (7, 1), (15, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 3), (9, 1), (11, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 3), (9, 1), (13, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 3), (9, 1), (15, 1)],
  term ((-576880640 : Rat) / 330679773) [(0, 3), (11, 1), (13, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 3), (11, 1), (15, 1)],
  term ((4294280560 : Rat) / 330679773) [(0, 3), (13, 1), (15, 1)],
  term ((-9013760 : Rat) / 12247399) [(0, 3), (13, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 3), (15, 2)],
  term ((-3490242560 : Rat) / 330679773) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((3147450880 : Rat) / 330679773) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((-54535040 : Rat) / 12247399) [(1, 1), (2, 1), (5, 1), (13, 2)],
  term ((1570096640 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (11, 1), (12, 1)],
  term ((24532760 : Rat) / 12247399) [(1, 1), (2, 1), (6, 1), (12, 1), (13, 1)],
  term ((-1415890720 : Rat) / 330679773) [(1, 1), (2, 1), (6, 1), (12, 1), (15, 1)],
  term ((-785048320 : Rat) / 330679773) [(1, 1), (2, 1), (6, 2), (11, 1)],
  term ((-12266380 : Rat) / 12247399) [(1, 1), (2, 1), (6, 2), (13, 1)],
  term ((707945360 : Rat) / 330679773) [(1, 1), (2, 1), (6, 2), (15, 1)],
  term ((2584225280 : Rat) / 330679773) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((-2330417440 : Rat) / 330679773) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((40378520 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((-785048320 : Rat) / 330679773) [(1, 1), (2, 1), (7, 2), (11, 1)],
  term ((-12266380 : Rat) / 12247399) [(1, 1), (2, 1), (7, 2), (13, 1)],
  term ((707945360 : Rat) / 330679773) [(1, 1), (2, 1), (7, 2), (15, 1)],
  term ((1209098240 : Rat) / 330679773) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((-1090347520 : Rat) / 330679773) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((18892160 : Rat) / 12247399) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((410600960 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-126730240 : Rat) / 36742197) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((-370274080 : Rat) / 330679773) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((133530440 : Rat) / 36742197) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-17821440 : Rat) / 12247399) [(1, 1), (2, 1), (13, 3)],
  term ((126730240 : Rat) / 36742197) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1752970240 : Rat) / 110226591) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((2806146560 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-114283520 : Rat) / 36742197) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((17821440 : Rat) / 12247399) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((-2530542880 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((1580803520 : Rat) / 110226591) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-82170480 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2)],
  term ((43846040 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((144 : Rat) / 67) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((38993920 : Rat) / 110226591) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((-1270824040 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((1476267520 : Rat) / 330679773) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((144486400 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-620562224 : Rat) / 330679773) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((861513548 : Rat) / 110226591) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((-54017418 : Rat) / 12247399) [(1, 1), (5, 1), (13, 2)],
  term ((23066680 : Rat) / 12247399) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((1709173760 : Rat) / 36742197) [(1, 1), (6, 1), (11, 1), (12, 1)],
  term ((-19901163520 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((1153761280 : Rat) / 330679773) [(1, 1), (6, 1), (11, 1), (12, 2)],
  term ((240352560 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1)],
  term ((-310955680 : Rat) / 12247399) [(1, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((17946584960 : Rat) / 330679773) [(1, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1541308480 : Rat) / 36742197) [(1, 1), (6, 1), (12, 1), (15, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 1), (6, 1), (12, 2), (13, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 1), (6, 1), (12, 2), (15, 1)],
  term ((-854586880 : Rat) / 36742197) [(1, 1), (6, 2), (11, 1)],
  term ((-576880640 : Rat) / 330679773) [(1, 1), (6, 2), (11, 1), (12, 1)],
  term ((9950581760 : Rat) / 330679773) [(1, 1), (6, 2), (11, 1), (14, 1)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (6, 2), (12, 1), (13, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (6, 2), (12, 1), (15, 1)],
  term ((-120176280 : Rat) / 12247399) [(1, 1), (6, 2), (13, 1)],
  term ((155477840 : Rat) / 12247399) [(1, 1), (6, 2), (13, 1), (14, 1)],
  term ((-8973292480 : Rat) / 330679773) [(1, 1), (6, 2), (14, 1), (15, 1)],
  term ((770654240 : Rat) / 36742197) [(1, 1), (6, 2), (15, 1)],
  term ((1153761280 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((16248538880 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((-2393198080 : Rat) / 36742197) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((2158151840 : Rat) / 36742197) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-14563860898 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((253883420 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2)],
  term ((-336543480 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-854586880 : Rat) / 36742197) [(1, 1), (7, 2), (11, 1)],
  term ((-576880640 : Rat) / 330679773) [(1, 1), (7, 2), (11, 1), (12, 1)],
  term ((9950581760 : Rat) / 330679773) [(1, 1), (7, 2), (11, 1), (14, 1)],
  term ((-9013760 : Rat) / 12247399) [(1, 1), (7, 2), (12, 1), (13, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 1), (7, 2), (12, 1), (15, 1)],
  term ((-120176280 : Rat) / 12247399) [(1, 1), (7, 2), (13, 1)],
  term ((155477840 : Rat) / 12247399) [(1, 1), (7, 2), (13, 1), (14, 1)],
  term ((-8973292480 : Rat) / 330679773) [(1, 1), (7, 2), (14, 1), (15, 1)],
  term ((770654240 : Rat) / 36742197) [(1, 1), (7, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((1071473000 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((2120921600 : Rat) / 330679773) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((-144486400 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-2623331536 : Rat) / 330679773) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-800194084 : Rat) / 110226591) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((44672838 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2)],
  term ((33139400 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((-144 : Rat) / 67) [(1, 1), (9, 2), (13, 1)],
  term ((-1156628480 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-214466560 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((20284060160 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(1, 1), (11, 1), (13, 2)],
  term ((1156628480 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((1043031040 : Rat) / 330679773) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18072320 : Rat) / 12247399) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((193402880 : Rat) / 110226591) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1314465280 : Rat) / 330679773) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((3204087560 : Rat) / 110226591) [(1, 1), (13, 2), (15, 1)],
  term ((-18278400 : Rat) / 12247399) [(1, 1), (13, 3)],
  term ((18072320 : Rat) / 12247399) [(1, 1), (13, 3), (14, 1)],
  term ((1745121280 : Rat) / 330679773) [(1, 2), (2, 1), (5, 1), (11, 1)],
  term ((27267520 : Rat) / 12247399) [(1, 2), (2, 1), (5, 1), (13, 1)],
  term ((-1573725440 : Rat) / 330679773) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((-18780160 : Rat) / 12247399) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((-7922880 : Rat) / 12247399) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((16935680 : Rat) / 12247399) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-604549120 : Rat) / 330679773) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((-9446080 : Rat) / 12247399) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((545173760 : Rat) / 330679773) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-999810560 : Rat) / 330679773) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-205300480 : Rat) / 330679773) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((815003740 : Rat) / 330679773) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-15622040 : Rat) / 12247399) [(1, 2), (2, 1), (13, 2)],
  term ((185137040 : Rat) / 330679773) [(1, 2), (2, 1), (15, 2)],
  term ((876485120 : Rat) / 110226591) [(1, 2), (3, 1), (11, 1)],
  term ((-63365120 : Rat) / 36742197) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((-1403073280 : Rat) / 330679773) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-8910720 : Rat) / 12247399) [(1, 2), (3, 1), (12, 1), (13, 1)],
  term ((57141760 : Rat) / 36742197) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((41085240 : Rat) / 12247399) [(1, 2), (3, 1), (13, 1)],
  term ((-21923020 : Rat) / 12247399) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((1265271440 : Rat) / 330679773) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-790401760 : Rat) / 110226591) [(1, 2), (3, 1), (15, 1)],
  term ((-72 : Rat) / 67) [(1, 2), (5, 1), (9, 1)],
  term ((-19496960 : Rat) / 110226591) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((635412020 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1)],
  term ((2741760 : Rat) / 12247399) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-738133760 : Rat) / 330679773) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((-72243200 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((27008709 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1)],
  term ((-11533340 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((310281112 : Rat) / 330679773) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-430756774 : Rat) / 110226591) [(1, 2), (5, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 2), (5, 1), (15, 3)],
  term ((-432987520 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1)],
  term ((818809600 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-6765430 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1)],
  term ((12793900 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-738390800 : Rat) / 330679773) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((346042289 : Rat) / 330679773) [(1, 2), (7, 1), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((913920 : Rat) / 12247399) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-535736500 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1)],
  term ((-2741760 : Rat) / 12247399) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1060460800 : Rat) / 330679773) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((72243200 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-22336419 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1)],
  term ((-16569700 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((1311665768 : Rat) / 330679773) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((400097042 : Rat) / 110226591) [(1, 2), (9, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(1, 2), (9, 1), (15, 3)],
  term ((72 : Rat) / 67) [(1, 2), (9, 2)],
  term ((-1153761280 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((578314240 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-4932551680 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1)],
  term ((6440949760 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((107233280 : Rat) / 110226591) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-10142030080 : Rat) / 330679773) [(1, 2), (11, 1), (15, 1)],
  term ((1284421760 : Rat) / 330679773) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 2), (12, 1), (13, 2)],
  term ((-521515520 : Rat) / 330679773) [(1, 2), (12, 1), (15, 2)],
  term ((-5763117440 : Rat) / 110226591) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((3021881660 : Rat) / 110226591) [(1, 2), (13, 1), (15, 1)],
  term ((-231213360 : Rat) / 12247399) [(1, 2), (13, 2)],
  term ((301919520 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((-96701440 : Rat) / 110226591) [(1, 2), (14, 1), (15, 2)],
  term ((785048320 : Rat) / 330679773) [(1, 3), (2, 1), (11, 1)],
  term ((12266380 : Rat) / 12247399) [(1, 3), (2, 1), (13, 1)],
  term ((-707945360 : Rat) / 330679773) [(1, 3), (2, 1), (15, 1)],
  term ((854586880 : Rat) / 36742197) [(1, 3), (11, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 3), (11, 1), (12, 1)],
  term ((-9950581760 : Rat) / 330679773) [(1, 3), (11, 1), (14, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 3), (12, 1), (13, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 3), (12, 1), (15, 1)],
  term ((120176280 : Rat) / 12247399) [(1, 3), (13, 1)],
  term ((-155477840 : Rat) / 12247399) [(1, 3), (13, 1), (14, 1)],
  term ((8973292480 : Rat) / 330679773) [(1, 3), (14, 1), (15, 1)],
  term ((-770654240 : Rat) / 36742197) [(1, 3), (15, 1)],
  term ((3490242560 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1)],
  term ((54535040 : Rat) / 12247399) [(2, 1), (5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-3147450880 : Rat) / 330679773) [(2, 1), (5, 1), (6, 1), (12, 1), (15, 1)],
  term ((-1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (6, 2), (11, 1)],
  term ((-27267520 : Rat) / 12247399) [(2, 1), (5, 1), (6, 2), (13, 1)],
  term ((1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (6, 2), (15, 1)],
  term ((3490242560 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-3147450880 : Rat) / 330679773) [(2, 1), (5, 1), (7, 1), (13, 1), (15, 1)],
  term ((54535040 : Rat) / 12247399) [(2, 1), (5, 1), (7, 1), (13, 2)],
  term ((-1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (7, 2), (11, 1)],
  term ((-27267520 : Rat) / 12247399) [(2, 1), (5, 1), (7, 2), (13, 1)],
  term ((1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (7, 2), (15, 1)],
  term ((-37560320 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (11, 1), (12, 1)],
  term ((-15845760 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (12, 1), (13, 1)],
  term ((33871360 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((126730240 : Rat) / 36742197) [(2, 1), (6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-410600960 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-133530440 : Rat) / 36742197) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((17821440 : Rat) / 12247399) [(2, 1), (6, 1), (12, 1), (13, 2)],
  term ((370274080 : Rat) / 330679773) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((18780160 : Rat) / 12247399) [(2, 1), (6, 2), (7, 1), (11, 1)],
  term ((7922880 : Rat) / 12247399) [(2, 1), (6, 2), (7, 1), (13, 1)],
  term ((-16935680 : Rat) / 12247399) [(2, 1), (6, 2), (7, 1), (15, 1)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (6, 2), (9, 1), (11, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (6, 2), (9, 1), (13, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (6, 2), (9, 1), (15, 1)],
  term ((-63365120 : Rat) / 36742197) [(2, 1), (6, 2), (11, 1), (13, 1)],
  term ((205300480 : Rat) / 330679773) [(2, 1), (6, 2), (11, 1), (15, 1)],
  term ((66765220 : Rat) / 36742197) [(2, 1), (6, 2), (13, 1), (15, 1)],
  term ((-8910720 : Rat) / 12247399) [(2, 1), (6, 2), (13, 2)],
  term ((-185137040 : Rat) / 330679773) [(2, 1), (6, 2), (15, 2)],
  term ((-1209098240 : Rat) / 330679773) [(2, 1), (7, 1), (9, 1), (11, 1), (13, 1)],
  term ((1090347520 : Rat) / 330679773) [(2, 1), (7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-18892160 : Rat) / 12247399) [(2, 1), (7, 1), (9, 1), (13, 2)],
  term ((-410600960 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((126730240 : Rat) / 36742197) [(2, 1), (7, 1), (11, 1), (13, 2)],
  term ((370274080 : Rat) / 330679773) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((-133530440 : Rat) / 36742197) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((17821440 : Rat) / 12247399) [(2, 1), (7, 1), (13, 3)],
  term ((604549120 : Rat) / 330679773) [(2, 1), (7, 2), (9, 1), (11, 1)],
  term ((9446080 : Rat) / 12247399) [(2, 1), (7, 2), (9, 1), (13, 1)],
  term ((-545173760 : Rat) / 330679773) [(2, 1), (7, 2), (9, 1), (15, 1)],
  term ((-176046080 : Rat) / 36742197) [(2, 1), (7, 2), (11, 1), (13, 1)],
  term ((205300480 : Rat) / 330679773) [(2, 1), (7, 2), (11, 1), (15, 1)],
  term ((168379300 : Rat) / 36742197) [(2, 1), (7, 2), (13, 1), (15, 1)],
  term ((-24756480 : Rat) / 12247399) [(2, 1), (7, 2), (13, 2)],
  term ((-185137040 : Rat) / 330679773) [(2, 1), (7, 2), (15, 2)],
  term ((18780160 : Rat) / 12247399) [(2, 1), (7, 3), (11, 1)],
  term ((7922880 : Rat) / 12247399) [(2, 1), (7, 3), (13, 1)],
  term ((-16935680 : Rat) / 12247399) [(2, 1), (7, 3), (15, 1)],
  term ((1752970240 : Rat) / 110226591) [(3, 1), (6, 1), (11, 1), (12, 1)],
  term ((-2806146560 : Rat) / 330679773) [(3, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-126730240 : Rat) / 36742197) [(3, 1), (6, 1), (11, 1), (12, 2)],
  term ((82170480 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1)],
  term ((-43846040 : Rat) / 12247399) [(3, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((2530542880 : Rat) / 330679773) [(3, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1580803520 : Rat) / 110226591) [(3, 1), (6, 1), (12, 1), (15, 1)],
  term ((-17821440 : Rat) / 12247399) [(3, 1), (6, 1), (12, 2), (13, 1)],
  term ((114283520 : Rat) / 36742197) [(3, 1), (6, 1), (12, 2), (15, 1)],
  term ((-876485120 : Rat) / 110226591) [(3, 1), (6, 2), (11, 1)],
  term ((63365120 : Rat) / 36742197) [(3, 1), (6, 2), (11, 1), (12, 1)],
  term ((1403073280 : Rat) / 330679773) [(3, 1), (6, 2), (11, 1), (14, 1)],
  term ((8910720 : Rat) / 12247399) [(3, 1), (6, 2), (12, 1), (13, 1)],
  term ((-57141760 : Rat) / 36742197) [(3, 1), (6, 2), (12, 1), (15, 1)],
  term ((-41085240 : Rat) / 12247399) [(3, 1), (6, 2), (13, 1)],
  term ((21923020 : Rat) / 12247399) [(3, 1), (6, 2), (13, 1), (14, 1)],
  term ((-1265271440 : Rat) / 330679773) [(3, 1), (6, 2), (14, 1), (15, 1)],
  term ((790401760 : Rat) / 110226591) [(3, 1), (6, 2), (15, 1)],
  term ((-126730240 : Rat) / 36742197) [(3, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((1752970240 : Rat) / 110226591) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((-2806146560 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((114283520 : Rat) / 36742197) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-17821440 : Rat) / 12247399) [(3, 1), (7, 1), (12, 1), (13, 2)],
  term ((2530542880 : Rat) / 330679773) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1580803520 : Rat) / 110226591) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((82170480 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2)],
  term ((-43846040 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-876485120 : Rat) / 110226591) [(3, 1), (7, 2), (11, 1)],
  term ((63365120 : Rat) / 36742197) [(3, 1), (7, 2), (11, 1), (12, 1)],
  term ((1403073280 : Rat) / 330679773) [(3, 1), (7, 2), (11, 1), (14, 1)],
  term ((8910720 : Rat) / 12247399) [(3, 1), (7, 2), (12, 1), (13, 1)],
  term ((-57141760 : Rat) / 36742197) [(3, 1), (7, 2), (12, 1), (15, 1)],
  term ((-41085240 : Rat) / 12247399) [(3, 1), (7, 2), (13, 1)],
  term ((21923020 : Rat) / 12247399) [(3, 1), (7, 2), (13, 1), (14, 1)],
  term ((-1265271440 : Rat) / 330679773) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((790401760 : Rat) / 110226591) [(3, 1), (7, 2), (15, 1)],
  term ((-144 : Rat) / 67) [(5, 1), (6, 1), (9, 1), (12, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 1), (6, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (6, 1), (10, 1), (12, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(5, 1), (6, 1), (10, 1), (12, 1), (15, 1)],
  term ((1270824040 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1476267520 : Rat) / 330679773) [(5, 1), (6, 1), (11, 1), (12, 1), (14, 1)],
  term ((-144486400 : Rat) / 110226591) [(5, 1), (6, 1), (11, 1), (12, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (6, 1), (11, 2), (12, 1), (15, 1)],
  term ((54017418 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1)],
  term ((-23066680 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (6, 1), (12, 1), (13, 1), (15, 2)],
  term ((620562224 : Rat) / 330679773) [(5, 1), (6, 1), (12, 1), (14, 1), (15, 1)],
  term ((-861513548 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(5, 1), (6, 1), (12, 1), (15, 3)],
  term ((72 : Rat) / 67) [(5, 1), (6, 2), (9, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (6, 2), (10, 1), (11, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (6, 2), (10, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (6, 2), (10, 1), (15, 1)],
  term ((-635412020 : Rat) / 110226591) [(5, 1), (6, 2), (11, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (6, 2), (11, 1), (13, 1), (15, 1)],
  term ((738133760 : Rat) / 330679773) [(5, 1), (6, 2), (11, 1), (14, 1)],
  term ((72243200 : Rat) / 110226591) [(5, 1), (6, 2), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (6, 2), (11, 2), (15, 1)],
  term ((-27008709 : Rat) / 12247399) [(5, 1), (6, 2), (13, 1)],
  term ((11533340 : Rat) / 12247399) [(5, 1), (6, 2), (13, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (6, 2), (13, 1), (15, 2)],
  term ((-310281112 : Rat) / 330679773) [(5, 1), (6, 2), (14, 1), (15, 1)],
  term ((430756774 : Rat) / 110226591) [(5, 1), (6, 2), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (6, 2), (15, 3)],
  term ((-144 : Rat) / 67) [(5, 1), (7, 1), (9, 1), (13, 1)],
  term ((-38993920 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((35164160 : Rat) / 110226591) [(5, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (7, 1), (10, 1), (13, 2)],
  term ((1270824040 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (13, 1)],
  term ((-1476267520 : Rat) / 330679773) [(5, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-144486400 : Rat) / 110226591) [(5, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((5483520 : Rat) / 12247399) [(5, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(5, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((620562224 : Rat) / 330679773) [(5, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-861513548 : Rat) / 110226591) [(5, 1), (7, 1), (13, 1), (15, 1)],
  term ((35164160 : Rat) / 110226591) [(5, 1), (7, 1), (13, 1), (15, 3)],
  term ((54017418 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2)],
  term ((-23066680 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2), (14, 1)],
  term ((-1827840 : Rat) / 12247399) [(5, 1), (7, 1), (13, 2), (15, 2)],
  term ((72 : Rat) / 67) [(5, 1), (7, 2), (9, 1)],
  term ((19496960 : Rat) / 110226591) [(5, 1), (7, 2), (10, 1), (11, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (7, 2), (10, 1), (13, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (7, 2), (10, 1), (15, 1)],
  term ((-635412020 : Rat) / 110226591) [(5, 1), (7, 2), (11, 1)],
  term ((-2741760 : Rat) / 12247399) [(5, 1), (7, 2), (11, 1), (13, 1), (15, 1)],
  term ((738133760 : Rat) / 330679773) [(5, 1), (7, 2), (11, 1), (14, 1)],
  term ((72243200 : Rat) / 110226591) [(5, 1), (7, 2), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(5, 1), (7, 2), (11, 2), (15, 1)],
  term ((-27008709 : Rat) / 12247399) [(5, 1), (7, 2), (13, 1)],
  term ((11533340 : Rat) / 12247399) [(5, 1), (7, 2), (13, 1), (14, 1)],
  term ((913920 : Rat) / 12247399) [(5, 1), (7, 2), (13, 1), (15, 2)],
  term ((-310281112 : Rat) / 330679773) [(5, 1), (7, 2), (14, 1), (15, 1)],
  term ((430756774 : Rat) / 110226591) [(5, 1), (7, 2), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(5, 1), (7, 2), (15, 3)],
  term ((-865975040 : Rat) / 330679773) [(6, 1), (7, 1), (11, 1), (12, 1)],
  term ((1637619200 : Rat) / 330679773) [(6, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-13530860 : Rat) / 12247399) [(6, 1), (7, 1), (12, 1), (13, 1)],
  term ((25587800 : Rat) / 12247399) [(6, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1476781600 : Rat) / 330679773) [(6, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((692084578 : Rat) / 330679773) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(6, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((1827840 : Rat) / 12247399) [(6, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(6, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-1071473000 : Rat) / 110226591) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-5483520 : Rat) / 12247399) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2120921600 : Rat) / 330679773) [(6, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((144486400 : Rat) / 110226591) [(6, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(6, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-44672838 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-33139400 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(6, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((2623331536 : Rat) / 330679773) [(6, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((800194084 : Rat) / 110226591) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(6, 1), (9, 1), (12, 1), (15, 3)],
  term ((144 : Rat) / 67) [(6, 1), (9, 2), (12, 1)],
  term ((389939200 : Rat) / 110226591) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((-1156628480 : Rat) / 330679773) [(6, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((214466560 : Rat) / 110226591) [(6, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-20284060160 : Rat) / 330679773) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((1156628480 : Rat) / 330679773) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((1314465280 : Rat) / 330679773) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3204087560 : Rat) / 110226591) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((18278400 : Rat) / 12247399) [(6, 1), (12, 1), (13, 2)],
  term ((-18072320 : Rat) / 12247399) [(6, 1), (12, 1), (13, 2), (14, 1)],
  term ((-193402880 : Rat) / 110226591) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((18072320 : Rat) / 12247399) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-1043031040 : Rat) / 330679773) [(6, 1), (12, 2), (15, 2)],
  term ((432987520 : Rat) / 330679773) [(6, 2), (7, 1), (11, 1)],
  term ((-818809600 : Rat) / 330679773) [(6, 2), (7, 1), (11, 1), (14, 1)],
  term ((6765430 : Rat) / 12247399) [(6, 2), (7, 1), (13, 1)],
  term ((-12793900 : Rat) / 12247399) [(6, 2), (7, 1), (13, 1), (14, 1)],
  term ((738390800 : Rat) / 330679773) [(6, 2), (7, 1), (14, 1), (15, 1)],
  term ((-346042289 : Rat) / 330679773) [(6, 2), (7, 1), (15, 1)],
  term ((-19496960 : Rat) / 110226591) [(6, 2), (9, 1), (10, 1), (11, 1)],
  term ((-913920 : Rat) / 12247399) [(6, 2), (9, 1), (10, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(6, 2), (9, 1), (10, 1), (15, 1)],
  term ((535736500 : Rat) / 110226591) [(6, 2), (9, 1), (11, 1)],
  term ((2741760 : Rat) / 12247399) [(6, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1060460800 : Rat) / 330679773) [(6, 2), (9, 1), (11, 1), (14, 1)],
  term ((-72243200 : Rat) / 110226591) [(6, 2), (9, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(6, 2), (9, 1), (11, 2), (15, 1)],
  term ((22336419 : Rat) / 12247399) [(6, 2), (9, 1), (13, 1)],
  term ((16569700 : Rat) / 12247399) [(6, 2), (9, 1), (13, 1), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(6, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1311665768 : Rat) / 330679773) [(6, 2), (9, 1), (14, 1), (15, 1)],
  term ((-400097042 : Rat) / 110226591) [(6, 2), (9, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(6, 2), (9, 1), (15, 3)],
  term ((-72 : Rat) / 67) [(6, 2), (9, 2)],
  term ((-578314240 : Rat) / 330679773) [(6, 2), (11, 1), (12, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(6, 2), (11, 1), (13, 1)],
  term ((578314240 : Rat) / 330679773) [(6, 2), (11, 1), (13, 1), (14, 1)],
  term ((-107233280 : Rat) / 110226591) [(6, 2), (11, 1), (14, 1), (15, 1)],
  term ((10142030080 : Rat) / 330679773) [(6, 2), (11, 1), (15, 1)],
  term ((-9036160 : Rat) / 12247399) [(6, 2), (12, 1), (13, 1), (15, 1)],
  term ((521515520 : Rat) / 330679773) [(6, 2), (12, 1), (15, 2)],
  term ((-657232640 : Rat) / 330679773) [(6, 2), (13, 1), (14, 1), (15, 1)],
  term ((1602043780 : Rat) / 110226591) [(6, 2), (13, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(6, 2), (13, 2)],
  term ((9036160 : Rat) / 12247399) [(6, 2), (13, 2), (14, 1)],
  term ((96701440 : Rat) / 110226591) [(6, 2), (14, 1), (15, 2)],
  term ((38993920 : Rat) / 110226591) [(7, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(7, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(7, 1), (9, 1), (10, 1), (13, 2)],
  term ((-1071473000 : Rat) / 110226591) [(7, 1), (9, 1), (11, 1), (13, 1)],
  term ((-2120921600 : Rat) / 330679773) [(7, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((144486400 : Rat) / 110226591) [(7, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(7, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(7, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((2623331536 : Rat) / 330679773) [(7, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((800194084 : Rat) / 110226591) [(7, 1), (9, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(7, 1), (9, 1), (13, 1), (15, 3)],
  term ((-44672838 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2)],
  term ((-33139400 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((1827840 : Rat) / 12247399) [(7, 1), (9, 1), (13, 2), (15, 2)],
  term ((144 : Rat) / 67) [(7, 1), (9, 2), (13, 1)],
  term ((1156628480 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((214466560 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-20284060160 : Rat) / 330679773) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(7, 1), (11, 1), (13, 2)],
  term ((-1156628480 : Rat) / 330679773) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-1043031040 : Rat) / 330679773) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((18072320 : Rat) / 12247399) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-193402880 : Rat) / 110226591) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((1314465280 : Rat) / 330679773) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3204087560 : Rat) / 110226591) [(7, 1), (13, 2), (15, 1)],
  term ((18278400 : Rat) / 12247399) [(7, 1), (13, 3)],
  term ((-18072320 : Rat) / 12247399) [(7, 1), (13, 3), (14, 1)],
  term ((-19496960 : Rat) / 110226591) [(7, 2), (9, 1), (10, 1), (11, 1)],
  term ((-913920 : Rat) / 12247399) [(7, 2), (9, 1), (10, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(7, 2), (9, 1), (10, 1), (15, 1)],
  term ((535736500 : Rat) / 110226591) [(7, 2), (9, 1), (11, 1)],
  term ((2741760 : Rat) / 12247399) [(7, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((1060460800 : Rat) / 330679773) [(7, 2), (9, 1), (11, 1), (14, 1)],
  term ((-72243200 : Rat) / 110226591) [(7, 2), (9, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(7, 2), (9, 1), (11, 2), (15, 1)],
  term ((22336419 : Rat) / 12247399) [(7, 2), (9, 1), (13, 1)],
  term ((16569700 : Rat) / 12247399) [(7, 2), (9, 1), (13, 1), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(7, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1311665768 : Rat) / 330679773) [(7, 2), (9, 1), (14, 1), (15, 1)],
  term ((-400097042 : Rat) / 110226591) [(7, 2), (9, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(7, 2), (9, 1), (15, 3)],
  term ((-72 : Rat) / 67) [(7, 2), (9, 2)],
  term ((-578314240 : Rat) / 330679773) [(7, 2), (11, 1), (12, 1), (15, 1)],
  term ((-1450883840 : Rat) / 330679773) [(7, 2), (11, 1), (13, 1)],
  term ((738644480 : Rat) / 110226591) [(7, 2), (11, 1), (13, 1), (14, 1)],
  term ((-107233280 : Rat) / 110226591) [(7, 2), (11, 1), (14, 1), (15, 1)],
  term ((10142030080 : Rat) / 330679773) [(7, 2), (11, 1), (15, 1)],
  term ((-9036160 : Rat) / 12247399) [(7, 2), (12, 1), (13, 1), (15, 1)],
  term ((521515520 : Rat) / 330679773) [(7, 2), (12, 1), (15, 2)],
  term ((-711338080 : Rat) / 110226591) [(7, 2), (13, 1), (14, 1), (15, 1)],
  term ((5498215918 : Rat) / 330679773) [(7, 2), (13, 1), (15, 1)],
  term ((-22670060 : Rat) / 12247399) [(7, 2), (13, 2)],
  term ((34623960 : Rat) / 12247399) [(7, 2), (13, 2), (14, 1)],
  term ((96701440 : Rat) / 110226591) [(7, 2), (14, 1), (15, 2)],
  term ((432987520 : Rat) / 330679773) [(7, 3), (11, 1)],
  term ((-818809600 : Rat) / 330679773) [(7, 3), (11, 1), (14, 1)],
  term ((6765430 : Rat) / 12247399) [(7, 3), (13, 1)],
  term ((-12793900 : Rat) / 12247399) [(7, 3), (13, 1), (14, 1)],
  term ((738390800 : Rat) / 330679773) [(7, 3), (14, 1), (15, 1)],
  term ((-346042289 : Rat) / 330679773) [(7, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 26, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNYN_block_26_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_26_0000_0099
      rs_R009_ueqv_R009NNNYN_block_26_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
