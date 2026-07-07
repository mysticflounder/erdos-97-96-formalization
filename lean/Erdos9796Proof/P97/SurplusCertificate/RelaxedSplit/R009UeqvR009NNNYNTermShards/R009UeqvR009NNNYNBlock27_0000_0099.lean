/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 27:0-99

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 : Poly :=
[
  term (-2 : Rat) [(0, 1), (12, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (13, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(12, 1), (14, 1)],
  term (2 : Rat) [(13, 1), (15, 1)],
  term (-1 : Rat) [(14, 2)],
  term (-1 : Rat) [(15, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0000 : Poly :=
[
  term ((-219618560 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1)]
]

/-- Partial product 0 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0000 : Poly :=
[
  term ((439237120 : Rat) / 330679773) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-219618560 : Rat) / 330679773) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-439237120 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-439237120 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((219618560 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((219618560 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((439237120 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((-219618560 : Rat) / 330679773) [(0, 3), (3, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0000_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0000
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0001 : Poly :=
[
  term ((-3431540 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1)]
]

/-- Partial product 1 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0001 : Poly :=
[
  term ((6863080 : Rat) / 12247399) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((-3431540 : Rat) / 12247399) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((-6863080 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((3431540 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((3431540 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-6863080 : Rat) / 12247399) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((6863080 : Rat) / 12247399) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((-3431540 : Rat) / 12247399) [(0, 3), (3, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0001_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0001
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0002 : Poly :=
[
  term ((198048880 : Rat) / 330679773) [(0, 1), (3, 1), (15, 1)]
]

/-- Partial product 2 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0002 : Poly :=
[
  term ((-396097760 : Rat) / 330679773) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((198048880 : Rat) / 330679773) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((396097760 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((396097760 : Rat) / 330679773) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-198048880 : Rat) / 330679773) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-198048880 : Rat) / 330679773) [(0, 1), (3, 1), (15, 3)],
  term ((-396097760 : Rat) / 330679773) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((198048880 : Rat) / 330679773) [(0, 3), (3, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0002_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0002
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0003 : Poly :=
[
  term ((4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1)]
]

/-- Partial product 3 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0003 : Poly :=
[
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 2)],
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((-8186909696 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 3), (5, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0003_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0003
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0004 : Poly :=
[
  term ((191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1)]
]

/-- Partial product 4 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0004 : Poly :=
[
  term ((-383761392 : Rat) / 12247399) [(0, 1), (1, 1), (5, 1), (13, 2)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 3), (5, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0004_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0004
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0005 : Poly :=
[
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (15, 1)]
]

/-- Partial product 5 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0005 : Poly :=
[
  term ((7382838208 : Rat) / 110226591) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((-7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-7382838208 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (15, 3)],
  term ((7382838208 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 3), (5, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0005_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0005
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0006 : Poly :=
[
  term ((66519040 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1)]
]

/-- Partial product 6 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0006 : Poly :=
[
  term ((-133038080 : Rat) / 330679773) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((66519040 : Rat) / 330679773) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((133038080 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((133038080 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-66519040 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-66519040 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-133038080 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((66519040 : Rat) / 330679773) [(0, 3), (7, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0006_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0006
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0007 : Poly :=
[
  term ((1039360 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1)]
]

/-- Partial product 7 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0007 : Poly :=
[
  term ((-2078720 : Rat) / 12247399) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((1039360 : Rat) / 12247399) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((2078720 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1039360 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-1039360 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((2078720 : Rat) / 12247399) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((-2078720 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((1039360 : Rat) / 12247399) [(0, 3), (7, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0007_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0007
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0007 := by
  native_decide

/-- Coefficient term 8 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0008 : Poly :=
[
  term ((-59985920 : Rat) / 330679773) [(0, 1), (7, 1), (15, 1)]
]

/-- Partial product 8 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0008 : Poly :=
[
  term ((119971840 : Rat) / 330679773) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-59985920 : Rat) / 330679773) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-119971840 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-119971840 : Rat) / 330679773) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((59985920 : Rat) / 330679773) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((59985920 : Rat) / 330679773) [(0, 1), (7, 1), (15, 3)],
  term ((119971840 : Rat) / 330679773) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-59985920 : Rat) / 330679773) [(0, 3), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 8 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0008_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0008
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0008 := by
  native_decide

/-- Coefficient term 9 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0009 : Poly :=
[
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1)]
]

/-- Partial product 9 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0009 : Poly :=
[
  term ((26868251648 : Rat) / 330679773) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((26868251648 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 3), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 9 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0009_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0009
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0009 := by
  native_decide

/-- Coefficient term 10 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0010 : Poly :=
[
  term ((-209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1)]
]

/-- Partial product 10 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0010 : Poly :=
[
  term ((419816432 : Rat) / 12247399) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 3), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 10 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0010_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0010
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0010 := by
  native_decide

/-- Coefficient term 11 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0011 : Poly :=
[
  term ((12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (15, 1)]
]

/-- Partial product 11 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0011 : Poly :=
[
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (15, 3)],
  term ((-24229405504 : Rat) / 330679773) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 3), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 11 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0011_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0011
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0011 := by
  native_decide

/-- Coefficient term 12 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0012 : Poly :=
[
  term ((576880640 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1)]
]

/-- Partial product 12 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0012 : Poly :=
[
  term ((-1153761280 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((576880640 : Rat) / 330679773) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((1153761280 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-576880640 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-576880640 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((1153761280 : Rat) / 330679773) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((-1153761280 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((576880640 : Rat) / 330679773) [(0, 3), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 12 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0012_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0012
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0012 := by
  native_decide

/-- Coefficient term 13 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0013 : Poly :=
[
  term ((-8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (15, 1)]
]

/-- Partial product 13 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0013 : Poly :=
[
  term ((17891829760 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-8945914880 : Rat) / 330679773) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-17891829760 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17891829760 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (15, 3)],
  term ((17891829760 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((-8945914880 : Rat) / 330679773) [(0, 3), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 13 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0013_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0013
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0013 := by
  native_decide

/-- Coefficient term 14 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0014 : Poly :=
[
  term ((-4294280560 : Rat) / 330679773) [(0, 1), (13, 1), (15, 1)]
]

/-- Partial product 14 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0014 : Poly :=
[
  term ((8588561120 : Rat) / 330679773) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-4294280560 : Rat) / 330679773) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((-8588561120 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((4294280560 : Rat) / 330679773) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((4294280560 : Rat) / 330679773) [(0, 1), (13, 1), (15, 3)],
  term ((-8588561120 : Rat) / 330679773) [(0, 1), (13, 2), (15, 2)],
  term ((8588561120 : Rat) / 330679773) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-4294280560 : Rat) / 330679773) [(0, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 14 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0014_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0014
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0014 := by
  native_decide

/-- Coefficient term 15 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0015 : Poly :=
[
  term ((9013760 : Rat) / 12247399) [(0, 1), (13, 2)]
]

/-- Partial product 15 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0015 : Poly :=
[
  term ((-18027520 : Rat) / 12247399) [(0, 1), (1, 1), (13, 3)],
  term ((9013760 : Rat) / 12247399) [(0, 1), (1, 2), (13, 2)],
  term ((18027520 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-9013760 : Rat) / 12247399) [(0, 1), (13, 2), (14, 2)],
  term ((-9013760 : Rat) / 12247399) [(0, 1), (13, 2), (15, 2)],
  term ((18027520 : Rat) / 12247399) [(0, 1), (13, 3), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(0, 2), (12, 1), (13, 2)],
  term ((9013760 : Rat) / 12247399) [(0, 3), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 15 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0015_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0015
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0015 := by
  native_decide

/-- Coefficient term 16 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0016 : Poly :=
[
  term ((8067298240 : Rat) / 330679773) [(0, 1), (15, 2)]
]

/-- Partial product 16 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0016 : Poly :=
[
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (1, 2), (15, 2)],
  term ((16134596480 : Rat) / 330679773) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((16134596480 : Rat) / 330679773) [(0, 1), (13, 1), (15, 3)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (14, 2), (15, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (15, 4)],
  term ((-16134596480 : Rat) / 330679773) [(0, 2), (12, 1), (15, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 16 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0016_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0016
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0016 := by
  native_decide

/-- Coefficient term 17 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0017 : Poly :=
[
  term ((-785048320 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1)]
]

/-- Partial product 17 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0017 : Poly :=
[
  term ((1570096640 : Rat) / 330679773) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((-785048320 : Rat) / 330679773) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-1570096640 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1570096640 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((785048320 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((785048320 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((1570096640 : Rat) / 330679773) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-785048320 : Rat) / 330679773) [(1, 3), (2, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 17 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0017_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0017
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0017 := by
  native_decide

/-- Coefficient term 18 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0018 : Poly :=
[
  term ((-12266380 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1)]
]

/-- Partial product 18 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0018 : Poly :=
[
  term ((24532760 : Rat) / 12247399) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((-12266380 : Rat) / 12247399) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((-24532760 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((12266380 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((12266380 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-24532760 : Rat) / 12247399) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((24532760 : Rat) / 12247399) [(1, 2), (2, 1), (13, 2)],
  term ((-12266380 : Rat) / 12247399) [(1, 3), (2, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 18 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0018_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0018
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0018 := by
  native_decide

/-- Coefficient term 19 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0019 : Poly :=
[
  term ((707945360 : Rat) / 330679773) [(1, 1), (2, 1), (15, 1)]
]

/-- Partial product 19 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0019 : Poly :=
[
  term ((-1415890720 : Rat) / 330679773) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((707945360 : Rat) / 330679773) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((1415890720 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((1415890720 : Rat) / 330679773) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((-707945360 : Rat) / 330679773) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-707945360 : Rat) / 330679773) [(1, 1), (2, 1), (15, 3)],
  term ((-1415890720 : Rat) / 330679773) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((707945360 : Rat) / 330679773) [(1, 3), (2, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 19 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0019_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0019
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0019 := by
  native_decide

/-- Coefficient term 20 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0020 : Poly :=
[
  term ((-854586880 : Rat) / 36742197) [(1, 1), (11, 1)]
]

/-- Partial product 20 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0020 : Poly :=
[
  term ((1709173760 : Rat) / 36742197) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-854586880 : Rat) / 36742197) [(0, 2), (1, 1), (11, 1)],
  term ((-1709173760 : Rat) / 36742197) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1709173760 : Rat) / 36742197) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((854586880 : Rat) / 36742197) [(1, 1), (11, 1), (14, 2)],
  term ((854586880 : Rat) / 36742197) [(1, 1), (11, 1), (15, 2)],
  term ((1709173760 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1)],
  term ((-854586880 : Rat) / 36742197) [(1, 3), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 20 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0020_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0020
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0020 := by
  native_decide

/-- Coefficient term 21 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0021 : Poly :=
[
  term ((-576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1)]
]

/-- Partial product 21 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0021 : Poly :=
[
  term ((1153761280 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((-576880640 : Rat) / 330679773) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((1153761280 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-576880640 : Rat) / 330679773) [(1, 3), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 21 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0021_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0021
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0021 := by
  native_decide

/-- Coefficient term 22 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0022 : Poly :=
[
  term ((9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1)]
]

/-- Partial product 22 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0022 : Poly :=
[
  term ((-19901163520 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((9950581760 : Rat) / 330679773) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (14, 3)],
  term ((-19901163520 : Rat) / 330679773) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((9950581760 : Rat) / 330679773) [(1, 3), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 22 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0022_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0022
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0022 := by
  native_decide

/-- Coefficient term 23 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0023 : Poly :=
[
  term ((-9013760 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1)]
]

/-- Partial product 23 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0023 : Poly :=
[
  term ((18027520 : Rat) / 12247399) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-9013760 : Rat) / 12247399) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((9013760 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 2), (12, 1), (13, 2)],
  term ((-9013760 : Rat) / 12247399) [(1, 3), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 23 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0023_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0023
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0023 := by
  native_decide

/-- Coefficient term 24 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0024 : Poly :=
[
  term ((520222720 : Rat) / 330679773) [(1, 1), (12, 1), (15, 1)]
]

/-- Partial product 24 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0024 : Poly :=
[
  term ((-1040445440 : Rat) / 330679773) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (12, 1), (15, 3)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 3), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 24 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0024_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0024
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0024 := by
  native_decide

/-- Coefficient term 25 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0025 : Poly :=
[
  term ((-120176280 : Rat) / 12247399) [(1, 1), (13, 1)]
]

/-- Partial product 25 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0025 : Poly :=
[
  term ((240352560 : Rat) / 12247399) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-120176280 : Rat) / 12247399) [(0, 2), (1, 1), (13, 1)],
  term ((-240352560 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((120176280 : Rat) / 12247399) [(1, 1), (13, 1), (14, 2)],
  term ((120176280 : Rat) / 12247399) [(1, 1), (13, 1), (15, 2)],
  term ((-240352560 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)],
  term ((240352560 : Rat) / 12247399) [(1, 2), (13, 2)],
  term ((-120176280 : Rat) / 12247399) [(1, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 25 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0025_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0025
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0025 := by
  native_decide

/-- Coefficient term 26 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0026 : Poly :=
[
  term ((155477840 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1)]
]

/-- Partial product 26 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0026 : Poly :=
[
  term ((-310955680 : Rat) / 12247399) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((155477840 : Rat) / 12247399) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((310955680 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((-155477840 : Rat) / 12247399) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((-155477840 : Rat) / 12247399) [(1, 1), (13, 1), (14, 3)],
  term ((310955680 : Rat) / 12247399) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-310955680 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((155477840 : Rat) / 12247399) [(1, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 26 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0026_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0026
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0026 := by
  native_decide

/-- Coefficient term 27 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0027 : Poly :=
[
  term ((-8973292480 : Rat) / 330679773) [(1, 1), (14, 1), (15, 1)]
]

/-- Partial product 27 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0027 : Poly :=
[
  term ((17946584960 : Rat) / 330679773) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-8973292480 : Rat) / 330679773) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((-17946584960 : Rat) / 330679773) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-17946584960 : Rat) / 330679773) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((8973292480 : Rat) / 330679773) [(1, 1), (14, 1), (15, 3)],
  term ((8973292480 : Rat) / 330679773) [(1, 1), (14, 3), (15, 1)],
  term ((17946584960 : Rat) / 330679773) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-8973292480 : Rat) / 330679773) [(1, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 27 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0027_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0027
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0027 := by
  native_decide

/-- Coefficient term 28 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0028 : Poly :=
[
  term ((770654240 : Rat) / 36742197) [(1, 1), (15, 1)]
]

/-- Partial product 28 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0028 : Poly :=
[
  term ((-1541308480 : Rat) / 36742197) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((770654240 : Rat) / 36742197) [(0, 2), (1, 1), (15, 1)],
  term ((1541308480 : Rat) / 36742197) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((1541308480 : Rat) / 36742197) [(1, 1), (13, 1), (15, 2)],
  term ((-770654240 : Rat) / 36742197) [(1, 1), (14, 2), (15, 1)],
  term ((-770654240 : Rat) / 36742197) [(1, 1), (15, 3)],
  term ((-1541308480 : Rat) / 36742197) [(1, 2), (13, 1), (15, 1)],
  term ((770654240 : Rat) / 36742197) [(1, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 28 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0028_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0028
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0028 := by
  native_decide

/-- Coefficient term 29 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0029 : Poly :=
[
  term ((-1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1)]
]

/-- Partial product 29 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0029 : Poly :=
[
  term ((3490242560 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((-1745121280 : Rat) / 330679773) [(0, 2), (2, 1), (5, 1), (11, 1)],
  term ((3490242560 : Rat) / 330679773) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((-1745121280 : Rat) / 330679773) [(1, 2), (2, 1), (5, 1), (11, 1)],
  term ((-3490242560 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3490242560 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 29 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0029_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0029
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0029 := by
  native_decide

/-- Coefficient term 30 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0030 : Poly :=
[
  term ((-27267520 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1)]
]

/-- Partial product 30 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0030 : Poly :=
[
  term ((54535040 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-27267520 : Rat) / 12247399) [(0, 2), (2, 1), (5, 1), (13, 1)],
  term ((54535040 : Rat) / 12247399) [(1, 1), (2, 1), (5, 1), (13, 2)],
  term ((-27267520 : Rat) / 12247399) [(1, 2), (2, 1), (5, 1), (13, 1)],
  term ((-54535040 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((27267520 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((27267520 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-54535040 : Rat) / 12247399) [(2, 1), (5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 30 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0030_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0030
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0030 := by
  native_decide

/-- Coefficient term 31 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0031 : Poly :=
[
  term ((1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (15, 1)]
]

/-- Partial product 31 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0031 : Poly :=
[
  term ((-3147450880 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((1573725440 : Rat) / 330679773) [(0, 2), (2, 1), (5, 1), (15, 1)],
  term ((-3147450880 : Rat) / 330679773) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((1573725440 : Rat) / 330679773) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((3147450880 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((3147450880 : Rat) / 330679773) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 31 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0031_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0031
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0031 := by
  native_decide

/-- Coefficient term 32 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0032 : Poly :=
[
  term ((848270080 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1)]
]

/-- Partial product 32 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0032 : Poly :=
[
  term ((-1696540160 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((848270080 : Rat) / 330679773) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((-1696540160 : Rat) / 330679773) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((848270080 : Rat) / 330679773) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((1696540160 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((1696540160 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-848270080 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-848270080 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 32 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0032_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0032
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0032 := by
  native_decide

/-- Coefficient term 33 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0033 : Poly :=
[
  term ((13254220 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1)]
]

/-- Partial product 33 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0033 : Poly :=
[
  term ((-26508440 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((13254220 : Rat) / 12247399) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-26508440 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((13254220 : Rat) / 12247399) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((26508440 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-13254220 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-13254220 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((26508440 : Rat) / 12247399) [(2, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 33 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0033_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0033
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0033 := by
  native_decide

/-- Coefficient term 34 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0034 : Poly :=
[
  term ((-764957840 : Rat) / 330679773) [(2, 1), (7, 1), (15, 1)]
]

/-- Partial product 34 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0034 : Poly :=
[
  term ((1529915680 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-764957840 : Rat) / 330679773) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((1529915680 : Rat) / 330679773) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-764957840 : Rat) / 330679773) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((-1529915680 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1529915680 : Rat) / 330679773) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((764957840 : Rat) / 330679773) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((764957840 : Rat) / 330679773) [(2, 1), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 34 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0034_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0034
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0034 := by
  native_decide

/-- Coefficient term 35 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0035 : Poly :=
[
  term ((604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1)]
]

/-- Partial product 35 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0035 : Poly :=
[
  term ((-1209098240 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((604549120 : Rat) / 330679773) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((-1209098240 : Rat) / 330679773) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((604549120 : Rat) / 330679773) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 35 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0035_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0035
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0035 := by
  native_decide

/-- Coefficient term 36 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0036 : Poly :=
[
  term ((9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1)]
]

/-- Partial product 36 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0036 : Poly :=
[
  term ((-18892160 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((9446080 : Rat) / 12247399) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((-18892160 : Rat) / 12247399) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((9446080 : Rat) / 12247399) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 36 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0036_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0036
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0036 := by
  native_decide

/-- Coefficient term 37 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0037 : Poly :=
[
  term ((-545173760 : Rat) / 330679773) [(2, 1), (9, 1), (15, 1)]
]

/-- Partial product 37 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0037 : Poly :=
[
  term ((1090347520 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((1090347520 : Rat) / 330679773) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-545173760 : Rat) / 330679773) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 37 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0037_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0037
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0037 := by
  native_decide

/-- Coefficient term 38 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0038 : Poly :=
[
  term ((1529651200 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1)]
]

/-- Partial product 38 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0038 : Poly :=
[
  term ((-3059302400 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((1529651200 : Rat) / 330679773) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-3059302400 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((1529651200 : Rat) / 330679773) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((3059302400 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1529651200 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-1529651200 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((3059302400 : Rat) / 330679773) [(2, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 38 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0038_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0038
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0038 := by
  native_decide

/-- Coefficient term 39 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0039 : Poly :=
[
  term ((-54476800 : Rat) / 6239241) [(2, 1), (11, 1), (15, 1)]
]

/-- Partial product 39 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0039 : Poly :=
[
  term ((108953600 : Rat) / 6239241) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((-54476800 : Rat) / 6239241) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((108953600 : Rat) / 6239241) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-54476800 : Rat) / 6239241) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-108953600 : Rat) / 6239241) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-108953600 : Rat) / 6239241) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((54476800 : Rat) / 6239241) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((54476800 : Rat) / 6239241) [(2, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 39 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0039_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0039
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0039 := by
  native_decide

/-- Coefficient term 40 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0040 : Poly :=
[
  term ((-2597484800 : Rat) / 330679773) [(2, 1), (13, 1), (15, 1)]
]

/-- Partial product 40 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0040 : Poly :=
[
  term ((5194969600 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2597484800 : Rat) / 330679773) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((5194969600 : Rat) / 330679773) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-2597484800 : Rat) / 330679773) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((-5194969600 : Rat) / 330679773) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((2597484800 : Rat) / 330679773) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((2597484800 : Rat) / 330679773) [(2, 1), (13, 1), (15, 3)],
  term ((-5194969600 : Rat) / 330679773) [(2, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 40 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0040_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0040
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0040 := by
  native_decide

/-- Coefficient term 41 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0041 : Poly :=
[
  term ((23900800 : Rat) / 12247399) [(2, 1), (13, 2)]
]

/-- Partial product 41 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0041 : Poly :=
[
  term ((-47801600 : Rat) / 12247399) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((23900800 : Rat) / 12247399) [(0, 2), (2, 1), (13, 2)],
  term ((-47801600 : Rat) / 12247399) [(1, 1), (2, 1), (13, 3)],
  term ((23900800 : Rat) / 12247399) [(1, 2), (2, 1), (13, 2)],
  term ((47801600 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((-23900800 : Rat) / 12247399) [(2, 1), (13, 2), (14, 2)],
  term ((-23900800 : Rat) / 12247399) [(2, 1), (13, 2), (15, 2)],
  term ((47801600 : Rat) / 12247399) [(2, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 41 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0041_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0041
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0041 := by
  native_decide

/-- Coefficient term 42 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0042 : Poly :=
[
  term ((49126400 : Rat) / 6239241) [(2, 1), (15, 2)]
]

/-- Partial product 42 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0042 : Poly :=
[
  term ((-98252800 : Rat) / 6239241) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((49126400 : Rat) / 6239241) [(0, 2), (2, 1), (15, 2)],
  term ((-98252800 : Rat) / 6239241) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((49126400 : Rat) / 6239241) [(1, 2), (2, 1), (15, 2)],
  term ((98252800 : Rat) / 6239241) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((98252800 : Rat) / 6239241) [(2, 1), (13, 1), (15, 3)],
  term ((-49126400 : Rat) / 6239241) [(2, 1), (14, 2), (15, 2)],
  term ((-49126400 : Rat) / 6239241) [(2, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 42 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0042_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0042
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0042 := by
  native_decide

/-- Coefficient term 43 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0043 : Poly :=
[
  term ((69381760 : Rat) / 330679773) [(3, 1), (11, 1)]
]

/-- Partial product 43 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0043 : Poly :=
[
  term ((-138763520 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((69381760 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1)],
  term ((-138763520 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((69381760 : Rat) / 330679773) [(1, 2), (3, 1), (11, 1)],
  term ((138763520 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((138763520 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((-69381760 : Rat) / 330679773) [(3, 1), (11, 1), (14, 2)],
  term ((-69381760 : Rat) / 330679773) [(3, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 43 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0043_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0043
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0043 := by
  native_decide

/-- Coefficient term 44 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0044 : Poly :=
[
  term ((-78722560 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1)]
]

/-- Partial product 44 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0044 : Poly :=
[
  term ((157445120 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-78722560 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((157445120 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-78722560 : Rat) / 330679773) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((-157445120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((78722560 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((78722560 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-157445120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 44 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0044_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0044
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0044 := by
  native_decide

/-- Coefficient term 45 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0045 : Poly :=
[
  term ((-1572515840 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1)]
]

/-- Partial product 45 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0045 : Poly :=
[
  term ((3145031680 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1572515840 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((3145031680 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1572515840 : Rat) / 330679773) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-3145031680 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((-3145031680 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((1572515840 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((1572515840 : Rat) / 330679773) [(3, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 45 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0045_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0045
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0045 := by
  native_decide

/-- Coefficient term 46 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0046 : Poly :=
[
  term ((-1230040 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1)]
]

/-- Partial product 46 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0046 : Poly :=
[
  term ((2460080 : Rat) / 12247399) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((-1230040 : Rat) / 12247399) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((2460080 : Rat) / 12247399) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((-1230040 : Rat) / 12247399) [(1, 2), (3, 1), (12, 1), (13, 1)],
  term ((1230040 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((1230040 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2460080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-2460080 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 46 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0046_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0046
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0046 := by
  native_decide

/-- Coefficient term 47 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0047 : Poly :=
[
  term ((70990880 : Rat) / 330679773) [(3, 1), (12, 1), (15, 1)]
]

/-- Partial product 47 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0047 : Poly :=
[
  term ((-141981760 : Rat) / 330679773) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((70990880 : Rat) / 330679773) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((-141981760 : Rat) / 330679773) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((70990880 : Rat) / 330679773) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((141981760 : Rat) / 330679773) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-70990880 : Rat) / 330679773) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-70990880 : Rat) / 330679773) [(3, 1), (12, 1), (15, 3)],
  term ((141981760 : Rat) / 330679773) [(3, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 47 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0047_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0047
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0047 := by
  native_decide

/-- Coefficient term 48 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0048 : Poly :=
[
  term ((1084090 : Rat) / 12247399) [(3, 1), (13, 1)]
]

/-- Partial product 48 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0048 : Poly :=
[
  term ((-2168180 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((1084090 : Rat) / 12247399) [(0, 2), (3, 1), (13, 1)],
  term ((-2168180 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2)],
  term ((1084090 : Rat) / 12247399) [(1, 2), (3, 1), (13, 1)],
  term ((2168180 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1084090 : Rat) / 12247399) [(3, 1), (13, 1), (14, 2)],
  term ((-1084090 : Rat) / 12247399) [(3, 1), (13, 1), (15, 2)],
  term ((2168180 : Rat) / 12247399) [(3, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 48 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0048_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0048
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0048 := by
  native_decide

/-- Coefficient term 49 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0049 : Poly :=
[
  term ((-24570560 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1)]
]

/-- Partial product 49 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0049 : Poly :=
[
  term ((49141120 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-24570560 : Rat) / 12247399) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((49141120 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-24570560 : Rat) / 12247399) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((-49141120 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((24570560 : Rat) / 12247399) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((24570560 : Rat) / 12247399) [(3, 1), (13, 1), (14, 3)],
  term ((-49141120 : Rat) / 12247399) [(3, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 49 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0049_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0049
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0049 := by
  native_decide

/-- Coefficient term 50 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0050 : Poly :=
[
  term ((1418072320 : Rat) / 330679773) [(3, 1), (14, 1), (15, 1)]
]

/-- Partial product 50 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0050 : Poly :=
[
  term ((-2836144640 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((1418072320 : Rat) / 330679773) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-2836144640 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((1418072320 : Rat) / 330679773) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((2836144640 : Rat) / 330679773) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((2836144640 : Rat) / 330679773) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1418072320 : Rat) / 330679773) [(3, 1), (14, 1), (15, 3)],
  term ((-1418072320 : Rat) / 330679773) [(3, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 50 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0050_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0050
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0050 := by
  native_decide

/-- Coefficient term 51 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0051 : Poly :=
[
  term ((-62567480 : Rat) / 330679773) [(3, 1), (15, 1)]
]

/-- Partial product 51 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0051 : Poly :=
[
  term ((125134960 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((-62567480 : Rat) / 330679773) [(0, 2), (3, 1), (15, 1)],
  term ((125134960 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-62567480 : Rat) / 330679773) [(1, 2), (3, 1), (15, 1)],
  term ((-125134960 : Rat) / 330679773) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((-125134960 : Rat) / 330679773) [(3, 1), (13, 1), (15, 2)],
  term ((62567480 : Rat) / 330679773) [(3, 1), (14, 2), (15, 1)],
  term ((62567480 : Rat) / 330679773) [(3, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 51 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0051_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0051
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0051 := by
  native_decide

/-- Coefficient term 52 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0052 : Poly :=
[
  term ((366 : Rat) / 67) [(5, 1), (9, 1)]
]

/-- Partial product 52 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0052 : Poly :=
[
  term ((-732 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (12, 1)],
  term ((366 : Rat) / 67) [(0, 2), (5, 1), (9, 1)],
  term ((-732 : Rat) / 67) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((366 : Rat) / 67) [(1, 2), (5, 1), (9, 1)],
  term ((732 : Rat) / 67) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((732 : Rat) / 67) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-366 : Rat) / 67) [(5, 1), (9, 1), (14, 2)],
  term ((-366 : Rat) / 67) [(5, 1), (9, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 52 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0052_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0052
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0052 := by
  native_decide

/-- Coefficient term 53 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0053 : Poly :=
[
  term ((-1284649081856 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1)]
]

/-- Partial product 53 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0053 : Poly :=
[
  term ((2569298163712 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((-1284649081856 : Rat) / 31414578435) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((2569298163712 : Rat) / 31414578435) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-1284649081856 : Rat) / 31414578435) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((-2569298163712 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2569298163712 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1284649081856 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((1284649081856 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 53 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0053_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0053
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0053 := by
  native_decide

/-- Coefficient term 54 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0054 : Poly :=
[
  term ((-20072641904 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1)]
]

/-- Partial product 54 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0054 : Poly :=
[
  term ((40145283808 : Rat) / 1163502905) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-20072641904 : Rat) / 1163502905) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((40145283808 : Rat) / 1163502905) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((-20072641904 : Rat) / 1163502905) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((-40145283808 : Rat) / 1163502905) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((20072641904 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((20072641904 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-40145283808 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 54 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0054_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0054
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0054 := by
  native_decide

/-- Coefficient term 55 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0055 : Poly :=
[
  term ((1158478189888 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 1)]
]

/-- Partial product 55 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0055 : Poly :=
[
  term ((-2316956379776 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((1158478189888 : Rat) / 31414578435) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-2316956379776 : Rat) / 31414578435) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((1158478189888 : Rat) / 31414578435) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((2316956379776 : Rat) / 31414578435) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((2316956379776 : Rat) / 31414578435) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-1158478189888 : Rat) / 31414578435) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1158478189888 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 55 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0055_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0055
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0055 := by
  native_decide

/-- Coefficient term 56 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0056 : Poly :=
[
  term ((-5248694750668 : Rat) / 94243735305) [(5, 1), (11, 1)]
]

/-- Partial product 56 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0056 : Poly :=
[
  term ((10497389501336 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((-5248694750668 : Rat) / 94243735305) [(0, 2), (5, 1), (11, 1)],
  term ((10497389501336 : Rat) / 94243735305) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-5248694750668 : Rat) / 94243735305) [(1, 2), (5, 1), (11, 1)],
  term ((-10497389501336 : Rat) / 94243735305) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-10497389501336 : Rat) / 94243735305) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((5248694750668 : Rat) / 94243735305) [(5, 1), (11, 1), (14, 2)],
  term ((5248694750668 : Rat) / 94243735305) [(5, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 56 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0056_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0056
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0056 := by
  native_decide

/-- Coefficient term 57 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0057 : Poly :=
[
  term ((9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1)]
]

/-- Partial product 57 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0057 : Poly :=
[
  term ((-18448059392 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((9224029696 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-18448059392 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((9224029696 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((18448059392 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((18448059392 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 57 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0057_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0057
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0057 := by
  native_decide

/-- Coefficient term 58 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0058 : Poly :=
[
  term ((-5178880 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 58 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0058 : Poly :=
[
  term ((10357760 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5178880 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((10357760 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((-5178880 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10357760 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((5178880 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((5178880 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-10357760 : Rat) / 110226591) [(5, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 58 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0058_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0058
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0058 := by
  native_decide

/-- Coefficient term 59 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0059 : Poly :=
[
  term ((11422208 : Rat) / 548391) [(5, 1), (11, 1), (14, 1)]
]

/-- Partial product 59 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0059 : Poly :=
[
  term ((-22844416 : Rat) / 548391) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((11422208 : Rat) / 548391) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((-22844416 : Rat) / 548391) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((11422208 : Rat) / 548391) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((22844416 : Rat) / 548391) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((22844416 : Rat) / 548391) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11422208 : Rat) / 548391) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((-11422208 : Rat) / 548391) [(5, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 59 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0059_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0059
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0059 := by
  native_decide

/-- Coefficient term 60 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0060 : Poly :=
[
  term ((-112977920 : Rat) / 110226591) [(5, 1), (11, 1), (15, 2)]
]

/-- Partial product 60 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0060 : Poly :=
[
  term ((225955840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-112977920 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((225955840 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((-112977920 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((-225955840 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-225955840 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((112977920 : Rat) / 110226591) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((112977920 : Rat) / 110226591) [(5, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 60 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0060_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0060
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0060 := by
  native_decide

/-- Coefficient term 61 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0061 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(5, 1), (11, 2), (15, 1)]
]

/-- Partial product 61 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0061 : Poly :=
[
  term ((38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 61 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0061_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0061
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0061 := by
  native_decide

/-- Coefficient term 62 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0062 : Poly :=
[
  term ((432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1)]
]

/-- Partial product 62 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0062 : Poly :=
[
  term ((-864752784 : Rat) / 12247399) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((432376392 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-864752784 : Rat) / 12247399) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((432376392 : Rat) / 12247399) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-432376392 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((864752784 : Rat) / 12247399) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((864752784 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 62 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0062_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0062
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0062 := by
  native_decide

/-- Coefficient term 63 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0063 : Poly :=
[
  term ((-8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (15, 1)]
]

/-- Partial product 63 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0063 : Poly :=
[
  term ((16162386592 : Rat) / 110226591) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-8081193296 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((16162386592 : Rat) / 110226591) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-8081193296 : Rat) / 110226591) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-16162386592 : Rat) / 110226591) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)],
  term ((-16162386592 : Rat) / 110226591) [(5, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 63 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0063_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0063
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0063 := by
  native_decide

/-- Coefficient term 64 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0064 : Poly :=
[
  term ((-162439260179 : Rat) / 6981017430) [(5, 1), (13, 1)]
]

/-- Partial product 64 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0064 : Poly :=
[
  term ((162439260179 : Rat) / 3490508715) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((-162439260179 : Rat) / 6981017430) [(0, 2), (5, 1), (13, 1)],
  term ((162439260179 : Rat) / 3490508715) [(1, 1), (5, 1), (13, 2)],
  term ((-162439260179 : Rat) / 6981017430) [(1, 2), (5, 1), (13, 1)],
  term ((-162439260179 : Rat) / 3490508715) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((162439260179 : Rat) / 6981017430) [(5, 1), (13, 1), (14, 2)],
  term ((162439260179 : Rat) / 6981017430) [(5, 1), (13, 1), (15, 2)],
  term ((-162439260179 : Rat) / 3490508715) [(5, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 64 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0064_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0064
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0064 := by
  native_decide

/-- Coefficient term 65 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0065 : Poly :=
[
  term ((1606248 : Rat) / 182797) [(5, 1), (13, 1), (14, 1)]
]

/-- Partial product 65 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0065 : Poly :=
[
  term ((-3212496 : Rat) / 182797) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((1606248 : Rat) / 182797) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((-3212496 : Rat) / 182797) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((1606248 : Rat) / 182797) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((3212496 : Rat) / 182797) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-1606248 : Rat) / 182797) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1606248 : Rat) / 182797) [(5, 1), (13, 1), (14, 3)],
  term ((3212496 : Rat) / 182797) [(5, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 65 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0065_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0065
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0065 := by
  native_decide

/-- Coefficient term 66 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0066 : Poly :=
[
  term ((-87496960 : Rat) / 110226591) [(5, 1), (13, 1), (15, 2)]
]

/-- Partial product 66 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0066 : Poly :=
[
  term ((174993920 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-87496960 : Rat) / 110226591) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((174993920 : Rat) / 110226591) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-87496960 : Rat) / 110226591) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((-174993920 : Rat) / 110226591) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((87496960 : Rat) / 110226591) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((87496960 : Rat) / 110226591) [(5, 1), (13, 1), (15, 4)],
  term ((-174993920 : Rat) / 110226591) [(5, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 66 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0066_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0066
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0066 := by
  native_decide

/-- Coefficient term 67 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0067 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(5, 1), (13, 2), (15, 1)]
]

/-- Partial product 67 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0067 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(0, 2), (5, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (5, 1), (13, 3), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 2), (5, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (13, 2), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 67 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0067_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0067
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0067 := by
  native_decide

/-- Coefficient term 68 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0068 : Poly :=
[
  term ((-650641576 : Rat) / 36742197) [(5, 1), (14, 1), (15, 1)]
]

/-- Partial product 68 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0068 : Poly :=
[
  term ((1301283152 : Rat) / 36742197) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-650641576 : Rat) / 36742197) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((1301283152 : Rat) / 36742197) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-650641576 : Rat) / 36742197) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((-1301283152 : Rat) / 36742197) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1301283152 : Rat) / 36742197) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((650641576 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)],
  term ((650641576 : Rat) / 36742197) [(5, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 68 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0068_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0068
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0068 := by
  native_decide

/-- Coefficient term 69 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0069 : Poly :=
[
  term ((4648147494974 : Rat) / 94243735305) [(5, 1), (15, 1)]
]

/-- Partial product 69 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0069 : Poly :=
[
  term ((-9296294989948 : Rat) / 94243735305) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((4648147494974 : Rat) / 94243735305) [(0, 2), (5, 1), (15, 1)],
  term ((-9296294989948 : Rat) / 94243735305) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((4648147494974 : Rat) / 94243735305) [(1, 2), (5, 1), (15, 1)],
  term ((9296294989948 : Rat) / 94243735305) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((9296294989948 : Rat) / 94243735305) [(5, 1), (13, 1), (15, 2)],
  term ((-4648147494974 : Rat) / 94243735305) [(5, 1), (14, 2), (15, 1)],
  term ((-4648147494974 : Rat) / 94243735305) [(5, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 69 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0069_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0069
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0069 := by
  native_decide

/-- Coefficient term 70 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0070 : Poly :=
[
  term ((149447680 : Rat) / 110226591) [(5, 1), (15, 3)]
]

/-- Partial product 70 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0070 : Poly :=
[
  term ((-298895360 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((149447680 : Rat) / 110226591) [(0, 2), (5, 1), (15, 3)],
  term ((-298895360 : Rat) / 110226591) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((149447680 : Rat) / 110226591) [(1, 2), (5, 1), (15, 3)],
  term ((298895360 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((298895360 : Rat) / 110226591) [(5, 1), (13, 1), (15, 4)],
  term ((-149447680 : Rat) / 110226591) [(5, 1), (14, 2), (15, 3)],
  term ((-149447680 : Rat) / 110226591) [(5, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 70 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0070_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0070
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0070 := by
  native_decide

/-- Coefficient term 71 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0071 : Poly :=
[
  term ((-218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1)]
]

/-- Partial product 71 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0071 : Poly :=
[
  term ((436242609152 : Rat) / 10471526145) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((436242609152 : Rat) / 10471526145) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-218121304576 : Rat) / 10471526145) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 71 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0071_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0071
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0071 := by
  native_decide

/-- Coefficient term 72 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0072 : Poly :=
[
  term ((-10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1)]
]

/-- Partial product 72 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0072 : Poly :=
[
  term ((20448872304 : Rat) / 1163502905) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((20448872304 : Rat) / 1163502905) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((-10224436152 : Rat) / 1163502905) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((-20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 72 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0072_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0072
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0072 := by
  native_decide

/-- Coefficient term 73 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0073 : Poly :=
[
  term ((196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 1)]
]

/-- Partial product 73 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0073 : Poly :=
[
  term ((-393397352896 : Rat) / 10471526145) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((196698676448 : Rat) / 10471526145) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((196698676448 : Rat) / 10471526145) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 73 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0073_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0073
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0073 := by
  native_decide

/-- Coefficient term 74 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0074 : Poly :=
[
  term ((15845359936 : Rat) / 330679773) [(7, 1), (11, 1)]
]

/-- Partial product 74 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0074 : Poly :=
[
  term ((-31690719872 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((15845359936 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1)],
  term ((-31690719872 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((15845359936 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1)],
  term ((31690719872 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((31690719872 : Rat) / 330679773) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-15845359936 : Rat) / 330679773) [(7, 1), (11, 1), (14, 2)],
  term ((-15845359936 : Rat) / 330679773) [(7, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 74 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0074_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0074
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0074 := by
  native_decide

/-- Coefficient term 75 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0075 : Poly :=
[
  term ((-4111455488 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 75 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0075 : Poly :=
[
  term ((8222910976 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((-4111455488 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((8222910976 : Rat) / 110226591) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4111455488 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((-8222910976 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4111455488 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((4111455488 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8222910976 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 75 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0075_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0075
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0075 := by
  native_decide

/-- Coefficient term 76 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0076 : Poly :=
[
  term ((4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 76 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0076 : Poly :=
[
  term ((-9139200 : Rat) / 12247399) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9139200 : Rat) / 12247399) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((4569600 : Rat) / 12247399) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((9139200 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((9139200 : Rat) / 12247399) [(7, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 76 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0076_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0076
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0076 := by
  native_decide

/-- Coefficient term 77 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0077 : Poly :=
[
  term ((-7084430080 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 77 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0077 : Poly :=
[
  term ((14168860160 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-7084430080 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((14168860160 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-7084430080 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-14168860160 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((-14168860160 : Rat) / 330679773) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((7084430080 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((7084430080 : Rat) / 330679773) [(7, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 77 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0077_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0077
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0077 := by
  native_decide

/-- Coefficient term 78 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0078 : Poly :=
[
  term ((-87910400 : Rat) / 110226591) [(7, 1), (11, 1), (15, 2)]
]

/-- Partial product 78 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0078 : Poly :=
[
  term ((175820800 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (15, 2)],
  term ((175820800 : Rat) / 110226591) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-87910400 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-175820800 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 78 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0078_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0078
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0078 := by
  native_decide

/-- Coefficient term 79 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0079 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(7, 1), (11, 2), (15, 1)]
]

/-- Partial product 79 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0079 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 79 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0079_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0079
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0079 := by
  native_decide

/-- Coefficient term 80 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0080 : Poly :=
[
  term ((-192724476 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 80 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0080 : Poly :=
[
  term ((385448952 : Rat) / 12247399) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-192724476 : Rat) / 12247399) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((385448952 : Rat) / 12247399) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-192724476 : Rat) / 12247399) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((192724476 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((192724476 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-385448952 : Rat) / 12247399) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-385448952 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 80 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0080_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0080
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0080 := by
  native_decide

/-- Coefficient term 81 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0081 : Poly :=
[
  term ((3470746912 : Rat) / 110226591) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 81 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0081 : Poly :=
[
  term ((-6941493824 : Rat) / 110226591) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((3470746912 : Rat) / 110226591) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((-6941493824 : Rat) / 110226591) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((3470746912 : Rat) / 110226591) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((6941493824 : Rat) / 110226591) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3470746912 : Rat) / 110226591) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3470746912 : Rat) / 110226591) [(7, 1), (12, 1), (15, 3)],
  term ((6941493824 : Rat) / 110226591) [(7, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 81 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0081_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0081
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0081 := by
  native_decide

/-- Coefficient term 82 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0082 : Poly :=
[
  term ((247583749 : Rat) / 12247399) [(7, 1), (13, 1)]
]

/-- Partial product 82 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0082 : Poly :=
[
  term ((-495167498 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((247583749 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1)],
  term ((-495167498 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2)],
  term ((247583749 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1)],
  term ((495167498 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-247583749 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)],
  term ((-247583749 : Rat) / 12247399) [(7, 1), (13, 1), (15, 2)],
  term ((495167498 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 82 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0082_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0082
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0082 := by
  native_decide

/-- Coefficient term 83 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0083 : Poly :=
[
  term ((-110694220 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 83 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0083 : Poly :=
[
  term ((221388440 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-110694220 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((221388440 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-110694220 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((-221388440 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((110694220 : Rat) / 12247399) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((110694220 : Rat) / 12247399) [(7, 1), (13, 1), (14, 3)],
  term ((-221388440 : Rat) / 12247399) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 83 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0083_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0083
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0083 := by
  native_decide

/-- Coefficient term 84 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0084 : Poly :=
[
  term ((6388637840 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 84 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0084 : Poly :=
[
  term ((-12777275680 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((6388637840 : Rat) / 330679773) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-12777275680 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((6388637840 : Rat) / 330679773) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((12777275680 : Rat) / 330679773) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((12777275680 : Rat) / 330679773) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-6388637840 : Rat) / 330679773) [(7, 1), (14, 1), (15, 3)],
  term ((-6388637840 : Rat) / 330679773) [(7, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 84 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0084_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0084
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0084 := by
  native_decide

/-- Coefficient term 85 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0085 : Poly :=
[
  term ((-13889342189 : Rat) / 330679773) [(7, 1), (15, 1)]
]

/-- Partial product 85 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0085 : Poly :=
[
  term ((27778684378 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((-13889342189 : Rat) / 330679773) [(0, 2), (7, 1), (15, 1)],
  term ((27778684378 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-13889342189 : Rat) / 330679773) [(1, 2), (7, 1), (15, 1)],
  term ((-27778684378 : Rat) / 330679773) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-27778684378 : Rat) / 330679773) [(7, 1), (13, 1), (15, 2)],
  term ((13889342189 : Rat) / 330679773) [(7, 1), (14, 2), (15, 1)],
  term ((13889342189 : Rat) / 330679773) [(7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 85 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0085_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0085
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0085 := by
  native_decide

/-- Coefficient term 86 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0086 : Poly :=
[
  term ((750898181824 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 86 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0086 : Poly :=
[
  term ((-1501796363648 : Rat) / 18848747061) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((750898181824 : Rat) / 18848747061) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((-1501796363648 : Rat) / 18848747061) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((750898181824 : Rat) / 18848747061) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((1501796363648 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((1501796363648 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-750898181824 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-750898181824 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 86 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0086_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0086
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0086 := by
  native_decide

/-- Coefficient term 87 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0087 : Poly :=
[
  term ((11732784091 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 87 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0087 : Poly :=
[
  term ((-23465568182 : Rat) / 698101743) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((11732784091 : Rat) / 698101743) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-23465568182 : Rat) / 698101743) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((11732784091 : Rat) / 698101743) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((23465568182 : Rat) / 698101743) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-11732784091 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-11732784091 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((23465568182 : Rat) / 698101743) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 87 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0087_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0087
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0087 := by
  native_decide

/-- Coefficient term 88 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0088 : Poly :=
[
  term ((-677149253252 : Rat) / 18848747061) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 88 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0088 : Poly :=
[
  term ((1354298506504 : Rat) / 18848747061) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-677149253252 : Rat) / 18848747061) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((1354298506504 : Rat) / 18848747061) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-677149253252 : Rat) / 18848747061) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1354298506504 : Rat) / 18848747061) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1354298506504 : Rat) / 18848747061) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((677149253252 : Rat) / 18848747061) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((677149253252 : Rat) / 18848747061) [(9, 1), (10, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 88 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0088_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0088
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0088 := by
  native_decide

/-- Coefficient term 89 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0089 : Poly :=
[
  term ((2156334100558 : Rat) / 94243735305) [(9, 1), (11, 1)]
]

/-- Partial product 89 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0089 : Poly :=
[
  term ((-4312668201116 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((2156334100558 : Rat) / 94243735305) [(0, 2), (9, 1), (11, 1)],
  term ((-4312668201116 : Rat) / 94243735305) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((2156334100558 : Rat) / 94243735305) [(1, 2), (9, 1), (11, 1)],
  term ((4312668201116 : Rat) / 94243735305) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((4312668201116 : Rat) / 94243735305) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-2156334100558 : Rat) / 94243735305) [(9, 1), (11, 1), (14, 2)],
  term ((-2156334100558 : Rat) / 94243735305) [(9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 89 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0089_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0089
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0089 := by
  native_decide

/-- Coefficient term 90 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0090 : Poly :=
[
  term ((-5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 90 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0090 : Poly :=
[
  term ((10093723136 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-5046861568 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((10093723136 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-5046861568 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((-10093723136 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10093723136 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 90 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0090_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0090
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0090 := by
  native_decide

/-- Coefficient term 91 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0091 : Poly :=
[
  term ((5178880 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 91 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0091 : Poly :=
[
  term ((-10357760 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((5178880 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-10357760 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((5178880 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((10357760 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5178880 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-5178880 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((10357760 : Rat) / 110226591) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 91 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0091_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0091
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0091 := by
  native_decide

/-- Coefficient term 92 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0092 : Poly :=
[
  term ((11450555648 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 92 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0092 : Poly :=
[
  term ((-22901111296 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((11450555648 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-22901111296 : Rat) / 330679773) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((11450555648 : Rat) / 330679773) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((22901111296 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((22901111296 : Rat) / 330679773) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-11450555648 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-11450555648 : Rat) / 330679773) [(9, 1), (11, 1), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 92 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0092_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0092
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0092 := by
  native_decide

/-- Coefficient term 93 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0093 : Poly :=
[
  term ((-42997760 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 93 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0093 : Poly :=
[
  term ((85995520 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-42997760 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((85995520 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-42997760 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((-85995520 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-85995520 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((42997760 : Rat) / 110226591) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((42997760 : Rat) / 110226591) [(9, 1), (11, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 93 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0093_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0093
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0093 := by
  native_decide

/-- Coefficient term 94 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0094 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 94 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0094 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 94 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0094_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0094
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0094 := by
  native_decide

/-- Coefficient term 95 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0095 : Poly :=
[
  term ((-236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 95 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0095 : Poly :=
[
  term ((473143272 : Rat) / 12247399) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-236571636 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((473143272 : Rat) / 12247399) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-236571636 : Rat) / 12247399) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((236571636 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-473143272 : Rat) / 12247399) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-473143272 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 95 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0095_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0095
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0095 := by
  native_decide

/-- Coefficient term 96 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0096 : Poly :=
[
  term ((4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 96 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0096 : Poly :=
[
  term ((-9102375328 : Rat) / 110226591) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((4551187664 : Rat) / 110226591) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((-9102375328 : Rat) / 110226591) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((4551187664 : Rat) / 110226591) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((9102375328 : Rat) / 110226591) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)],
  term ((9102375328 : Rat) / 110226591) [(9, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 96 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0096_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0096
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0096 := by
  native_decide

/-- Coefficient term 97 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0097 : Poly :=
[
  term ((42329969969 : Rat) / 6981017430) [(9, 1), (13, 1)]
]

/-- Partial product 97 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0097 : Poly :=
[
  term ((-42329969969 : Rat) / 3490508715) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((42329969969 : Rat) / 6981017430) [(0, 2), (9, 1), (13, 1)],
  term ((-42329969969 : Rat) / 3490508715) [(1, 1), (9, 1), (13, 2)],
  term ((42329969969 : Rat) / 6981017430) [(1, 2), (9, 1), (13, 1)],
  term ((42329969969 : Rat) / 3490508715) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-42329969969 : Rat) / 6981017430) [(9, 1), (13, 1), (14, 2)],
  term ((-42329969969 : Rat) / 6981017430) [(9, 1), (13, 1), (15, 2)],
  term ((42329969969 : Rat) / 3490508715) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 97 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0097_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0097
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0097 := by
  native_decide

/-- Coefficient term 98 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0098 : Poly :=
[
  term ((178914932 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 98 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0098 : Poly :=
[
  term ((-357829864 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((178914932 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((-357829864 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((178914932 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((357829864 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((-178914932 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-178914932 : Rat) / 12247399) [(9, 1), (13, 1), (14, 3)],
  term ((357829864 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 98 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0098_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0098
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0098 := by
  native_decide

/-- Coefficient term 99 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0099 : Poly :=
[
  term ((21694720 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 99 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0099 : Poly :=
[
  term ((-43389440 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((21694720 : Rat) / 110226591) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-43389440 : Rat) / 110226591) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((21694720 : Rat) / 110226591) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((43389440 : Rat) / 110226591) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-21694720 : Rat) / 110226591) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-21694720 : Rat) / 110226591) [(9, 1), (13, 1), (15, 4)],
  term ((43389440 : Rat) / 110226591) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 99 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0099_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0099
        rs_R009_ueqv_R009NNNYN_generator_27_0000_0099 =
      rs_R009_ueqv_R009NNNYN_partial_27_0099 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_27_0000_0099 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_27_0000,
  rs_R009_ueqv_R009NNNYN_partial_27_0001,
  rs_R009_ueqv_R009NNNYN_partial_27_0002,
  rs_R009_ueqv_R009NNNYN_partial_27_0003,
  rs_R009_ueqv_R009NNNYN_partial_27_0004,
  rs_R009_ueqv_R009NNNYN_partial_27_0005,
  rs_R009_ueqv_R009NNNYN_partial_27_0006,
  rs_R009_ueqv_R009NNNYN_partial_27_0007,
  rs_R009_ueqv_R009NNNYN_partial_27_0008,
  rs_R009_ueqv_R009NNNYN_partial_27_0009,
  rs_R009_ueqv_R009NNNYN_partial_27_0010,
  rs_R009_ueqv_R009NNNYN_partial_27_0011,
  rs_R009_ueqv_R009NNNYN_partial_27_0012,
  rs_R009_ueqv_R009NNNYN_partial_27_0013,
  rs_R009_ueqv_R009NNNYN_partial_27_0014,
  rs_R009_ueqv_R009NNNYN_partial_27_0015,
  rs_R009_ueqv_R009NNNYN_partial_27_0016,
  rs_R009_ueqv_R009NNNYN_partial_27_0017,
  rs_R009_ueqv_R009NNNYN_partial_27_0018,
  rs_R009_ueqv_R009NNNYN_partial_27_0019,
  rs_R009_ueqv_R009NNNYN_partial_27_0020,
  rs_R009_ueqv_R009NNNYN_partial_27_0021,
  rs_R009_ueqv_R009NNNYN_partial_27_0022,
  rs_R009_ueqv_R009NNNYN_partial_27_0023,
  rs_R009_ueqv_R009NNNYN_partial_27_0024,
  rs_R009_ueqv_R009NNNYN_partial_27_0025,
  rs_R009_ueqv_R009NNNYN_partial_27_0026,
  rs_R009_ueqv_R009NNNYN_partial_27_0027,
  rs_R009_ueqv_R009NNNYN_partial_27_0028,
  rs_R009_ueqv_R009NNNYN_partial_27_0029,
  rs_R009_ueqv_R009NNNYN_partial_27_0030,
  rs_R009_ueqv_R009NNNYN_partial_27_0031,
  rs_R009_ueqv_R009NNNYN_partial_27_0032,
  rs_R009_ueqv_R009NNNYN_partial_27_0033,
  rs_R009_ueqv_R009NNNYN_partial_27_0034,
  rs_R009_ueqv_R009NNNYN_partial_27_0035,
  rs_R009_ueqv_R009NNNYN_partial_27_0036,
  rs_R009_ueqv_R009NNNYN_partial_27_0037,
  rs_R009_ueqv_R009NNNYN_partial_27_0038,
  rs_R009_ueqv_R009NNNYN_partial_27_0039,
  rs_R009_ueqv_R009NNNYN_partial_27_0040,
  rs_R009_ueqv_R009NNNYN_partial_27_0041,
  rs_R009_ueqv_R009NNNYN_partial_27_0042,
  rs_R009_ueqv_R009NNNYN_partial_27_0043,
  rs_R009_ueqv_R009NNNYN_partial_27_0044,
  rs_R009_ueqv_R009NNNYN_partial_27_0045,
  rs_R009_ueqv_R009NNNYN_partial_27_0046,
  rs_R009_ueqv_R009NNNYN_partial_27_0047,
  rs_R009_ueqv_R009NNNYN_partial_27_0048,
  rs_R009_ueqv_R009NNNYN_partial_27_0049,
  rs_R009_ueqv_R009NNNYN_partial_27_0050,
  rs_R009_ueqv_R009NNNYN_partial_27_0051,
  rs_R009_ueqv_R009NNNYN_partial_27_0052,
  rs_R009_ueqv_R009NNNYN_partial_27_0053,
  rs_R009_ueqv_R009NNNYN_partial_27_0054,
  rs_R009_ueqv_R009NNNYN_partial_27_0055,
  rs_R009_ueqv_R009NNNYN_partial_27_0056,
  rs_R009_ueqv_R009NNNYN_partial_27_0057,
  rs_R009_ueqv_R009NNNYN_partial_27_0058,
  rs_R009_ueqv_R009NNNYN_partial_27_0059,
  rs_R009_ueqv_R009NNNYN_partial_27_0060,
  rs_R009_ueqv_R009NNNYN_partial_27_0061,
  rs_R009_ueqv_R009NNNYN_partial_27_0062,
  rs_R009_ueqv_R009NNNYN_partial_27_0063,
  rs_R009_ueqv_R009NNNYN_partial_27_0064,
  rs_R009_ueqv_R009NNNYN_partial_27_0065,
  rs_R009_ueqv_R009NNNYN_partial_27_0066,
  rs_R009_ueqv_R009NNNYN_partial_27_0067,
  rs_R009_ueqv_R009NNNYN_partial_27_0068,
  rs_R009_ueqv_R009NNNYN_partial_27_0069,
  rs_R009_ueqv_R009NNNYN_partial_27_0070,
  rs_R009_ueqv_R009NNNYN_partial_27_0071,
  rs_R009_ueqv_R009NNNYN_partial_27_0072,
  rs_R009_ueqv_R009NNNYN_partial_27_0073,
  rs_R009_ueqv_R009NNNYN_partial_27_0074,
  rs_R009_ueqv_R009NNNYN_partial_27_0075,
  rs_R009_ueqv_R009NNNYN_partial_27_0076,
  rs_R009_ueqv_R009NNNYN_partial_27_0077,
  rs_R009_ueqv_R009NNNYN_partial_27_0078,
  rs_R009_ueqv_R009NNNYN_partial_27_0079,
  rs_R009_ueqv_R009NNNYN_partial_27_0080,
  rs_R009_ueqv_R009NNNYN_partial_27_0081,
  rs_R009_ueqv_R009NNNYN_partial_27_0082,
  rs_R009_ueqv_R009NNNYN_partial_27_0083,
  rs_R009_ueqv_R009NNNYN_partial_27_0084,
  rs_R009_ueqv_R009NNNYN_partial_27_0085,
  rs_R009_ueqv_R009NNNYN_partial_27_0086,
  rs_R009_ueqv_R009NNNYN_partial_27_0087,
  rs_R009_ueqv_R009NNNYN_partial_27_0088,
  rs_R009_ueqv_R009NNNYN_partial_27_0089,
  rs_R009_ueqv_R009NNNYN_partial_27_0090,
  rs_R009_ueqv_R009NNNYN_partial_27_0091,
  rs_R009_ueqv_R009NNNYN_partial_27_0092,
  rs_R009_ueqv_R009NNNYN_partial_27_0093,
  rs_R009_ueqv_R009NNNYN_partial_27_0094,
  rs_R009_ueqv_R009NNNYN_partial_27_0095,
  rs_R009_ueqv_R009NNNYN_partial_27_0096,
  rs_R009_ueqv_R009NNNYN_partial_27_0097,
  rs_R009_ueqv_R009NNNYN_partial_27_0098,
  rs_R009_ueqv_R009NNNYN_partial_27_0099
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_27_0000_0099 : Poly :=
[
  term ((1570096640 : Rat) / 330679773) [(0, 1), (1, 1), (2, 1), (11, 1), (12, 1)],
  term ((24532760 : Rat) / 12247399) [(0, 1), (1, 1), (2, 1), (12, 1), (13, 1)],
  term ((-1415890720 : Rat) / 330679773) [(0, 1), (1, 1), (2, 1), (12, 1), (15, 1)],
  term ((439237120 : Rat) / 330679773) [(0, 1), (1, 1), (3, 1), (11, 1), (13, 1)],
  term ((-396097760 : Rat) / 330679773) [(0, 1), (1, 1), (3, 1), (13, 1), (15, 1)],
  term ((6863080 : Rat) / 12247399) [(0, 1), (1, 1), (3, 1), (13, 2)],
  term ((-8186909696 : Rat) / 110226591) [(0, 1), (1, 1), (5, 1), (11, 1), (13, 1)],
  term ((7382838208 : Rat) / 110226591) [(0, 1), (1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-383761392 : Rat) / 12247399) [(0, 1), (1, 1), (5, 1), (13, 2)],
  term ((-133038080 : Rat) / 330679773) [(0, 1), (1, 1), (7, 1), (11, 1), (13, 1)],
  term ((119971840 : Rat) / 330679773) [(0, 1), (1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-2078720 : Rat) / 12247399) [(0, 1), (1, 1), (7, 1), (13, 2)],
  term ((26868251648 : Rat) / 330679773) [(0, 1), (1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-24229405504 : Rat) / 330679773) [(0, 1), (1, 1), (9, 1), (13, 1), (15, 1)],
  term ((419816432 : Rat) / 12247399) [(0, 1), (1, 1), (9, 1), (13, 2)],
  term ((1709173760 : Rat) / 36742197) [(0, 1), (1, 1), (11, 1), (12, 1)],
  term ((-19901163520 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (12, 1), (14, 1)],
  term ((1153761280 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (12, 2)],
  term ((17891829760 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-1153761280 : Rat) / 330679773) [(0, 1), (1, 1), (11, 1), (13, 2)],
  term ((240352560 : Rat) / 12247399) [(0, 1), (1, 1), (12, 1), (13, 1)],
  term ((-310955680 : Rat) / 12247399) [(0, 1), (1, 1), (12, 1), (13, 1), (14, 1)],
  term ((17946584960 : Rat) / 330679773) [(0, 1), (1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1541308480 : Rat) / 36742197) [(0, 1), (1, 1), (12, 1), (15, 1)],
  term ((18027520 : Rat) / 12247399) [(0, 1), (1, 1), (12, 2), (13, 1)],
  term ((-1040445440 : Rat) / 330679773) [(0, 1), (1, 1), (12, 2), (15, 1)],
  term ((-16134596480 : Rat) / 330679773) [(0, 1), (1, 1), (13, 1), (15, 2)],
  term ((8588561120 : Rat) / 330679773) [(0, 1), (1, 1), (13, 2), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(0, 1), (1, 1), (13, 3)],
  term ((-219618560 : Rat) / 330679773) [(0, 1), (1, 2), (3, 1), (11, 1)],
  term ((-3431540 : Rat) / 12247399) [(0, 1), (1, 2), (3, 1), (13, 1)],
  term ((198048880 : Rat) / 330679773) [(0, 1), (1, 2), (3, 1), (15, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 1), (1, 2), (5, 1), (11, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 1), (1, 2), (5, 1), (13, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 1), (1, 2), (5, 1), (15, 1)],
  term ((66519040 : Rat) / 330679773) [(0, 1), (1, 2), (7, 1), (11, 1)],
  term ((1039360 : Rat) / 12247399) [(0, 1), (1, 2), (7, 1), (13, 1)],
  term ((-59985920 : Rat) / 330679773) [(0, 1), (1, 2), (7, 1), (15, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 1), (1, 2), (9, 1), (11, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 1), (1, 2), (9, 1), (13, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 1), (1, 2), (9, 1), (15, 1)],
  term ((576880640 : Rat) / 330679773) [(0, 1), (1, 2), (11, 1), (13, 1)],
  term ((-8945914880 : Rat) / 330679773) [(0, 1), (1, 2), (11, 1), (15, 1)],
  term ((-4294280560 : Rat) / 330679773) [(0, 1), (1, 2), (13, 1), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(0, 1), (1, 2), (13, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 1), (1, 2), (15, 2)],
  term ((3490242560 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (11, 1), (12, 1)],
  term ((54535040 : Rat) / 12247399) [(0, 1), (2, 1), (5, 1), (12, 1), (13, 1)],
  term ((-3147450880 : Rat) / 330679773) [(0, 1), (2, 1), (5, 1), (12, 1), (15, 1)],
  term ((-1696540160 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (11, 1), (12, 1)],
  term ((-26508440 : Rat) / 12247399) [(0, 1), (2, 1), (7, 1), (12, 1), (13, 1)],
  term ((1529915680 : Rat) / 330679773) [(0, 1), (2, 1), (7, 1), (12, 1), (15, 1)],
  term ((-1209098240 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (11, 1), (12, 1)],
  term ((-18892160 : Rat) / 12247399) [(0, 1), (2, 1), (9, 1), (12, 1), (13, 1)],
  term ((1090347520 : Rat) / 330679773) [(0, 1), (2, 1), (9, 1), (12, 1), (15, 1)],
  term ((-3059302400 : Rat) / 330679773) [(0, 1), (2, 1), (11, 1), (12, 1), (13, 1)],
  term ((108953600 : Rat) / 6239241) [(0, 1), (2, 1), (11, 1), (12, 1), (15, 1)],
  term ((5194969600 : Rat) / 330679773) [(0, 1), (2, 1), (12, 1), (13, 1), (15, 1)],
  term ((-47801600 : Rat) / 12247399) [(0, 1), (2, 1), (12, 1), (13, 2)],
  term ((-98252800 : Rat) / 6239241) [(0, 1), (2, 1), (12, 1), (15, 2)],
  term ((-138763520 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 1)],
  term ((300643840 : Rat) / 36742197) [(0, 1), (3, 1), (11, 1), (12, 1), (14, 1)],
  term ((157445120 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (12, 2)],
  term ((-439237120 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (13, 1), (15, 1)],
  term ((219618560 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (14, 2)],
  term ((219618560 : Rat) / 330679773) [(0, 1), (3, 1), (11, 1), (15, 2)],
  term ((-2168180 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1)],
  term ((42278040 : Rat) / 12247399) [(0, 1), (3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-271116320 : Rat) / 36742197) [(0, 1), (3, 1), (12, 1), (14, 1), (15, 1)],
  term ((125134960 : Rat) / 330679773) [(0, 1), (3, 1), (12, 1), (15, 1)],
  term ((2460080 : Rat) / 12247399) [(0, 1), (3, 1), (12, 2), (13, 1)],
  term ((-141981760 : Rat) / 330679773) [(0, 1), (3, 1), (12, 2), (15, 1)],
  term ((3431540 : Rat) / 12247399) [(0, 1), (3, 1), (13, 1), (14, 2)],
  term ((488749340 : Rat) / 330679773) [(0, 1), (3, 1), (13, 1), (15, 2)],
  term ((-6863080 : Rat) / 12247399) [(0, 1), (3, 1), (13, 2), (15, 1)],
  term ((-198048880 : Rat) / 330679773) [(0, 1), (3, 1), (14, 2), (15, 1)],
  term ((-198048880 : Rat) / 330679773) [(0, 1), (3, 1), (15, 3)],
  term ((-732 : Rat) / 67) [(0, 1), (5, 1), (9, 1), (12, 1)],
  term ((2569298163712 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (11, 1), (12, 1)],
  term ((40145283808 : Rat) / 1163502905) [(0, 1), (5, 1), (10, 1), (12, 1), (13, 1)],
  term ((-2316956379776 : Rat) / 31414578435) [(0, 1), (5, 1), (10, 1), (12, 1), (15, 1)],
  term ((10497389501336 : Rat) / 94243735305) [(0, 1), (5, 1), (11, 1), (12, 1)],
  term ((10357760 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((3595182080 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((225955840 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 1), (15, 2)],
  term ((-18448059392 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (12, 2)],
  term ((8186909696 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (14, 2)],
  term ((-4093454848 : Rat) / 110226591) [(0, 1), (5, 1), (11, 1), (15, 2)],
  term ((38993920 : Rat) / 36742197) [(0, 1), (5, 1), (11, 2), (12, 1), (15, 1)],
  term ((162439260179 : Rat) / 3490508715) [(0, 1), (5, 1), (12, 1), (13, 1)],
  term ((168524160 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((174993920 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (5, 1), (12, 1), (13, 2), (15, 1)],
  term ((-3478988752 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9296294989948 : Rat) / 94243735305) [(0, 1), (5, 1), (12, 1), (15, 1)],
  term ((-298895360 : Rat) / 110226591) [(0, 1), (5, 1), (12, 1), (15, 3)],
  term ((-864752784 : Rat) / 12247399) [(0, 1), (5, 1), (12, 2), (13, 1)],
  term ((16162386592 : Rat) / 110226591) [(0, 1), (5, 1), (12, 2), (15, 1)],
  term ((-191880696 : Rat) / 12247399) [(0, 1), (5, 1), (13, 1), (14, 2)],
  term ((-9109764472 : Rat) / 110226591) [(0, 1), (5, 1), (13, 1), (15, 2)],
  term ((383761392 : Rat) / 12247399) [(0, 1), (5, 1), (13, 2), (15, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (14, 2), (15, 1)],
  term ((3691419104 : Rat) / 110226591) [(0, 1), (5, 1), (15, 3)],
  term ((436242609152 : Rat) / 10471526145) [(0, 1), (7, 1), (10, 1), (11, 1), (12, 1)],
  term ((20448872304 : Rat) / 1163502905) [(0, 1), (7, 1), (10, 1), (12, 1), (13, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(0, 1), (7, 1), (10, 1), (12, 1), (15, 1)],
  term ((-31690719872 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1)],
  term ((-9139200 : Rat) / 12247399) [(0, 1), (7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((14301898240 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 1), (15, 2)],
  term ((8222910976 : Rat) / 110226591) [(0, 1), (7, 1), (11, 1), (12, 2)],
  term ((133038080 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-66519040 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (14, 2)],
  term ((-66519040 : Rat) / 330679773) [(0, 1), (7, 1), (11, 1), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(0, 1), (7, 1), (11, 2), (12, 1), (15, 1)],
  term ((-495167498 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1)],
  term ((223467160 : Rat) / 12247399) [(0, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-12897247520 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((27778684378 : Rat) / 330679773) [(0, 1), (7, 1), (12, 1), (15, 1)],
  term ((385448952 : Rat) / 12247399) [(0, 1), (7, 1), (12, 2), (13, 1)],
  term ((-6941493824 : Rat) / 110226591) [(0, 1), (7, 1), (12, 2), (15, 1)],
  term ((-1039360 : Rat) / 12247399) [(0, 1), (7, 1), (13, 1), (14, 2)],
  term ((-148034560 : Rat) / 330679773) [(0, 1), (7, 1), (13, 1), (15, 2)],
  term ((2078720 : Rat) / 12247399) [(0, 1), (7, 1), (13, 2), (15, 1)],
  term ((59985920 : Rat) / 330679773) [(0, 1), (7, 1), (14, 2), (15, 1)],
  term ((59985920 : Rat) / 330679773) [(0, 1), (7, 1), (15, 3)],
  term ((-1501796363648 : Rat) / 18848747061) [(0, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-23465568182 : Rat) / 698101743) [(0, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((1354298506504 : Rat) / 18848747061) [(0, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-4312668201116 : Rat) / 94243735305) [(0, 1), (9, 1), (11, 1), (12, 1)],
  term ((-10357760 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-5529929216 : Rat) / 36742197) [(0, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((85995520 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 1), (15, 2)],
  term ((10093723136 : Rat) / 110226591) [(0, 1), (9, 1), (11, 1), (12, 2)],
  term ((-26868251648 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (14, 2)],
  term ((13434125824 : Rat) / 330679773) [(0, 1), (9, 1), (11, 1), (15, 2)],
  term ((-38993920 : Rat) / 36742197) [(0, 1), (9, 1), (11, 2), (12, 1), (15, 1)],
  term ((-42329969969 : Rat) / 3490508715) [(0, 1), (9, 1), (12, 1), (13, 1)],
  term ((-777646296 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-43389440 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (13, 1), (15, 2)],
  term ((24229405504 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((473143272 : Rat) / 12247399) [(0, 1), (9, 1), (12, 2), (13, 1)],
  term ((-9102375328 : Rat) / 110226591) [(0, 1), (9, 1), (12, 2), (15, 1)],
  term ((209908216 : Rat) / 12247399) [(0, 1), (9, 1), (13, 1), (14, 2)],
  term ((29896927336 : Rat) / 330679773) [(0, 1), (9, 1), (13, 1), (15, 2)],
  term ((-419816432 : Rat) / 12247399) [(0, 1), (9, 1), (13, 2), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (14, 2), (15, 1)],
  term ((-12114702752 : Rat) / 330679773) [(0, 1), (9, 1), (15, 3)],
  term ((1153761280 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-17891829760 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-576880640 : Rat) / 330679773) [(0, 1), (11, 1), (13, 1), (14, 2)],
  term ((-6156236800 : Rat) / 110226591) [(0, 1), (11, 1), (13, 1), (15, 2)],
  term ((1153761280 : Rat) / 330679773) [(0, 1), (11, 1), (13, 2), (15, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (14, 2), (15, 1)],
  term ((8945914880 : Rat) / 330679773) [(0, 1), (11, 1), (15, 3)],
  term ((-8588561120 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((18027520 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((16134596480 : Rat) / 330679773) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((4294280560 : Rat) / 330679773) [(0, 1), (13, 1), (14, 2), (15, 1)],
  term ((6809625680 : Rat) / 110226591) [(0, 1), (13, 1), (15, 3)],
  term ((-9013760 : Rat) / 12247399) [(0, 1), (13, 2), (14, 2)],
  term ((-8831932640 : Rat) / 330679773) [(0, 1), (13, 2), (15, 2)],
  term ((18027520 : Rat) / 12247399) [(0, 1), (13, 3), (15, 1)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (14, 2), (15, 2)],
  term ((-8067298240 : Rat) / 330679773) [(0, 1), (15, 4)],
  term ((-785048320 : Rat) / 330679773) [(0, 2), (1, 1), (2, 1), (11, 1)],
  term ((-12266380 : Rat) / 12247399) [(0, 2), (1, 1), (2, 1), (13, 1)],
  term ((707945360 : Rat) / 330679773) [(0, 2), (1, 1), (2, 1), (15, 1)],
  term ((-854586880 : Rat) / 36742197) [(0, 2), (1, 1), (11, 1)],
  term ((-576880640 : Rat) / 330679773) [(0, 2), (1, 1), (11, 1), (12, 1)],
  term ((9950581760 : Rat) / 330679773) [(0, 2), (1, 1), (11, 1), (14, 1)],
  term ((-9013760 : Rat) / 12247399) [(0, 2), (1, 1), (12, 1), (13, 1)],
  term ((520222720 : Rat) / 330679773) [(0, 2), (1, 1), (12, 1), (15, 1)],
  term ((-120176280 : Rat) / 12247399) [(0, 2), (1, 1), (13, 1)],
  term ((155477840 : Rat) / 12247399) [(0, 2), (1, 1), (13, 1), (14, 1)],
  term ((-8973292480 : Rat) / 330679773) [(0, 2), (1, 1), (14, 1), (15, 1)],
  term ((770654240 : Rat) / 36742197) [(0, 2), (1, 1), (15, 1)],
  term ((-1745121280 : Rat) / 330679773) [(0, 2), (2, 1), (5, 1), (11, 1)],
  term ((-27267520 : Rat) / 12247399) [(0, 2), (2, 1), (5, 1), (13, 1)],
  term ((1573725440 : Rat) / 330679773) [(0, 2), (2, 1), (5, 1), (15, 1)],
  term ((848270080 : Rat) / 330679773) [(0, 2), (2, 1), (7, 1), (11, 1)],
  term ((13254220 : Rat) / 12247399) [(0, 2), (2, 1), (7, 1), (13, 1)],
  term ((-764957840 : Rat) / 330679773) [(0, 2), (2, 1), (7, 1), (15, 1)],
  term ((604549120 : Rat) / 330679773) [(0, 2), (2, 1), (9, 1), (11, 1)],
  term ((9446080 : Rat) / 12247399) [(0, 2), (2, 1), (9, 1), (13, 1)],
  term ((-545173760 : Rat) / 330679773) [(0, 2), (2, 1), (9, 1), (15, 1)],
  term ((1529651200 : Rat) / 330679773) [(0, 2), (2, 1), (11, 1), (13, 1)],
  term ((-54476800 : Rat) / 6239241) [(0, 2), (2, 1), (11, 1), (15, 1)],
  term ((-2597484800 : Rat) / 330679773) [(0, 2), (2, 1), (13, 1), (15, 1)],
  term ((23900800 : Rat) / 12247399) [(0, 2), (2, 1), (13, 2)],
  term ((49126400 : Rat) / 6239241) [(0, 2), (2, 1), (15, 2)],
  term ((69381760 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1)],
  term ((120171520 : Rat) / 110226591) [(0, 2), (3, 1), (11, 1), (12, 1)],
  term ((-1572515840 : Rat) / 330679773) [(0, 2), (3, 1), (11, 1), (14, 1)],
  term ((5633040 : Rat) / 12247399) [(0, 2), (3, 1), (12, 1), (13, 1)],
  term ((-108368960 : Rat) / 110226591) [(0, 2), (3, 1), (12, 1), (15, 1)],
  term ((1084090 : Rat) / 12247399) [(0, 2), (3, 1), (13, 1)],
  term ((-24570560 : Rat) / 12247399) [(0, 2), (3, 1), (13, 1), (14, 1)],
  term ((1418072320 : Rat) / 330679773) [(0, 2), (3, 1), (14, 1), (15, 1)],
  term ((-62567480 : Rat) / 330679773) [(0, 2), (3, 1), (15, 1)],
  term ((366 : Rat) / 67) [(0, 2), (5, 1), (9, 1)],
  term ((-1284649081856 : Rat) / 31414578435) [(0, 2), (5, 1), (10, 1), (11, 1)],
  term ((-20072641904 : Rat) / 1163502905) [(0, 2), (5, 1), (10, 1), (13, 1)],
  term ((1158478189888 : Rat) / 31414578435) [(0, 2), (5, 1), (10, 1), (15, 1)],
  term ((-5248694750668 : Rat) / 94243735305) [(0, 2), (5, 1), (11, 1)],
  term ((1037120000 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (12, 1)],
  term ((-5178880 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((11422208 : Rat) / 548391) [(0, 2), (5, 1), (11, 1), (14, 1)],
  term ((-112977920 : Rat) / 110226591) [(0, 2), (5, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(0, 2), (5, 1), (11, 2), (15, 1)],
  term ((48615000 : Rat) / 12247399) [(0, 2), (5, 1), (12, 1), (13, 1)],
  term ((-698355088 : Rat) / 110226591) [(0, 2), (5, 1), (12, 1), (15, 1)],
  term ((-162439260179 : Rat) / 6981017430) [(0, 2), (5, 1), (13, 1)],
  term ((1606248 : Rat) / 182797) [(0, 2), (5, 1), (13, 1), (14, 1)],
  term ((-87496960 : Rat) / 110226591) [(0, 2), (5, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(0, 2), (5, 1), (13, 2), (15, 1)],
  term ((-650641576 : Rat) / 36742197) [(0, 2), (5, 1), (14, 1), (15, 1)],
  term ((4648147494974 : Rat) / 94243735305) [(0, 2), (5, 1), (15, 1)],
  term ((149447680 : Rat) / 110226591) [(0, 2), (5, 1), (15, 3)],
  term ((-218121304576 : Rat) / 10471526145) [(0, 2), (7, 1), (10, 1), (11, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(0, 2), (7, 1), (10, 1), (13, 1)],
  term ((196698676448 : Rat) / 10471526145) [(0, 2), (7, 1), (10, 1), (15, 1)],
  term ((15845359936 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1)],
  term ((-235234048 : Rat) / 6239241) [(0, 2), (7, 1), (11, 1), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(0, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7084430080 : Rat) / 330679773) [(0, 2), (7, 1), (11, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(0, 2), (7, 1), (11, 1), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(0, 2), (7, 1), (11, 2), (15, 1)],
  term ((-3675532 : Rat) / 231083) [(0, 2), (7, 1), (12, 1), (13, 1)],
  term ((198720992 : Rat) / 6239241) [(0, 2), (7, 1), (12, 1), (15, 1)],
  term ((247583749 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1)],
  term ((-110694220 : Rat) / 12247399) [(0, 2), (7, 1), (13, 1), (14, 1)],
  term ((6388637840 : Rat) / 330679773) [(0, 2), (7, 1), (14, 1), (15, 1)],
  term ((-13889342189 : Rat) / 330679773) [(0, 2), (7, 1), (15, 1)],
  term ((750898181824 : Rat) / 18848747061) [(0, 2), (9, 1), (10, 1), (11, 1)],
  term ((11732784091 : Rat) / 698101743) [(0, 2), (9, 1), (10, 1), (13, 1)],
  term ((-677149253252 : Rat) / 18848747061) [(0, 2), (9, 1), (10, 1), (15, 1)],
  term ((2156334100558 : Rat) / 94243735305) [(0, 2), (9, 1), (11, 1)],
  term ((11727666944 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (12, 1)],
  term ((5178880 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((11450555648 : Rat) / 330679773) [(0, 2), (9, 1), (11, 1), (14, 1)],
  term ((-42997760 : Rat) / 110226591) [(0, 2), (9, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(0, 2), (9, 1), (11, 2), (15, 1)],
  term ((183244796 : Rat) / 12247399) [(0, 2), (9, 1), (12, 1), (13, 1)],
  term ((-10575842512 : Rat) / 330679773) [(0, 2), (9, 1), (12, 1), (15, 1)],
  term ((42329969969 : Rat) / 6981017430) [(0, 2), (9, 1), (13, 1)],
  term ((178914932 : Rat) / 12247399) [(0, 2), (9, 1), (13, 1), (14, 1)],
  term ((21694720 : Rat) / 110226591) [(0, 2), (9, 1), (13, 1), (15, 2)],
  term ((-1153761280 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((17891829760 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((8588561120 : Rat) / 330679773) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((-18027520 : Rat) / 12247399) [(0, 2), (12, 1), (13, 2)],
  term ((-16134596480 : Rat) / 330679773) [(0, 2), (12, 1), (15, 2)],
  term ((-219618560 : Rat) / 330679773) [(0, 3), (3, 1), (11, 1)],
  term ((-3431540 : Rat) / 12247399) [(0, 3), (3, 1), (13, 1)],
  term ((198048880 : Rat) / 330679773) [(0, 3), (3, 1), (15, 1)],
  term ((4093454848 : Rat) / 110226591) [(0, 3), (5, 1), (11, 1)],
  term ((191880696 : Rat) / 12247399) [(0, 3), (5, 1), (13, 1)],
  term ((-3691419104 : Rat) / 110226591) [(0, 3), (5, 1), (15, 1)],
  term ((66519040 : Rat) / 330679773) [(0, 3), (7, 1), (11, 1)],
  term ((1039360 : Rat) / 12247399) [(0, 3), (7, 1), (13, 1)],
  term ((-59985920 : Rat) / 330679773) [(0, 3), (7, 1), (15, 1)],
  term ((-13434125824 : Rat) / 330679773) [(0, 3), (9, 1), (11, 1)],
  term ((-209908216 : Rat) / 12247399) [(0, 3), (9, 1), (13, 1)],
  term ((12114702752 : Rat) / 330679773) [(0, 3), (9, 1), (15, 1)],
  term ((576880640 : Rat) / 330679773) [(0, 3), (11, 1), (13, 1)],
  term ((-8945914880 : Rat) / 330679773) [(0, 3), (11, 1), (15, 1)],
  term ((-4294280560 : Rat) / 330679773) [(0, 3), (13, 1), (15, 1)],
  term ((9013760 : Rat) / 12247399) [(0, 3), (13, 2)],
  term ((8067298240 : Rat) / 330679773) [(0, 3), (15, 2)],
  term ((3490242560 : Rat) / 330679773) [(1, 1), (2, 1), (5, 1), (11, 1), (13, 1)],
  term ((-3147450880 : Rat) / 330679773) [(1, 1), (2, 1), (5, 1), (13, 1), (15, 1)],
  term ((54535040 : Rat) / 12247399) [(1, 1), (2, 1), (5, 1), (13, 2)],
  term ((-1696540160 : Rat) / 330679773) [(1, 1), (2, 1), (7, 1), (11, 1), (13, 1)],
  term ((1529915680 : Rat) / 330679773) [(1, 1), (2, 1), (7, 1), (13, 1), (15, 1)],
  term ((-26508440 : Rat) / 12247399) [(1, 1), (2, 1), (7, 1), (13, 2)],
  term ((-1209098240 : Rat) / 330679773) [(1, 1), (2, 1), (9, 1), (11, 1), (13, 1)],
  term ((1090347520 : Rat) / 330679773) [(1, 1), (2, 1), (9, 1), (13, 1), (15, 1)],
  term ((-18892160 : Rat) / 12247399) [(1, 1), (2, 1), (9, 1), (13, 2)],
  term ((-1570096640 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (12, 1), (14, 1)],
  term ((4204444160 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 1), (15, 1)],
  term ((-3059302400 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (13, 2)],
  term ((785048320 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (14, 2)],
  term ((785048320 : Rat) / 330679773) [(1, 1), (2, 1), (11, 1), (15, 2)],
  term ((-24532760 : Rat) / 12247399) [(1, 1), (2, 1), (12, 1), (13, 1), (14, 1)],
  term ((1415890720 : Rat) / 330679773) [(1, 1), (2, 1), (12, 1), (14, 1), (15, 1)],
  term ((12266380 : Rat) / 12247399) [(1, 1), (2, 1), (13, 1), (14, 2)],
  term ((-3460315420 : Rat) / 330679773) [(1, 1), (2, 1), (13, 1), (15, 2)],
  term ((4532585080 : Rat) / 330679773) [(1, 1), (2, 1), (13, 2), (15, 1)],
  term ((-47801600 : Rat) / 12247399) [(1, 1), (2, 1), (13, 3)],
  term ((-707945360 : Rat) / 330679773) [(1, 1), (2, 1), (14, 2), (15, 1)],
  term ((-707945360 : Rat) / 330679773) [(1, 1), (2, 1), (15, 3)],
  term ((157445120 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (12, 1), (13, 1)],
  term ((-138763520 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1)],
  term ((3145031680 : Rat) / 330679773) [(1, 1), (3, 1), (11, 1), (13, 1), (14, 1)],
  term ((-141981760 : Rat) / 330679773) [(1, 1), (3, 1), (12, 1), (13, 1), (15, 1)],
  term ((2460080 : Rat) / 12247399) [(1, 1), (3, 1), (12, 1), (13, 2)],
  term ((-2836144640 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (14, 1), (15, 1)],
  term ((125134960 : Rat) / 330679773) [(1, 1), (3, 1), (13, 1), (15, 1)],
  term ((-2168180 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2)],
  term ((49141120 : Rat) / 12247399) [(1, 1), (3, 1), (13, 2), (14, 1)],
  term ((-732 : Rat) / 67) [(1, 1), (5, 1), (9, 1), (13, 1)],
  term ((2569298163712 : Rat) / 31414578435) [(1, 1), (5, 1), (10, 1), (11, 1), (13, 1)],
  term ((-2316956379776 : Rat) / 31414578435) [(1, 1), (5, 1), (10, 1), (13, 1), (15, 1)],
  term ((40145283808 : Rat) / 1163502905) [(1, 1), (5, 1), (10, 1), (13, 2)],
  term ((-18448059392 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (12, 1), (13, 1)],
  term ((10497389501336 : Rat) / 94243735305) [(1, 1), (5, 1), (11, 1), (13, 1)],
  term ((-22844416 : Rat) / 548391) [(1, 1), (5, 1), (11, 1), (13, 1), (14, 1)],
  term ((225955840 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 1), (15, 2)],
  term ((10357760 : Rat) / 110226591) [(1, 1), (5, 1), (11, 1), (13, 2), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(1, 1), (5, 1), (11, 2), (13, 1), (15, 1)],
  term ((16162386592 : Rat) / 110226591) [(1, 1), (5, 1), (12, 1), (13, 1), (15, 1)],
  term ((-864752784 : Rat) / 12247399) [(1, 1), (5, 1), (12, 1), (13, 2)],
  term ((1301283152 : Rat) / 36742197) [(1, 1), (5, 1), (13, 1), (14, 1), (15, 1)],
  term ((-9296294989948 : Rat) / 94243735305) [(1, 1), (5, 1), (13, 1), (15, 1)],
  term ((-298895360 : Rat) / 110226591) [(1, 1), (5, 1), (13, 1), (15, 3)],
  term ((162439260179 : Rat) / 3490508715) [(1, 1), (5, 1), (13, 2)],
  term ((-3212496 : Rat) / 182797) [(1, 1), (5, 1), (13, 2), (14, 1)],
  term ((174993920 : Rat) / 110226591) [(1, 1), (5, 1), (13, 2), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (5, 1), (13, 3), (15, 1)],
  term ((436242609152 : Rat) / 10471526145) [(1, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-393397352896 : Rat) / 10471526145) [(1, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((20448872304 : Rat) / 1163502905) [(1, 1), (7, 1), (10, 1), (13, 2)],
  term ((8222910976 : Rat) / 110226591) [(1, 1), (7, 1), (11, 1), (12, 1), (13, 1)],
  term ((-31690719872 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1)],
  term ((14168860160 : Rat) / 330679773) [(1, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((175820800 : Rat) / 110226591) [(1, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-9139200 : Rat) / 12247399) [(1, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((-6941493824 : Rat) / 110226591) [(1, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((385448952 : Rat) / 12247399) [(1, 1), (7, 1), (12, 1), (13, 2)],
  term ((-12777275680 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((27778684378 : Rat) / 330679773) [(1, 1), (7, 1), (13, 1), (15, 1)],
  term ((-495167498 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2)],
  term ((221388440 : Rat) / 12247399) [(1, 1), (7, 1), (13, 2), (14, 1)],
  term ((-1501796363648 : Rat) / 18848747061) [(1, 1), (9, 1), (10, 1), (11, 1), (13, 1)],
  term ((1354298506504 : Rat) / 18848747061) [(1, 1), (9, 1), (10, 1), (13, 1), (15, 1)],
  term ((-23465568182 : Rat) / 698101743) [(1, 1), (9, 1), (10, 1), (13, 2)],
  term ((10093723136 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (12, 1), (13, 1)],
  term ((-4312668201116 : Rat) / 94243735305) [(1, 1), (9, 1), (11, 1), (13, 1)],
  term ((-22901111296 : Rat) / 330679773) [(1, 1), (9, 1), (11, 1), (13, 1), (14, 1)],
  term ((85995520 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 1), (15, 2)],
  term ((-10357760 : Rat) / 110226591) [(1, 1), (9, 1), (11, 1), (13, 2), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(1, 1), (9, 1), (11, 2), (13, 1), (15, 1)],
  term ((-9102375328 : Rat) / 110226591) [(1, 1), (9, 1), (12, 1), (13, 1), (15, 1)],
  term ((473143272 : Rat) / 12247399) [(1, 1), (9, 1), (12, 1), (13, 2)],
  term ((-42329969969 : Rat) / 3490508715) [(1, 1), (9, 1), (13, 2)],
  term ((-357829864 : Rat) / 12247399) [(1, 1), (9, 1), (13, 2), (14, 1)],
  term ((-43389440 : Rat) / 110226591) [(1, 1), (9, 1), (13, 2), (15, 2)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1709173760 : Rat) / 36742197) [(1, 1), (11, 1), (12, 1), (14, 1)],
  term ((758446080 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (14, 2)],
  term ((576880640 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (15, 2)],
  term ((-1153761280 : Rat) / 330679773) [(1, 1), (11, 1), (12, 2), (14, 1)],
  term ((19901163520 : Rat) / 330679773) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-1709173760 : Rat) / 36742197) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (14, 1), (15, 2)],
  term ((854586880 : Rat) / 36742197) [(1, 1), (11, 1), (14, 2)],
  term ((-9950581760 : Rat) / 330679773) [(1, 1), (11, 1), (14, 3)],
  term ((854586880 : Rat) / 36742197) [(1, 1), (11, 1), (15, 2)],
  term ((-240352560 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 1)],
  term ((319969440 : Rat) / 12247399) [(1, 1), (12, 1), (13, 1), (14, 2)],
  term ((1283816960 : Rat) / 330679773) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((1541308480 : Rat) / 36742197) [(1, 1), (12, 1), (14, 1), (15, 1)],
  term ((-683955840 : Rat) / 12247399) [(1, 1), (12, 1), (14, 2), (15, 1)],
  term ((-520222720 : Rat) / 330679773) [(1, 1), (12, 1), (15, 3)],
  term ((-18027520 : Rat) / 12247399) [(1, 1), (12, 2), (13, 1), (14, 1)],
  term ((1040445440 : Rat) / 330679773) [(1, 1), (12, 2), (14, 1), (15, 1)],
  term ((-22144486640 : Rat) / 330679773) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((120176280 : Rat) / 12247399) [(1, 1), (13, 1), (14, 2)],
  term ((-155477840 : Rat) / 12247399) [(1, 1), (13, 1), (14, 3)],
  term ((1901837320 : Rat) / 36742197) [(1, 1), (13, 1), (15, 2)],
  term ((310955680 : Rat) / 12247399) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-240352560 : Rat) / 12247399) [(1, 1), (13, 2), (15, 1)],
  term ((8973292480 : Rat) / 330679773) [(1, 1), (14, 1), (15, 3)],
  term ((-770654240 : Rat) / 36742197) [(1, 1), (14, 2), (15, 1)],
  term ((8973292480 : Rat) / 330679773) [(1, 1), (14, 3), (15, 1)],
  term ((-770654240 : Rat) / 36742197) [(1, 1), (15, 3)],
  term ((-1745121280 : Rat) / 330679773) [(1, 2), (2, 1), (5, 1), (11, 1)],
  term ((-27267520 : Rat) / 12247399) [(1, 2), (2, 1), (5, 1), (13, 1)],
  term ((1573725440 : Rat) / 330679773) [(1, 2), (2, 1), (5, 1), (15, 1)],
  term ((848270080 : Rat) / 330679773) [(1, 2), (2, 1), (7, 1), (11, 1)],
  term ((13254220 : Rat) / 12247399) [(1, 2), (2, 1), (7, 1), (13, 1)],
  term ((-764957840 : Rat) / 330679773) [(1, 2), (2, 1), (7, 1), (15, 1)],
  term ((604549120 : Rat) / 330679773) [(1, 2), (2, 1), (9, 1), (11, 1)],
  term ((9446080 : Rat) / 12247399) [(1, 2), (2, 1), (9, 1), (13, 1)],
  term ((-545173760 : Rat) / 330679773) [(1, 2), (2, 1), (9, 1), (15, 1)],
  term ((1033249280 : Rat) / 110226591) [(1, 2), (2, 1), (11, 1), (13, 1)],
  term ((-54476800 : Rat) / 6239241) [(1, 2), (2, 1), (11, 1), (15, 1)],
  term ((-1337791840 : Rat) / 110226591) [(1, 2), (2, 1), (13, 1), (15, 1)],
  term ((48433560 : Rat) / 12247399) [(1, 2), (2, 1), (13, 2)],
  term ((49126400 : Rat) / 6239241) [(1, 2), (2, 1), (15, 2)],
  term ((69381760 : Rat) / 330679773) [(1, 2), (3, 1), (11, 1)],
  term ((-78722560 : Rat) / 330679773) [(1, 2), (3, 1), (11, 1), (12, 1)],
  term ((-1572515840 : Rat) / 330679773) [(1, 2), (3, 1), (11, 1), (14, 1)],
  term ((-1230040 : Rat) / 12247399) [(1, 2), (3, 1), (12, 1), (13, 1)],
  term ((70990880 : Rat) / 330679773) [(1, 2), (3, 1), (12, 1), (15, 1)],
  term ((1084090 : Rat) / 12247399) [(1, 2), (3, 1), (13, 1)],
  term ((-24570560 : Rat) / 12247399) [(1, 2), (3, 1), (13, 1), (14, 1)],
  term ((1418072320 : Rat) / 330679773) [(1, 2), (3, 1), (14, 1), (15, 1)],
  term ((-62567480 : Rat) / 330679773) [(1, 2), (3, 1), (15, 1)],
  term ((366 : Rat) / 67) [(1, 2), (5, 1), (9, 1)],
  term ((-1284649081856 : Rat) / 31414578435) [(1, 2), (5, 1), (10, 1), (11, 1)],
  term ((-20072641904 : Rat) / 1163502905) [(1, 2), (5, 1), (10, 1), (13, 1)],
  term ((1158478189888 : Rat) / 31414578435) [(1, 2), (5, 1), (10, 1), (15, 1)],
  term ((-5248694750668 : Rat) / 94243735305) [(1, 2), (5, 1), (11, 1)],
  term ((9224029696 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (12, 1)],
  term ((-5178880 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((11422208 : Rat) / 548391) [(1, 2), (5, 1), (11, 1), (14, 1)],
  term ((-112977920 : Rat) / 110226591) [(1, 2), (5, 1), (11, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(1, 2), (5, 1), (11, 2), (15, 1)],
  term ((432376392 : Rat) / 12247399) [(1, 2), (5, 1), (12, 1), (13, 1)],
  term ((-8081193296 : Rat) / 110226591) [(1, 2), (5, 1), (12, 1), (15, 1)],
  term ((-162439260179 : Rat) / 6981017430) [(1, 2), (5, 1), (13, 1)],
  term ((1606248 : Rat) / 182797) [(1, 2), (5, 1), (13, 1), (14, 1)],
  term ((-87496960 : Rat) / 110226591) [(1, 2), (5, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 2), (5, 1), (13, 2), (15, 1)],
  term ((-650641576 : Rat) / 36742197) [(1, 2), (5, 1), (14, 1), (15, 1)],
  term ((4648147494974 : Rat) / 94243735305) [(1, 2), (5, 1), (15, 1)],
  term ((149447680 : Rat) / 110226591) [(1, 2), (5, 1), (15, 3)],
  term ((-218121304576 : Rat) / 10471526145) [(1, 2), (7, 1), (10, 1), (11, 1)],
  term ((-10224436152 : Rat) / 1163502905) [(1, 2), (7, 1), (10, 1), (13, 1)],
  term ((196698676448 : Rat) / 10471526145) [(1, 2), (7, 1), (10, 1), (15, 1)],
  term ((15845359936 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1)],
  term ((-4111455488 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (12, 1)],
  term ((4569600 : Rat) / 12247399) [(1, 2), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-7084430080 : Rat) / 330679773) [(1, 2), (7, 1), (11, 1), (14, 1)],
  term ((-87910400 : Rat) / 110226591) [(1, 2), (7, 1), (11, 1), (15, 2)],
  term ((97484800 : Rat) / 110226591) [(1, 2), (7, 1), (11, 2), (15, 1)],
  term ((-192724476 : Rat) / 12247399) [(1, 2), (7, 1), (12, 1), (13, 1)],
  term ((3470746912 : Rat) / 110226591) [(1, 2), (7, 1), (12, 1), (15, 1)],
  term ((247583749 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1)],
  term ((-110694220 : Rat) / 12247399) [(1, 2), (7, 1), (13, 1), (14, 1)],
  term ((6388637840 : Rat) / 330679773) [(1, 2), (7, 1), (14, 1), (15, 1)],
  term ((-13889342189 : Rat) / 330679773) [(1, 2), (7, 1), (15, 1)],
  term ((750898181824 : Rat) / 18848747061) [(1, 2), (9, 1), (10, 1), (11, 1)],
  term ((11732784091 : Rat) / 698101743) [(1, 2), (9, 1), (10, 1), (13, 1)],
  term ((-677149253252 : Rat) / 18848747061) [(1, 2), (9, 1), (10, 1), (15, 1)],
  term ((2156334100558 : Rat) / 94243735305) [(1, 2), (9, 1), (11, 1)],
  term ((-5046861568 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (12, 1)],
  term ((5178880 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((11450555648 : Rat) / 330679773) [(1, 2), (9, 1), (11, 1), (14, 1)],
  term ((-42997760 : Rat) / 110226591) [(1, 2), (9, 1), (11, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(1, 2), (9, 1), (11, 2), (15, 1)],
  term ((-236571636 : Rat) / 12247399) [(1, 2), (9, 1), (12, 1), (13, 1)],
  term ((4551187664 : Rat) / 110226591) [(1, 2), (9, 1), (12, 1), (15, 1)],
  term ((42329969969 : Rat) / 6981017430) [(1, 2), (9, 1), (13, 1)],
  term ((178914932 : Rat) / 12247399) [(1, 2), (9, 1), (13, 1), (14, 1)],
  term ((21694720 : Rat) / 110226591) [(1, 2), (9, 1), (13, 1), (15, 2)],
  term ((1153761280 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((1709173760 : Rat) / 36742197) [(1, 2), (11, 1), (13, 1)],
  term ((-19901163520 : Rat) / 330679773) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((-1040445440 : Rat) / 330679773) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((18027520 : Rat) / 12247399) [(1, 2), (12, 1), (13, 2)],
  term ((17946584960 : Rat) / 330679773) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-1541308480 : Rat) / 36742197) [(1, 2), (13, 1), (15, 1)],
  term ((240352560 : Rat) / 12247399) [(1, 2), (13, 2)],
  term ((-310955680 : Rat) / 12247399) [(1, 2), (13, 2), (14, 1)],
  term ((-785048320 : Rat) / 330679773) [(1, 3), (2, 1), (11, 1)],
  term ((-12266380 : Rat) / 12247399) [(1, 3), (2, 1), (13, 1)],
  term ((707945360 : Rat) / 330679773) [(1, 3), (2, 1), (15, 1)],
  term ((-854586880 : Rat) / 36742197) [(1, 3), (11, 1)],
  term ((-576880640 : Rat) / 330679773) [(1, 3), (11, 1), (12, 1)],
  term ((9950581760 : Rat) / 330679773) [(1, 3), (11, 1), (14, 1)],
  term ((-9013760 : Rat) / 12247399) [(1, 3), (12, 1), (13, 1)],
  term ((520222720 : Rat) / 330679773) [(1, 3), (12, 1), (15, 1)],
  term ((-120176280 : Rat) / 12247399) [(1, 3), (13, 1)],
  term ((155477840 : Rat) / 12247399) [(1, 3), (13, 1), (14, 1)],
  term ((-8973292480 : Rat) / 330679773) [(1, 3), (14, 1), (15, 1)],
  term ((770654240 : Rat) / 36742197) [(1, 3), (15, 1)],
  term ((-3490242560 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-3490242560 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (13, 1), (15, 1)],
  term ((1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (14, 2)],
  term ((1745121280 : Rat) / 330679773) [(2, 1), (5, 1), (11, 1), (15, 2)],
  term ((-54535040 : Rat) / 12247399) [(2, 1), (5, 1), (12, 1), (13, 1), (14, 1)],
  term ((3147450880 : Rat) / 330679773) [(2, 1), (5, 1), (12, 1), (14, 1), (15, 1)],
  term ((27267520 : Rat) / 12247399) [(2, 1), (5, 1), (13, 1), (14, 2)],
  term ((3883673920 : Rat) / 330679773) [(2, 1), (5, 1), (13, 1), (15, 2)],
  term ((-54535040 : Rat) / 12247399) [(2, 1), (5, 1), (13, 2), (15, 1)],
  term ((-1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (14, 2), (15, 1)],
  term ((-1573725440 : Rat) / 330679773) [(2, 1), (5, 1), (15, 3)],
  term ((1696540160 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((1696540160 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-848270080 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (14, 2)],
  term ((-848270080 : Rat) / 330679773) [(2, 1), (7, 1), (11, 1), (15, 2)],
  term ((26508440 : Rat) / 12247399) [(2, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1529915680 : Rat) / 330679773) [(2, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-13254220 : Rat) / 12247399) [(2, 1), (7, 1), (13, 1), (14, 2)],
  term ((-1887779620 : Rat) / 330679773) [(2, 1), (7, 1), (13, 1), (15, 2)],
  term ((26508440 : Rat) / 12247399) [(2, 1), (7, 1), (13, 2), (15, 1)],
  term ((764957840 : Rat) / 330679773) [(2, 1), (7, 1), (14, 2), (15, 1)],
  term ((764957840 : Rat) / 330679773) [(2, 1), (7, 1), (15, 3)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (12, 1), (14, 1)],
  term ((1209098240 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (14, 2)],
  term ((-604549120 : Rat) / 330679773) [(2, 1), (9, 1), (11, 1), (15, 2)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1090347520 : Rat) / 330679773) [(2, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-9446080 : Rat) / 12247399) [(2, 1), (9, 1), (13, 1), (14, 2)],
  term ((-1345391680 : Rat) / 330679773) [(2, 1), (9, 1), (13, 1), (15, 2)],
  term ((18892160 : Rat) / 12247399) [(2, 1), (9, 1), (13, 2), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 1), (14, 2), (15, 1)],
  term ((545173760 : Rat) / 330679773) [(2, 1), (9, 1), (15, 3)],
  term ((3059302400 : Rat) / 330679773) [(2, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-108953600 : Rat) / 6239241) [(2, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-1529651200 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (14, 2)],
  term ((-7304192000 : Rat) / 330679773) [(2, 1), (11, 1), (13, 1), (15, 2)],
  term ((3059302400 : Rat) / 330679773) [(2, 1), (11, 1), (13, 2), (15, 1)],
  term ((54476800 : Rat) / 6239241) [(2, 1), (11, 1), (14, 2), (15, 1)],
  term ((54476800 : Rat) / 6239241) [(2, 1), (11, 1), (15, 3)],
  term ((-5194969600 : Rat) / 330679773) [(2, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((47801600 : Rat) / 12247399) [(2, 1), (12, 1), (13, 2), (14, 1)],
  term ((98252800 : Rat) / 6239241) [(2, 1), (12, 1), (14, 1), (15, 2)],
  term ((2597484800 : Rat) / 330679773) [(2, 1), (13, 1), (14, 2), (15, 1)],
  term ((7804883200 : Rat) / 330679773) [(2, 1), (13, 1), (15, 3)],
  term ((-23900800 : Rat) / 12247399) [(2, 1), (13, 2), (14, 2)],
  term ((-5840291200 : Rat) / 330679773) [(2, 1), (13, 2), (15, 2)],
  term ((47801600 : Rat) / 12247399) [(2, 1), (13, 3), (15, 1)],
  term ((-49126400 : Rat) / 6239241) [(2, 1), (14, 2), (15, 2)],
  term ((-49126400 : Rat) / 6239241) [(2, 1), (15, 4)],
  term ((-157445120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((138763520 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (14, 1)],
  term ((-1022103040 : Rat) / 110226591) [(3, 1), (11, 1), (12, 1), (14, 2)],
  term ((78722560 : Rat) / 330679773) [(3, 1), (11, 1), (12, 1), (15, 2)],
  term ((-157445120 : Rat) / 330679773) [(3, 1), (11, 1), (12, 2), (14, 1)],
  term ((-3145031680 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((138763520 : Rat) / 330679773) [(3, 1), (11, 1), (13, 1), (15, 1)],
  term ((1572515840 : Rat) / 330679773) [(3, 1), (11, 1), (14, 1), (15, 2)],
  term ((-69381760 : Rat) / 330679773) [(3, 1), (11, 1), (14, 2)],
  term ((1572515840 : Rat) / 330679773) [(3, 1), (11, 1), (14, 3)],
  term ((-69381760 : Rat) / 330679773) [(3, 1), (11, 1), (15, 2)],
  term ((2168180 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 1)],
  term ((-47911080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 1), (14, 2)],
  term ((175192840 : Rat) / 330679773) [(3, 1), (12, 1), (13, 1), (15, 2)],
  term ((-2460080 : Rat) / 12247399) [(3, 1), (12, 1), (13, 2), (15, 1)],
  term ((-125134960 : Rat) / 330679773) [(3, 1), (12, 1), (14, 1), (15, 1)],
  term ((921717920 : Rat) / 110226591) [(3, 1), (12, 1), (14, 2), (15, 1)],
  term ((-70990880 : Rat) / 330679773) [(3, 1), (12, 1), (15, 3)],
  term ((-2460080 : Rat) / 12247399) [(3, 1), (12, 2), (13, 1), (14, 1)],
  term ((141981760 : Rat) / 330679773) [(3, 1), (12, 2), (14, 1), (15, 1)],
  term ((3499549760 : Rat) / 330679773) [(3, 1), (13, 1), (14, 1), (15, 2)],
  term ((-1084090 : Rat) / 12247399) [(3, 1), (13, 1), (14, 2)],
  term ((24570560 : Rat) / 12247399) [(3, 1), (13, 1), (14, 3)],
  term ((-154405390 : Rat) / 330679773) [(3, 1), (13, 1), (15, 2)],
  term ((-49141120 : Rat) / 12247399) [(3, 1), (13, 2), (14, 1), (15, 1)],
  term ((2168180 : Rat) / 12247399) [(3, 1), (13, 2), (15, 1)],
  term ((-1418072320 : Rat) / 330679773) [(3, 1), (14, 1), (15, 3)],
  term ((62567480 : Rat) / 330679773) [(3, 1), (14, 2), (15, 1)],
  term ((-1418072320 : Rat) / 330679773) [(3, 1), (14, 3), (15, 1)],
  term ((62567480 : Rat) / 330679773) [(3, 1), (15, 3)],
  term ((732 : Rat) / 67) [(5, 1), (9, 1), (12, 1), (14, 1)],
  term ((732 : Rat) / 67) [(5, 1), (9, 1), (13, 1), (15, 1)],
  term ((-366 : Rat) / 67) [(5, 1), (9, 1), (14, 2)],
  term ((-366 : Rat) / 67) [(5, 1), (9, 1), (15, 2)],
  term ((-2569298163712 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-2569298163712 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((1284649081856 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (14, 2)],
  term ((1284649081856 : Rat) / 31414578435) [(5, 1), (10, 1), (11, 1), (15, 2)],
  term ((-40145283808 : Rat) / 1163502905) [(5, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((2316956379776 : Rat) / 31414578435) [(5, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((20072641904 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 1), (14, 2)],
  term ((2858917711184 : Rat) / 31414578435) [(5, 1), (10, 1), (13, 1), (15, 2)],
  term ((-40145283808 : Rat) / 1163502905) [(5, 1), (10, 1), (13, 2), (15, 1)],
  term ((-1158478189888 : Rat) / 31414578435) [(5, 1), (10, 1), (14, 2), (15, 1)],
  term ((-1158478189888 : Rat) / 31414578435) [(5, 1), (10, 1), (15, 3)],
  term ((-10357760 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((18448059392 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-10497389501336 : Rat) / 94243735305) [(5, 1), (11, 1), (12, 1), (14, 1)],
  term ((-225955840 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-4632302080 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (14, 2)],
  term ((-9224029696 : Rat) / 110226591) [(5, 1), (11, 1), (12, 1), (15, 2)],
  term ((18448059392 : Rat) / 110226591) [(5, 1), (11, 1), (12, 2), (14, 1)],
  term ((22844416 : Rat) / 548391) [(5, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((5178880 : Rat) / 110226591) [(5, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((-10497389501336 : Rat) / 94243735305) [(5, 1), (11, 1), (13, 1), (15, 1)],
  term ((-73592320 : Rat) / 36742197) [(5, 1), (11, 1), (13, 1), (15, 3)],
  term ((-10357760 : Rat) / 110226591) [(5, 1), (11, 1), (13, 2), (15, 2)],
  term ((-11422208 : Rat) / 548391) [(5, 1), (11, 1), (14, 1), (15, 2)],
  term ((5248694750668 : Rat) / 94243735305) [(5, 1), (11, 1), (14, 2)],
  term ((112977920 : Rat) / 110226591) [(5, 1), (11, 1), (14, 2), (15, 2)],
  term ((-11422208 : Rat) / 548391) [(5, 1), (11, 1), (14, 3)],
  term ((5248694750668 : Rat) / 94243735305) [(5, 1), (11, 1), (15, 2)],
  term ((112977920 : Rat) / 110226591) [(5, 1), (11, 1), (15, 4)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(5, 1), (11, 2), (13, 1), (15, 2)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (14, 2), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(5, 1), (11, 2), (15, 3)],
  term ((-162439260179 : Rat) / 3490508715) [(5, 1), (12, 1), (13, 1), (14, 1)],
  term ((-174993920 : Rat) / 110226591) [(5, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-217139160 : Rat) / 12247399) [(5, 1), (12, 1), (13, 1), (14, 2)],
  term ((-20053774120 : Rat) / 110226591) [(5, 1), (12, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((864752784 : Rat) / 12247399) [(5, 1), (12, 1), (13, 2), (15, 1)],
  term ((9296294989948 : Rat) / 94243735305) [(5, 1), (12, 1), (14, 1), (15, 1)],
  term ((298895360 : Rat) / 110226591) [(5, 1), (12, 1), (14, 1), (15, 3)],
  term ((4177343840 : Rat) / 110226591) [(5, 1), (12, 1), (14, 2), (15, 1)],
  term ((8081193296 : Rat) / 110226591) [(5, 1), (12, 1), (15, 3)],
  term ((864752784 : Rat) / 12247399) [(5, 1), (12, 2), (13, 1), (14, 1)],
  term ((-16162386592 : Rat) / 110226591) [(5, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1624139000 : Rat) / 36742197) [(5, 1), (13, 1), (14, 1), (15, 2)],
  term ((162439260179 : Rat) / 6981017430) [(5, 1), (13, 1), (14, 2)],
  term ((87496960 : Rat) / 110226591) [(5, 1), (13, 1), (14, 2), (15, 2)],
  term ((-1606248 : Rat) / 182797) [(5, 1), (13, 1), (14, 3)],
  term ((22978450004729 : Rat) / 188487470610) [(5, 1), (13, 1), (15, 2)],
  term ((42932480 : Rat) / 12247399) [(5, 1), (13, 1), (15, 4)],
  term ((3212496 : Rat) / 182797) [(5, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(5, 1), (13, 2), (14, 2), (15, 1)],
  term ((-162439260179 : Rat) / 3490508715) [(5, 1), (13, 2), (15, 1)],
  term ((-183219200 : Rat) / 110226591) [(5, 1), (13, 2), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(5, 1), (13, 3), (15, 2)],
  term ((650641576 : Rat) / 36742197) [(5, 1), (14, 1), (15, 3)],
  term ((-4648147494974 : Rat) / 94243735305) [(5, 1), (14, 2), (15, 1)],
  term ((-149447680 : Rat) / 110226591) [(5, 1), (14, 2), (15, 3)],
  term ((650641576 : Rat) / 36742197) [(5, 1), (14, 3), (15, 1)],
  term ((-4648147494974 : Rat) / 94243735305) [(5, 1), (15, 3)],
  term ((-149447680 : Rat) / 110226591) [(5, 1), (15, 5)],
  term ((-436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-436242609152 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (14, 2)],
  term ((218121304576 : Rat) / 10471526145) [(7, 1), (10, 1), (11, 1), (15, 2)],
  term ((-20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((393397352896 : Rat) / 10471526145) [(7, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((10224436152 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 1), (14, 2)],
  term ((485417278264 : Rat) / 10471526145) [(7, 1), (10, 1), (13, 1), (15, 2)],
  term ((-20448872304 : Rat) / 1163502905) [(7, 1), (10, 1), (13, 2), (15, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (14, 2), (15, 1)],
  term ((-196698676448 : Rat) / 10471526145) [(7, 1), (10, 1), (15, 3)],
  term ((9139200 : Rat) / 12247399) [(7, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-8222910976 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((31690719872 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-175820800 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1834493696 : Rat) / 330679773) [(7, 1), (11, 1), (12, 1), (14, 2)],
  term ((4111455488 : Rat) / 110226591) [(7, 1), (11, 1), (12, 1), (15, 2)],
  term ((-8222910976 : Rat) / 110226591) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-14168860160 : Rat) / 330679773) [(7, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4569600 : Rat) / 12247399) [(7, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((31690719872 : Rat) / 330679773) [(7, 1), (11, 1), (13, 1), (15, 1)],
  term ((-216947200 : Rat) / 110226591) [(7, 1), (11, 1), (13, 1), (15, 3)],
  term ((9139200 : Rat) / 12247399) [(7, 1), (11, 1), (13, 2), (15, 2)],
  term ((7084430080 : Rat) / 330679773) [(7, 1), (11, 1), (14, 1), (15, 2)],
  term ((-15845359936 : Rat) / 330679773) [(7, 1), (11, 1), (14, 2)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (14, 2), (15, 2)],
  term ((7084430080 : Rat) / 330679773) [(7, 1), (11, 1), (14, 3)],
  term ((-15845359936 : Rat) / 330679773) [(7, 1), (11, 1), (15, 2)],
  term ((87910400 : Rat) / 110226591) [(7, 1), (11, 1), (15, 4)],
  term ((194969600 : Rat) / 110226591) [(7, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(7, 1), (11, 2), (13, 1), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (14, 2), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(7, 1), (11, 2), (15, 3)],
  term ((495167498 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-28663964 : Rat) / 12247399) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((8676014108 : Rat) / 110226591) [(7, 1), (12, 1), (13, 1), (15, 2)],
  term ((-385448952 : Rat) / 12247399) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-27778684378 : Rat) / 330679773) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((2365034944 : Rat) / 330679773) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3470746912 : Rat) / 110226591) [(7, 1), (12, 1), (15, 3)],
  term ((-385448952 : Rat) / 12247399) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((6941493824 : Rat) / 110226591) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((15766019620 : Rat) / 330679773) [(7, 1), (13, 1), (14, 1), (15, 2)],
  term ((-247583749 : Rat) / 12247399) [(7, 1), (13, 1), (14, 2)],
  term ((110694220 : Rat) / 12247399) [(7, 1), (13, 1), (14, 3)],
  term ((-34463445601 : Rat) / 330679773) [(7, 1), (13, 1), (15, 2)],
  term ((-221388440 : Rat) / 12247399) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((495167498 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)],
  term ((-6388637840 : Rat) / 330679773) [(7, 1), (14, 1), (15, 3)],
  term ((13889342189 : Rat) / 330679773) [(7, 1), (14, 2), (15, 1)],
  term ((-6388637840 : Rat) / 330679773) [(7, 1), (14, 3), (15, 1)],
  term ((13889342189 : Rat) / 330679773) [(7, 1), (15, 3)],
  term ((1501796363648 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((1501796363648 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((-750898181824 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (14, 2)],
  term ((-750898181824 : Rat) / 18848747061) [(9, 1), (10, 1), (11, 1), (15, 2)],
  term ((23465568182 : Rat) / 698101743) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1354298506504 : Rat) / 18848747061) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-11732784091 : Rat) / 698101743) [(9, 1), (10, 1), (13, 1), (14, 2)],
  term ((-1671083676961 : Rat) / 18848747061) [(9, 1), (10, 1), (13, 1), (15, 2)],
  term ((23465568182 : Rat) / 698101743) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((677149253252 : Rat) / 18848747061) [(9, 1), (10, 1), (14, 2), (15, 1)],
  term ((677149253252 : Rat) / 18848747061) [(9, 1), (10, 1), (15, 3)],
  term ((10357760 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10093723136 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((4312668201116 : Rat) / 94243735305) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((-85995520 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (14, 1), (15, 2)],
  term ((38041696000 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((5046861568 : Rat) / 110226591) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-10093723136 : Rat) / 110226591) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((22901111296 : Rat) / 330679773) [(9, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-5178880 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (14, 2), (15, 1)],
  term ((4312668201116 : Rat) / 94243735305) [(9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-91174400 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 3)],
  term ((10357760 : Rat) / 110226591) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((-11450555648 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1), (15, 2)],
  term ((-2156334100558 : Rat) / 94243735305) [(9, 1), (11, 1), (14, 2)],
  term ((42997760 : Rat) / 110226591) [(9, 1), (11, 1), (14, 2), (15, 2)],
  term ((-11450555648 : Rat) / 330679773) [(9, 1), (11, 1), (14, 3)],
  term ((-2156334100558 : Rat) / 94243735305) [(9, 1), (11, 1), (15, 2)],
  term ((42997760 : Rat) / 110226591) [(9, 1), (11, 1), (15, 4)],
  term ((38993920 : Rat) / 36742197) [(9, 1), (11, 2), (12, 1), (14, 1), (15, 1)],
  term ((38993920 : Rat) / 36742197) [(9, 1), (11, 2), (13, 1), (15, 2)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (14, 2), (15, 1)],
  term ((-19496960 : Rat) / 36742197) [(9, 1), (11, 2), (15, 3)],
  term ((42329969969 : Rat) / 3490508715) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((43389440 : Rat) / 110226591) [(9, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((594401500 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((11231520052 : Rat) / 110226591) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((-473143272 : Rat) / 12247399) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-4551187664 : Rat) / 110226591) [(9, 1), (12, 1), (15, 3)],
  term ((-473143272 : Rat) / 12247399) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((9102375328 : Rat) / 110226591) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-178914932 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-42329969969 : Rat) / 6981017430) [(9, 1), (13, 1), (14, 2)],
  term ((-21694720 : Rat) / 110226591) [(9, 1), (13, 1), (14, 2), (15, 2)],
  term ((-178914932 : Rat) / 12247399) [(9, 1), (13, 1), (14, 3)],
  term ((-42329969969 : Rat) / 6981017430) [(9, 1), (13, 1), (15, 2)],
  term ((-21694720 : Rat) / 110226591) [(9, 1), (13, 1), (15, 4)],
  term ((357829864 : Rat) / 12247399) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((42329969969 : Rat) / 3490508715) [(9, 1), (13, 2), (15, 1)],
  term ((43389440 : Rat) / 110226591) [(9, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 0 through 99. -/
theorem rs_R009_ueqv_R009NNNYN_block_27_0000_0099_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_27_0000_0099
      rs_R009_ueqv_R009NNNYN_block_27_0000_0099 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
