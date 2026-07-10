/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 27:100-133

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 27 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 : Poly :=
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

/-- Coefficient term 100 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0100 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 100 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0100 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (9, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (9, 1), (13, 3), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (9, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 3)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0100
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0101 : Poly :=
[
  term ((-10681304872 : Rat) / 330679773) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 101 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0101 : Poly :=
[
  term ((21362609744 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10681304872 : Rat) / 330679773) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((21362609744 : Rat) / 330679773) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((-10681304872 : Rat) / 330679773) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-21362609744 : Rat) / 330679773) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-21362609744 : Rat) / 330679773) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((10681304872 : Rat) / 330679773) [(9, 1), (14, 1), (15, 3)],
  term ((10681304872 : Rat) / 330679773) [(9, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0101
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0102 : Poly :=
[
  term ((-1334051823734 : Rat) / 94243735305) [(9, 1), (15, 1)]
]

/-- Partial product 102 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0102 : Poly :=
[
  term ((2668103647468 : Rat) / 94243735305) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((-1334051823734 : Rat) / 94243735305) [(0, 2), (9, 1), (15, 1)],
  term ((2668103647468 : Rat) / 94243735305) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((-1334051823734 : Rat) / 94243735305) [(1, 2), (9, 1), (15, 1)],
  term ((-2668103647468 : Rat) / 94243735305) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2668103647468 : Rat) / 94243735305) [(9, 1), (13, 1), (15, 2)],
  term ((1334051823734 : Rat) / 94243735305) [(9, 1), (14, 2), (15, 1)],
  term ((1334051823734 : Rat) / 94243735305) [(9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0102
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0103 : Poly :=
[
  term ((-8791040 : Rat) / 110226591) [(9, 1), (15, 3)]
]

/-- Partial product 103 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0103 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(0, 2), (9, 1), (15, 3)],
  term ((17582080 : Rat) / 110226591) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((-8791040 : Rat) / 110226591) [(1, 2), (9, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (13, 1), (15, 4)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (14, 2), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0103
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0104 : Poly :=
[
  term ((-366 : Rat) / 67) [(9, 2)]
]

/-- Partial product 104 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0104 : Poly :=
[
  term ((732 : Rat) / 67) [(0, 1), (9, 2), (12, 1)],
  term ((-366 : Rat) / 67) [(0, 2), (9, 2)],
  term ((732 : Rat) / 67) [(1, 1), (9, 2), (13, 1)],
  term ((-366 : Rat) / 67) [(1, 2), (9, 2)],
  term ((-732 : Rat) / 67) [(9, 2), (12, 1), (14, 1)],
  term ((-732 : Rat) / 67) [(9, 2), (13, 1), (15, 1)],
  term ((366 : Rat) / 67) [(9, 2), (14, 2)],
  term ((366 : Rat) / 67) [(9, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0104
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0105 : Poly :=
[
  term ((120 : Rat) / 67) [(10, 1)]
]

/-- Partial product 105 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0105 : Poly :=
[
  term ((-240 : Rat) / 67) [(0, 1), (10, 1), (12, 1)],
  term ((120 : Rat) / 67) [(0, 2), (10, 1)],
  term ((-240 : Rat) / 67) [(1, 1), (10, 1), (13, 1)],
  term ((120 : Rat) / 67) [(1, 2), (10, 1)],
  term ((240 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((240 : Rat) / 67) [(10, 1), (13, 1), (15, 1)],
  term ((-120 : Rat) / 67) [(10, 1), (14, 2)],
  term ((-120 : Rat) / 67) [(10, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0105
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0106 : Poly :=
[
  term ((-56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 106 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0106 : Poly :=
[
  term ((113004316796 : Rat) / 3490508715) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((113004316796 : Rat) / 3490508715) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((-56502158398 : Rat) / 3490508715) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((-113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0106
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0107 : Poly :=
[
  term ((3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 1)]
]

/-- Partial product 107 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0107 : Poly :=
[
  term ((-6488623624912 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((3244311812456 : Rat) / 94243735305) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-6488623624912 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((3244311812456 : Rat) / 94243735305) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0107
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0108 : Poly :=
[
  term ((-3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2)]
]

/-- Partial product 108 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0108 : Poly :=
[
  term ((7232276274944 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(0, 2), (10, 1), (11, 2)],
  term ((7232276274944 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(1, 2), (10, 1), (11, 2)],
  term ((-7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (14, 2)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0108
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0109 : Poly :=
[
  term ((-913920 : Rat) / 12247399) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 109 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0109 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 1), (15, 3)],
  term ((-1827840 : Rat) / 12247399) [(10, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0109
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0110 : Poly :=
[
  term ((17582080 : Rat) / 110226591) [(10, 1), (15, 2)]
]

/-- Partial product 110 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0110 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(0, 2), (10, 1), (15, 2)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((17582080 : Rat) / 110226591) [(1, 2), (10, 1), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((35164160 : Rat) / 110226591) [(10, 1), (13, 1), (15, 3)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (14, 2), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0110
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0111 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1)]
]

/-- Partial product 111 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0111 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((-1827840 : Rat) / 12247399) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 2), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0111
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0112 : Poly :=
[
  term ((-28979200 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 112 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0112 : Poly :=
[
  term ((57958400 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-28979200 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((57958400 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((-28979200 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((-57958400 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((28979200 : Rat) / 330679773) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((28979200 : Rat) / 330679773) [(11, 1), (12, 1), (15, 3)],
  term ((-57958400 : Rat) / 330679773) [(11, 1), (12, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0112
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0113 : Poly :=
[
  term ((136885937069 : Rat) / 62829156870) [(11, 1), (13, 1)]
]

/-- Partial product 113 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0113 : Poly :=
[
  term ((-136885937069 : Rat) / 31414578435) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((136885937069 : Rat) / 62829156870) [(0, 2), (11, 1), (13, 1)],
  term ((-136885937069 : Rat) / 31414578435) [(1, 1), (11, 1), (13, 2)],
  term ((136885937069 : Rat) / 62829156870) [(1, 2), (11, 1), (13, 1)],
  term ((136885937069 : Rat) / 31414578435) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-136885937069 : Rat) / 62829156870) [(11, 1), (13, 1), (14, 2)],
  term ((-136885937069 : Rat) / 62829156870) [(11, 1), (13, 1), (15, 2)],
  term ((136885937069 : Rat) / 31414578435) [(11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0113
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0114 : Poly :=
[
  term ((257850880 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 114 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0114 : Poly :=
[
  term ((-515701760 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((257850880 : Rat) / 330679773) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((-515701760 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((257850880 : Rat) / 330679773) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((515701760 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-257850880 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-257850880 : Rat) / 330679773) [(11, 1), (13, 1), (14, 3)],
  term ((515701760 : Rat) / 330679773) [(11, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0114
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0115 : Poly :=
[
  term ((2981120 : Rat) / 110226591) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 115 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0115 : Poly :=
[
  term ((-5962240 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((2981120 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((2981120 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((5962240 : Rat) / 110226591) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2981120 : Rat) / 110226591) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-2981120 : Rat) / 110226591) [(11, 1), (13, 1), (15, 4)],
  term ((5962240 : Rat) / 110226591) [(11, 1), (13, 2), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0115
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0116 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 116 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0116 : Poly :=
[
  term ((-1827840 : Rat) / 12247399) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((913920 : Rat) / 12247399) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(11, 1), (13, 2), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0116
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0117 : Poly :=
[
  term ((-195143680 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 117 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0117 : Poly :=
[
  term ((390287360 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-195143680 : Rat) / 110226591) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((390287360 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((-195143680 : Rat) / 110226591) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-390287360 : Rat) / 110226591) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((-390287360 : Rat) / 110226591) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((195143680 : Rat) / 110226591) [(11, 1), (14, 1), (15, 3)],
  term ((195143680 : Rat) / 110226591) [(11, 1), (14, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0117
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0118 : Poly :=
[
  term ((-5316714568 : Rat) / 1406622915) [(11, 1), (15, 1)]
]

/-- Partial product 118 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0118 : Poly :=
[
  term ((10633429136 : Rat) / 1406622915) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((-5316714568 : Rat) / 1406622915) [(0, 2), (11, 1), (15, 1)],
  term ((10633429136 : Rat) / 1406622915) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((-5316714568 : Rat) / 1406622915) [(1, 2), (11, 1), (15, 1)],
  term ((-10633429136 : Rat) / 1406622915) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10633429136 : Rat) / 1406622915) [(11, 1), (13, 1), (15, 2)],
  term ((5316714568 : Rat) / 1406622915) [(11, 1), (14, 2), (15, 1)],
  term ((5316714568 : Rat) / 1406622915) [(11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0118
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0119 : Poly :=
[
  term ((-43955200 : Rat) / 110226591) [(11, 1), (15, 3)]
]

/-- Partial product 119 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0119 : Poly :=
[
  term ((87910400 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((-43955200 : Rat) / 110226591) [(0, 2), (11, 1), (15, 3)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-43955200 : Rat) / 110226591) [(1, 2), (11, 1), (15, 3)],
  term ((-87910400 : Rat) / 110226591) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-87910400 : Rat) / 110226591) [(11, 1), (13, 1), (15, 4)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (14, 2), (15, 3)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (15, 5)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0119
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0120 : Poly :=
[
  term ((1275152921912 : Rat) / 94243735305) [(11, 2)]
]

/-- Partial product 120 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0120 : Poly :=
[
  term ((-2550305843824 : Rat) / 94243735305) [(0, 1), (11, 2), (12, 1)],
  term ((1275152921912 : Rat) / 94243735305) [(0, 2), (11, 2)],
  term ((-2550305843824 : Rat) / 94243735305) [(1, 1), (11, 2), (13, 1)],
  term ((1275152921912 : Rat) / 94243735305) [(1, 2), (11, 2)],
  term ((2550305843824 : Rat) / 94243735305) [(11, 2), (12, 1), (14, 1)],
  term ((2550305843824 : Rat) / 94243735305) [(11, 2), (13, 1), (15, 1)],
  term ((-1275152921912 : Rat) / 94243735305) [(11, 2), (14, 2)],
  term ((-1275152921912 : Rat) / 94243735305) [(11, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0120
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0121 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(11, 2), (12, 1)]
]

/-- Partial product 121 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0121 : Poly :=
[
  term ((77987840 : Rat) / 110226591) [(0, 1), (11, 2), (12, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1)],
  term ((77987840 : Rat) / 110226591) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-38993920 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (14, 2)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (15, 2)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0121
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0122 : Poly :=
[
  term ((-62755840 : Rat) / 110226591) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 122 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0122 : Poly :=
[
  term ((125511680 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-62755840 : Rat) / 110226591) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((125511680 : Rat) / 110226591) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((-62755840 : Rat) / 110226591) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((-125511680 : Rat) / 110226591) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((62755840 : Rat) / 110226591) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((62755840 : Rat) / 110226591) [(11, 2), (13, 1), (15, 3)],
  term ((-125511680 : Rat) / 110226591) [(11, 2), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0122
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0123 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(11, 2), (14, 1)]
]

/-- Partial product 123 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0123 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(0, 2), (11, 2), (14, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(1, 2), (11, 2), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 2), (12, 1), (14, 2)],
  term ((194969600 : Rat) / 110226591) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (14, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0123
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0124 : Poly :=
[
  term ((74854400 : Rat) / 36742197) [(11, 2), (15, 2)]
]

/-- Partial product 124 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0124 : Poly :=
[
  term ((-149708800 : Rat) / 36742197) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((74854400 : Rat) / 36742197) [(0, 2), (11, 2), (15, 2)],
  term ((-149708800 : Rat) / 36742197) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((74854400 : Rat) / 36742197) [(1, 2), (11, 2), (15, 2)],
  term ((149708800 : Rat) / 36742197) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((149708800 : Rat) / 36742197) [(11, 2), (13, 1), (15, 3)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (14, 2), (15, 2)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0124
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0125 : Poly :=
[
  term ((-194969600 : Rat) / 110226591) [(11, 3), (15, 1)]
]

/-- Partial product 125 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0125 : Poly :=
[
  term ((389939200 : Rat) / 110226591) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(0, 2), (11, 3), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 2), (11, 3), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (14, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0125
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0126 : Poly :=
[
  term ((-31360 : Rat) / 182797) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 126 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0126 : Poly :=
[
  term ((62720 : Rat) / 182797) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-31360 : Rat) / 182797) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((62720 : Rat) / 182797) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-31360 : Rat) / 182797) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((31360 : Rat) / 182797) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((31360 : Rat) / 182797) [(12, 1), (13, 1), (15, 3)],
  term ((-62720 : Rat) / 182797) [(12, 1), (13, 2), (15, 2)],
  term ((-62720 : Rat) / 182797) [(12, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0126
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0127 : Poly :=
[
  term ((1809920 : Rat) / 4935519) [(12, 1), (15, 2)]
]

/-- Partial product 127 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0127 : Poly :=
[
  term ((-3619840 : Rat) / 4935519) [(0, 1), (12, 2), (15, 2)],
  term ((1809920 : Rat) / 4935519) [(0, 2), (12, 1), (15, 2)],
  term ((-3619840 : Rat) / 4935519) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((1809920 : Rat) / 4935519) [(1, 2), (12, 1), (15, 2)],
  term ((3619840 : Rat) / 4935519) [(12, 1), (13, 1), (15, 3)],
  term ((-1809920 : Rat) / 4935519) [(12, 1), (14, 2), (15, 2)],
  term ((-1809920 : Rat) / 4935519) [(12, 1), (15, 4)],
  term ((3619840 : Rat) / 4935519) [(12, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0127_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0127
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0128 : Poly :=
[
  term ((-256981760 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 128 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0128 : Poly :=
[
  term ((513963520 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-256981760 : Rat) / 330679773) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((513963520 : Rat) / 330679773) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-256981760 : Rat) / 330679773) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((-513963520 : Rat) / 330679773) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((256981760 : Rat) / 330679773) [(13, 1), (14, 1), (15, 3)],
  term ((256981760 : Rat) / 330679773) [(13, 1), (14, 3), (15, 1)],
  term ((-513963520 : Rat) / 330679773) [(13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0128_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0128
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0129 : Poly :=
[
  term ((2473948610 : Rat) / 330679773) [(13, 1), (15, 1)]
]

/-- Partial product 129 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0129 : Poly :=
[
  term ((-4947897220 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((2473948610 : Rat) / 330679773) [(0, 2), (13, 1), (15, 1)],
  term ((-4947897220 : Rat) / 330679773) [(1, 1), (13, 2), (15, 1)],
  term ((2473948610 : Rat) / 330679773) [(1, 2), (13, 1), (15, 1)],
  term ((4947897220 : Rat) / 330679773) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-2473948610 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)],
  term ((-2473948610 : Rat) / 330679773) [(13, 1), (15, 3)],
  term ((4947897220 : Rat) / 330679773) [(13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0129_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0129
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0130 : Poly :=
[
  term ((-22140160 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 130 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0130 : Poly :=
[
  term ((44280320 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)],
  term ((-22140160 : Rat) / 12247399) [(0, 2), (13, 2)],
  term ((44280320 : Rat) / 12247399) [(1, 1), (13, 3)],
  term ((-22140160 : Rat) / 12247399) [(1, 2), (13, 2)],
  term ((-44280320 : Rat) / 12247399) [(12, 1), (13, 2), (14, 1)],
  term ((22140160 : Rat) / 12247399) [(13, 2), (14, 2)],
  term ((22140160 : Rat) / 12247399) [(13, 2), (15, 2)],
  term ((-44280320 : Rat) / 12247399) [(13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0130_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0130
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0131 : Poly :=
[
  term ((31360 : Rat) / 182797) [(13, 2), (14, 1)]
]

/-- Partial product 131 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0131 : Poly :=
[
  term ((-62720 : Rat) / 182797) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((31360 : Rat) / 182797) [(0, 2), (13, 2), (14, 1)],
  term ((-62720 : Rat) / 182797) [(1, 1), (13, 3), (14, 1)],
  term ((31360 : Rat) / 182797) [(1, 2), (13, 2), (14, 1)],
  term ((62720 : Rat) / 182797) [(12, 1), (13, 2), (14, 2)],
  term ((-31360 : Rat) / 182797) [(13, 2), (14, 1), (15, 2)],
  term ((-31360 : Rat) / 182797) [(13, 2), (14, 3)],
  term ((62720 : Rat) / 182797) [(13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0131_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0131
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0132 : Poly :=
[
  term ((96701440 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 132 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0132 : Poly :=
[
  term ((-193402880 : Rat) / 110226591) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((96701440 : Rat) / 110226591) [(0, 2), (14, 1), (15, 2)],
  term ((-193402880 : Rat) / 110226591) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((96701440 : Rat) / 110226591) [(1, 2), (14, 1), (15, 2)],
  term ((193402880 : Rat) / 110226591) [(12, 1), (14, 2), (15, 2)],
  term ((193402880 : Rat) / 110226591) [(13, 1), (14, 1), (15, 3)],
  term ((-96701440 : Rat) / 110226591) [(14, 1), (15, 4)],
  term ((-96701440 : Rat) / 110226591) [(14, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0132_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0132
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 27. -/
def rs_R009_ueqv_R009NNNYN_coefficient_27_0133 : Poly :=
[
  term ((-2556839240 : Rat) / 330679773) [(15, 2)]
]

/-- Partial product 133 for generator 27. -/
def rs_R009_ueqv_R009NNNYN_partial_27_0133 : Poly :=
[
  term ((5113678480 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)],
  term ((-2556839240 : Rat) / 330679773) [(0, 2), (15, 2)],
  term ((5113678480 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((-2556839240 : Rat) / 330679773) [(1, 2), (15, 2)],
  term ((-5113678480 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((-5113678480 : Rat) / 330679773) [(13, 1), (15, 3)],
  term ((2556839240 : Rat) / 330679773) [(14, 2), (15, 2)],
  term ((2556839240 : Rat) / 330679773) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 27. -/
theorem rs_R009_ueqv_R009NNNYN_partial_27_0133_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_27_0133
        rs_R009_ueqv_R009NNNYN_generator_27_0100_0133 =
      rs_R009_ueqv_R009NNNYN_partial_27_0133 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_27_0100_0133 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_27_0100,
  rs_R009_ueqv_R009NNNYN_partial_27_0101,
  rs_R009_ueqv_R009NNNYN_partial_27_0102,
  rs_R009_ueqv_R009NNNYN_partial_27_0103,
  rs_R009_ueqv_R009NNNYN_partial_27_0104,
  rs_R009_ueqv_R009NNNYN_partial_27_0105,
  rs_R009_ueqv_R009NNNYN_partial_27_0106,
  rs_R009_ueqv_R009NNNYN_partial_27_0107,
  rs_R009_ueqv_R009NNNYN_partial_27_0108,
  rs_R009_ueqv_R009NNNYN_partial_27_0109,
  rs_R009_ueqv_R009NNNYN_partial_27_0110,
  rs_R009_ueqv_R009NNNYN_partial_27_0111,
  rs_R009_ueqv_R009NNNYN_partial_27_0112,
  rs_R009_ueqv_R009NNNYN_partial_27_0113,
  rs_R009_ueqv_R009NNNYN_partial_27_0114,
  rs_R009_ueqv_R009NNNYN_partial_27_0115,
  rs_R009_ueqv_R009NNNYN_partial_27_0116,
  rs_R009_ueqv_R009NNNYN_partial_27_0117,
  rs_R009_ueqv_R009NNNYN_partial_27_0118,
  rs_R009_ueqv_R009NNNYN_partial_27_0119,
  rs_R009_ueqv_R009NNNYN_partial_27_0120,
  rs_R009_ueqv_R009NNNYN_partial_27_0121,
  rs_R009_ueqv_R009NNNYN_partial_27_0122,
  rs_R009_ueqv_R009NNNYN_partial_27_0123,
  rs_R009_ueqv_R009NNNYN_partial_27_0124,
  rs_R009_ueqv_R009NNNYN_partial_27_0125,
  rs_R009_ueqv_R009NNNYN_partial_27_0126,
  rs_R009_ueqv_R009NNNYN_partial_27_0127,
  rs_R009_ueqv_R009NNNYN_partial_27_0128,
  rs_R009_ueqv_R009NNNYN_partial_27_0129,
  rs_R009_ueqv_R009NNNYN_partial_27_0130,
  rs_R009_ueqv_R009NNNYN_partial_27_0131,
  rs_R009_ueqv_R009NNNYN_partial_27_0132,
  rs_R009_ueqv_R009NNNYN_partial_27_0133
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_27_0100_0133 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(0, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((21362609744 : Rat) / 330679773) [(0, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2668103647468 : Rat) / 94243735305) [(0, 1), (9, 1), (12, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(0, 1), (9, 1), (12, 1), (15, 3)],
  term ((732 : Rat) / 67) [(0, 1), (9, 2), (12, 1)],
  term ((113004316796 : Rat) / 3490508715) [(0, 1), (10, 1), (11, 1), (12, 1), (13, 1)],
  term ((-6488623624912 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 1), (12, 1), (15, 1)],
  term ((7232276274944 : Rat) / 94243735305) [(0, 1), (10, 1), (11, 2), (12, 1)],
  term ((-240 : Rat) / 67) [(0, 1), (10, 1), (12, 1)],
  term ((1827840 : Rat) / 12247399) [(0, 1), (10, 1), (12, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(0, 1), (10, 1), (12, 1), (15, 2)],
  term ((-136885937069 : Rat) / 31414578435) [(0, 1), (11, 1), (12, 1), (13, 1)],
  term ((-515701760 : Rat) / 330679773) [(0, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((-5962240 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (13, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((390287360 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((10633429136 : Rat) / 1406622915) [(0, 1), (11, 1), (12, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(0, 1), (11, 1), (12, 1), (15, 3)],
  term ((3655680 : Rat) / 12247399) [(0, 1), (11, 1), (12, 2), (13, 1)],
  term ((57958400 : Rat) / 330679773) [(0, 1), (11, 1), (12, 2), (15, 1)],
  term ((-2550305843824 : Rat) / 94243735305) [(0, 1), (11, 2), (12, 1)],
  term ((125511680 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (13, 1), (15, 1)],
  term ((-194969600 : Rat) / 110226591) [(0, 1), (11, 2), (12, 1), (14, 1)],
  term ((-149708800 : Rat) / 36742197) [(0, 1), (11, 2), (12, 1), (15, 2)],
  term ((77987840 : Rat) / 110226591) [(0, 1), (11, 2), (12, 2)],
  term ((389939200 : Rat) / 110226591) [(0, 1), (11, 3), (12, 1), (15, 1)],
  term ((513963520 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-4947897220 : Rat) / 330679773) [(0, 1), (12, 1), (13, 1), (15, 1)],
  term ((44280320 : Rat) / 12247399) [(0, 1), (12, 1), (13, 2)],
  term ((-62720 : Rat) / 182797) [(0, 1), (12, 1), (13, 2), (14, 1)],
  term ((-193402880 : Rat) / 110226591) [(0, 1), (12, 1), (14, 1), (15, 2)],
  term ((5113678480 : Rat) / 330679773) [(0, 1), (12, 1), (15, 2)],
  term ((62720 : Rat) / 182797) [(0, 1), (12, 2), (13, 1), (15, 1)],
  term ((-3619840 : Rat) / 4935519) [(0, 1), (12, 2), (15, 2)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (9, 1), (13, 2), (15, 1)],
  term ((-10681304872 : Rat) / 330679773) [(0, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1334051823734 : Rat) / 94243735305) [(0, 2), (9, 1), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(0, 2), (9, 1), (15, 3)],
  term ((-366 : Rat) / 67) [(0, 2), (9, 2)],
  term ((120 : Rat) / 67) [(0, 2), (10, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(0, 2), (10, 1), (11, 1), (13, 1)],
  term ((3244311812456 : Rat) / 94243735305) [(0, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(0, 2), (10, 1), (11, 2)],
  term ((-913920 : Rat) / 12247399) [(0, 2), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(0, 2), (10, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(0, 2), (11, 1), (12, 1), (13, 1)],
  term ((-28979200 : Rat) / 330679773) [(0, 2), (11, 1), (12, 1), (15, 1)],
  term ((136885937069 : Rat) / 62829156870) [(0, 2), (11, 1), (13, 1)],
  term ((257850880 : Rat) / 330679773) [(0, 2), (11, 1), (13, 1), (14, 1)],
  term ((2981120 : Rat) / 110226591) [(0, 2), (11, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(0, 2), (11, 1), (13, 2), (15, 1)],
  term ((-195143680 : Rat) / 110226591) [(0, 2), (11, 1), (14, 1), (15, 1)],
  term ((-5316714568 : Rat) / 1406622915) [(0, 2), (11, 1), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(0, 2), (11, 1), (15, 3)],
  term ((1275152921912 : Rat) / 94243735305) [(0, 2), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(0, 2), (11, 2), (12, 1)],
  term ((-62755840 : Rat) / 110226591) [(0, 2), (11, 2), (13, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(0, 2), (11, 2), (14, 1)],
  term ((74854400 : Rat) / 36742197) [(0, 2), (11, 2), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(0, 2), (11, 3), (15, 1)],
  term ((-31360 : Rat) / 182797) [(0, 2), (12, 1), (13, 1), (15, 1)],
  term ((1809920 : Rat) / 4935519) [(0, 2), (12, 1), (15, 2)],
  term ((-256981760 : Rat) / 330679773) [(0, 2), (13, 1), (14, 1), (15, 1)],
  term ((2473948610 : Rat) / 330679773) [(0, 2), (13, 1), (15, 1)],
  term ((-22140160 : Rat) / 12247399) [(0, 2), (13, 2)],
  term ((31360 : Rat) / 182797) [(0, 2), (13, 2), (14, 1)],
  term ((96701440 : Rat) / 110226591) [(0, 2), (14, 1), (15, 2)],
  term ((-2556839240 : Rat) / 330679773) [(0, 2), (15, 2)],
  term ((21362609744 : Rat) / 330679773) [(1, 1), (9, 1), (13, 1), (14, 1), (15, 1)],
  term ((2668103647468 : Rat) / 94243735305) [(1, 1), (9, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 1), (9, 1), (13, 1), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (9, 1), (13, 3), (15, 1)],
  term ((732 : Rat) / 67) [(1, 1), (9, 2), (13, 1)],
  term ((-6488623624912 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 1), (13, 1), (15, 1)],
  term ((113004316796 : Rat) / 3490508715) [(1, 1), (10, 1), (11, 1), (13, 2)],
  term ((7232276274944 : Rat) / 94243735305) [(1, 1), (10, 1), (11, 2), (13, 1)],
  term ((-240 : Rat) / 67) [(1, 1), (10, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(1, 1), (10, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(1, 1), (10, 1), (13, 2), (15, 1)],
  term ((57958400 : Rat) / 330679773) [(1, 1), (11, 1), (12, 1), (13, 1), (15, 1)],
  term ((3655680 : Rat) / 12247399) [(1, 1), (11, 1), (12, 1), (13, 2)],
  term ((390287360 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (14, 1), (15, 1)],
  term ((10633429136 : Rat) / 1406622915) [(1, 1), (11, 1), (13, 1), (15, 1)],
  term ((87910400 : Rat) / 110226591) [(1, 1), (11, 1), (13, 1), (15, 3)],
  term ((-136885937069 : Rat) / 31414578435) [(1, 1), (11, 1), (13, 2)],
  term ((-515701760 : Rat) / 330679773) [(1, 1), (11, 1), (13, 2), (14, 1)],
  term ((-5962240 : Rat) / 110226591) [(1, 1), (11, 1), (13, 2), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 1), (11, 1), (13, 3), (15, 1)],
  term ((77987840 : Rat) / 110226591) [(1, 1), (11, 2), (12, 1), (13, 1)],
  term ((-2550305843824 : Rat) / 94243735305) [(1, 1), (11, 2), (13, 1)],
  term ((-194969600 : Rat) / 110226591) [(1, 1), (11, 2), (13, 1), (14, 1)],
  term ((-149708800 : Rat) / 36742197) [(1, 1), (11, 2), (13, 1), (15, 2)],
  term ((125511680 : Rat) / 110226591) [(1, 1), (11, 2), (13, 2), (15, 1)],
  term ((389939200 : Rat) / 110226591) [(1, 1), (11, 3), (13, 1), (15, 1)],
  term ((-3619840 : Rat) / 4935519) [(1, 1), (12, 1), (13, 1), (15, 2)],
  term ((62720 : Rat) / 182797) [(1, 1), (12, 1), (13, 2), (15, 1)],
  term ((-193402880 : Rat) / 110226591) [(1, 1), (13, 1), (14, 1), (15, 2)],
  term ((5113678480 : Rat) / 330679773) [(1, 1), (13, 1), (15, 2)],
  term ((513963520 : Rat) / 330679773) [(1, 1), (13, 2), (14, 1), (15, 1)],
  term ((-4947897220 : Rat) / 330679773) [(1, 1), (13, 2), (15, 1)],
  term ((44280320 : Rat) / 12247399) [(1, 1), (13, 3)],
  term ((-62720 : Rat) / 182797) [(1, 1), (13, 3), (14, 1)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (9, 1), (13, 2), (15, 1)],
  term ((-10681304872 : Rat) / 330679773) [(1, 2), (9, 1), (14, 1), (15, 1)],
  term ((-1334051823734 : Rat) / 94243735305) [(1, 2), (9, 1), (15, 1)],
  term ((-8791040 : Rat) / 110226591) [(1, 2), (9, 1), (15, 3)],
  term ((-366 : Rat) / 67) [(1, 2), (9, 2)],
  term ((120 : Rat) / 67) [(1, 2), (10, 1)],
  term ((-56502158398 : Rat) / 3490508715) [(1, 2), (10, 1), (11, 1), (13, 1)],
  term ((3244311812456 : Rat) / 94243735305) [(1, 2), (10, 1), (11, 1), (15, 1)],
  term ((-3616138137472 : Rat) / 94243735305) [(1, 2), (10, 1), (11, 2)],
  term ((-913920 : Rat) / 12247399) [(1, 2), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(1, 2), (10, 1), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(1, 2), (11, 1), (12, 1), (13, 1)],
  term ((-28979200 : Rat) / 330679773) [(1, 2), (11, 1), (12, 1), (15, 1)],
  term ((136885937069 : Rat) / 62829156870) [(1, 2), (11, 1), (13, 1)],
  term ((257850880 : Rat) / 330679773) [(1, 2), (11, 1), (13, 1), (14, 1)],
  term ((2981120 : Rat) / 110226591) [(1, 2), (11, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(1, 2), (11, 1), (13, 2), (15, 1)],
  term ((-195143680 : Rat) / 110226591) [(1, 2), (11, 1), (14, 1), (15, 1)],
  term ((-5316714568 : Rat) / 1406622915) [(1, 2), (11, 1), (15, 1)],
  term ((-43955200 : Rat) / 110226591) [(1, 2), (11, 1), (15, 3)],
  term ((1275152921912 : Rat) / 94243735305) [(1, 2), (11, 2)],
  term ((-38993920 : Rat) / 110226591) [(1, 2), (11, 2), (12, 1)],
  term ((-62755840 : Rat) / 110226591) [(1, 2), (11, 2), (13, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(1, 2), (11, 2), (14, 1)],
  term ((74854400 : Rat) / 36742197) [(1, 2), (11, 2), (15, 2)],
  term ((-194969600 : Rat) / 110226591) [(1, 2), (11, 3), (15, 1)],
  term ((-31360 : Rat) / 182797) [(1, 2), (12, 1), (13, 1), (15, 1)],
  term ((1809920 : Rat) / 4935519) [(1, 2), (12, 1), (15, 2)],
  term ((-256981760 : Rat) / 330679773) [(1, 2), (13, 1), (14, 1), (15, 1)],
  term ((2473948610 : Rat) / 330679773) [(1, 2), (13, 1), (15, 1)],
  term ((-22140160 : Rat) / 12247399) [(1, 2), (13, 2)],
  term ((31360 : Rat) / 182797) [(1, 2), (13, 2), (14, 1)],
  term ((96701440 : Rat) / 110226591) [(1, 2), (14, 1), (15, 2)],
  term ((-2556839240 : Rat) / 330679773) [(1, 2), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-2668103647468 : Rat) / 94243735305) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (12, 1), (14, 1), (15, 3)],
  term ((-21362609744 : Rat) / 330679773) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-21362609744 : Rat) / 330679773) [(9, 1), (13, 1), (14, 1), (15, 2)],
  term ((-2668103647468 : Rat) / 94243735305) [(9, 1), (13, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(9, 1), (13, 1), (15, 4)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(9, 1), (13, 2), (15, 3)],
  term ((-1827840 : Rat) / 12247399) [(9, 1), (13, 3), (15, 2)],
  term ((10681304872 : Rat) / 330679773) [(9, 1), (14, 1), (15, 3)],
  term ((1334051823734 : Rat) / 94243735305) [(9, 1), (14, 2), (15, 1)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (14, 2), (15, 3)],
  term ((10681304872 : Rat) / 330679773) [(9, 1), (14, 3), (15, 1)],
  term ((1334051823734 : Rat) / 94243735305) [(9, 1), (15, 3)],
  term ((8791040 : Rat) / 110226591) [(9, 1), (15, 5)],
  term ((-732 : Rat) / 67) [(9, 2), (12, 1), (14, 1)],
  term ((-732 : Rat) / 67) [(9, 2), (13, 1), (15, 1)],
  term ((366 : Rat) / 67) [(9, 2), (14, 2)],
  term ((366 : Rat) / 67) [(9, 2), (15, 2)],
  term ((-113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (12, 1), (13, 1), (14, 1)],
  term ((6488623624912 : Rat) / 94243735305) [(10, 1), (11, 1), (12, 1), (14, 1), (15, 1)],
  term ((56502158398 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 1), (14, 2)],
  term ((8014181901658 : Rat) / 94243735305) [(10, 1), (11, 1), (13, 1), (15, 2)],
  term ((-113004316796 : Rat) / 3490508715) [(10, 1), (11, 1), (13, 2), (15, 1)],
  term ((-3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (14, 2), (15, 1)],
  term ((-3244311812456 : Rat) / 94243735305) [(10, 1), (11, 1), (15, 3)],
  term ((-7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (12, 1), (14, 1)],
  term ((-7232276274944 : Rat) / 94243735305) [(10, 1), (11, 2), (13, 1), (15, 1)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (14, 2)],
  term ((3616138137472 : Rat) / 94243735305) [(10, 1), (11, 2), (15, 2)],
  term ((-1827840 : Rat) / 12247399) [(10, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((240 : Rat) / 67) [(10, 1), (12, 1), (14, 1)],
  term ((35164160 : Rat) / 110226591) [(10, 1), (12, 1), (14, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 1), (14, 2), (15, 1)],
  term ((240 : Rat) / 67) [(10, 1), (13, 1), (15, 1)],
  term ((43389440 : Rat) / 110226591) [(10, 1), (13, 1), (15, 3)],
  term ((-1827840 : Rat) / 12247399) [(10, 1), (13, 2), (15, 2)],
  term ((-120 : Rat) / 67) [(10, 1), (14, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (14, 2), (15, 2)],
  term ((-120 : Rat) / 67) [(10, 1), (15, 2)],
  term ((-17582080 : Rat) / 110226591) [(10, 1), (15, 4)],
  term ((136885937069 : Rat) / 31414578435) [(11, 1), (12, 1), (13, 1), (14, 1)],
  term ((5962240 : Rat) / 110226591) [(11, 1), (12, 1), (13, 1), (14, 1), (15, 2)],
  term ((565053440 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (14, 2)],
  term ((-8606720 : Rat) / 330679773) [(11, 1), (12, 1), (13, 1), (15, 2)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-10633429136 : Rat) / 1406622915) [(11, 1), (12, 1), (14, 1), (15, 1)],
  term ((-87910400 : Rat) / 110226591) [(11, 1), (12, 1), (14, 1), (15, 3)],
  term ((-21544960 : Rat) / 6239241) [(11, 1), (12, 1), (14, 2), (15, 1)],
  term ((28979200 : Rat) / 330679773) [(11, 1), (12, 1), (15, 3)],
  term ((-3655680 : Rat) / 12247399) [(11, 1), (12, 2), (13, 1), (14, 1)],
  term ((-57958400 : Rat) / 330679773) [(11, 1), (12, 2), (14, 1), (15, 1)],
  term ((-1428712960 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1), (15, 2)],
  term ((-136885937069 : Rat) / 62829156870) [(11, 1), (13, 1), (14, 2)],
  term ((-2981120 : Rat) / 110226591) [(11, 1), (13, 1), (14, 2), (15, 2)],
  term ((-257850880 : Rat) / 330679773) [(11, 1), (13, 1), (14, 3)],
  term ((-1835537315431 : Rat) / 188487470610) [(11, 1), (13, 1), (15, 2)],
  term ((-90891520 : Rat) / 110226591) [(11, 1), (13, 1), (15, 4)],
  term ((515701760 : Rat) / 330679773) [(11, 1), (13, 2), (14, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(11, 1), (13, 2), (14, 2), (15, 1)],
  term ((136885937069 : Rat) / 31414578435) [(11, 1), (13, 2), (15, 1)],
  term ((-2263040 : Rat) / 110226591) [(11, 1), (13, 2), (15, 3)],
  term ((1827840 : Rat) / 12247399) [(11, 1), (13, 3), (15, 2)],
  term ((195143680 : Rat) / 110226591) [(11, 1), (14, 1), (15, 3)],
  term ((5316714568 : Rat) / 1406622915) [(11, 1), (14, 2), (15, 1)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (14, 2), (15, 3)],
  term ((195143680 : Rat) / 110226591) [(11, 1), (14, 3), (15, 1)],
  term ((5316714568 : Rat) / 1406622915) [(11, 1), (15, 3)],
  term ((43955200 : Rat) / 110226591) [(11, 1), (15, 5)],
  term ((-125511680 : Rat) / 110226591) [(11, 2), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 1), (13, 1), (15, 1)],
  term ((2550305843824 : Rat) / 94243735305) [(11, 2), (12, 1), (14, 1)],
  term ((149708800 : Rat) / 36742197) [(11, 2), (12, 1), (14, 1), (15, 2)],
  term ((77987840 : Rat) / 36742197) [(11, 2), (12, 1), (14, 2)],
  term ((38993920 : Rat) / 110226591) [(11, 2), (12, 1), (15, 2)],
  term ((-77987840 : Rat) / 110226591) [(11, 2), (12, 2), (14, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 2), (13, 1), (14, 1), (15, 1)],
  term ((62755840 : Rat) / 110226591) [(11, 2), (13, 1), (14, 2), (15, 1)],
  term ((2550305843824 : Rat) / 94243735305) [(11, 2), (13, 1), (15, 1)],
  term ((511882240 : Rat) / 110226591) [(11, 2), (13, 1), (15, 3)],
  term ((-125511680 : Rat) / 110226591) [(11, 2), (13, 2), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (14, 1), (15, 2)],
  term ((-1275152921912 : Rat) / 94243735305) [(11, 2), (14, 2)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (14, 2), (15, 2)],
  term ((-97484800 : Rat) / 110226591) [(11, 2), (14, 3)],
  term ((-1275152921912 : Rat) / 94243735305) [(11, 2), (15, 2)],
  term ((-74854400 : Rat) / 36742197) [(11, 2), (15, 4)],
  term ((-389939200 : Rat) / 110226591) [(11, 3), (12, 1), (14, 1), (15, 1)],
  term ((-389939200 : Rat) / 110226591) [(11, 3), (13, 1), (15, 2)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (14, 2), (15, 1)],
  term ((194969600 : Rat) / 110226591) [(11, 3), (15, 3)],
  term ((4947897220 : Rat) / 330679773) [(12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-457233280 : Rat) / 330679773) [(12, 1), (13, 1), (14, 2), (15, 1)],
  term ((4466560 : Rat) / 4935519) [(12, 1), (13, 1), (15, 3)],
  term ((-44280320 : Rat) / 12247399) [(12, 1), (13, 2), (14, 1)],
  term ((62720 : Rat) / 182797) [(12, 1), (13, 2), (14, 2)],
  term ((-62720 : Rat) / 182797) [(12, 1), (13, 2), (15, 2)],
  term ((-5113678480 : Rat) / 330679773) [(12, 1), (14, 1), (15, 2)],
  term ((458944000 : Rat) / 330679773) [(12, 1), (14, 2), (15, 2)],
  term ((-1809920 : Rat) / 4935519) [(12, 1), (15, 4)],
  term ((-62720 : Rat) / 182797) [(12, 2), (13, 1), (14, 1), (15, 1)],
  term ((3619840 : Rat) / 4935519) [(12, 2), (14, 1), (15, 2)],
  term ((837190400 : Rat) / 330679773) [(13, 1), (14, 1), (15, 3)],
  term ((-2473948610 : Rat) / 330679773) [(13, 1), (14, 2), (15, 1)],
  term ((256981760 : Rat) / 330679773) [(13, 1), (14, 3), (15, 1)],
  term ((-2529209030 : Rat) / 110226591) [(13, 1), (15, 3)],
  term ((-570693760 : Rat) / 330679773) [(13, 2), (14, 1), (15, 2)],
  term ((22140160 : Rat) / 12247399) [(13, 2), (14, 2)],
  term ((-31360 : Rat) / 182797) [(13, 2), (14, 3)],
  term ((5545681540 : Rat) / 330679773) [(13, 2), (15, 2)],
  term ((62720 : Rat) / 182797) [(13, 3), (14, 1), (15, 1)],
  term ((-44280320 : Rat) / 12247399) [(13, 3), (15, 1)],
  term ((-96701440 : Rat) / 110226591) [(14, 1), (15, 4)],
  term ((2556839240 : Rat) / 330679773) [(14, 2), (15, 2)],
  term ((-96701440 : Rat) / 110226591) [(14, 3), (15, 2)],
  term ((2556839240 : Rat) / 330679773) [(15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 27, terms 100 through 133. -/
theorem rs_R009_ueqv_R009NNNYN_block_27_0100_0133_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_27_0100_0133
      rs_R009_ueqv_R009NNNYN_block_27_0100_0133 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
