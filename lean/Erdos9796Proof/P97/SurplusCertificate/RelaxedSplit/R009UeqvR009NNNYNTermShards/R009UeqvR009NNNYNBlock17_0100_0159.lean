/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009NNNYN, term block 17:100-159

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009NNNYNTermShards

/-- Generator polynomial 17 for relaxed split surplus certificate `R009:u=v:R009NNNYN`. -/
def rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 : Poly :=
[
  term (2 : Rat) [(2, 1), (6, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (7, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0100 : Poly :=
[
  term ((10744000 : Rat) / 110226591) [(7, 1), (13, 1), (15, 2)]
]

/-- Partial product 100 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0100 : Poly :=
[
  term ((21488000 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((-10744000 : Rat) / 110226591) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((21488000 : Rat) / 110226591) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((-10744000 : Rat) / 110226591) [(3, 2), (7, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0100_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0100
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0101 : Poly :=
[
  term ((456960 : Rat) / 12247399) [(7, 1), (13, 2), (15, 1)]
]

/-- Partial product 101 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0101 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((913920 : Rat) / 12247399) [(3, 1), (7, 2), (13, 2), (15, 1)],
  term ((-456960 : Rat) / 12247399) [(3, 2), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0101_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0101
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0102 : Poly :=
[
  term ((4915619612 : Rat) / 330679773) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 102 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0102 : Poly :=
[
  term ((9831239224 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-4915619612 : Rat) / 330679773) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((9831239224 : Rat) / 330679773) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-4915619612 : Rat) / 330679773) [(3, 2), (7, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0102_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0102
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0103 : Poly :=
[
  term ((-42785405530739 : Rat) / 942437353050) [(7, 1), (15, 1)]
]

/-- Partial product 103 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0103 : Poly :=
[
  term ((-42785405530739 : Rat) / 471218676525) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((42785405530739 : Rat) / 942437353050) [(2, 2), (7, 1), (15, 1)],
  term ((-42785405530739 : Rat) / 471218676525) [(3, 1), (7, 2), (15, 1)],
  term ((42785405530739 : Rat) / 942437353050) [(3, 2), (7, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0103_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0103
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0104 : Poly :=
[
  term ((-41757440 : Rat) / 110226591) [(7, 1), (15, 3)]
]

/-- Partial product 104 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0104 : Poly :=
[
  term ((-83514880 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (15, 3)],
  term ((41757440 : Rat) / 110226591) [(2, 2), (7, 1), (15, 3)],
  term ((-83514880 : Rat) / 110226591) [(3, 1), (7, 2), (15, 3)],
  term ((41757440 : Rat) / 110226591) [(3, 2), (7, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0104_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0104
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0105 : Poly :=
[
  term ((969506497792 : Rat) / 31414578435) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 105 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0105 : Poly :=
[
  term ((1939012995584 : Rat) / 31414578435) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((-969506497792 : Rat) / 31414578435) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((1939012995584 : Rat) / 31414578435) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((-969506497792 : Rat) / 31414578435) [(3, 2), (9, 1), (10, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0105_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0105
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0106 : Poly :=
[
  term ((15148539028 : Rat) / 1163502905) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 106 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0106 : Poly :=
[
  term ((30297078056 : Rat) / 1163502905) [(2, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-15148539028 : Rat) / 1163502905) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((30297078056 : Rat) / 1163502905) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-15148539028 : Rat) / 1163502905) [(3, 2), (9, 1), (10, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0106_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0106
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0107 : Poly :=
[
  term ((-874287109616 : Rat) / 31414578435) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 107 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0107 : Poly :=
[
  term ((-1748574219232 : Rat) / 31414578435) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((874287109616 : Rat) / 31414578435) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-1748574219232 : Rat) / 31414578435) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((874287109616 : Rat) / 31414578435) [(3, 2), (9, 1), (10, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0107_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0107
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0108 : Poly :=
[
  term ((177013029178 : Rat) / 6282915687) [(9, 1), (11, 1)]
]

/-- Partial product 108 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0108 : Poly :=
[
  term ((354026058356 : Rat) / 6282915687) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-177013029178 : Rat) / 6282915687) [(2, 2), (9, 1), (11, 1)],
  term ((354026058356 : Rat) / 6282915687) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-177013029178 : Rat) / 6282915687) [(3, 2), (9, 1), (11, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0108_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0108
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0109 : Poly :=
[
  term ((-6495405952 : Rat) / 330679773) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 109 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0109 : Poly :=
[
  term ((-12990811904 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((6495405952 : Rat) / 330679773) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-12990811904 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((6495405952 : Rat) / 330679773) [(3, 2), (9, 1), (11, 1), (12, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0109_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0109
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0110 : Poly :=
[
  term ((69762560 : Rat) / 110226591) [(9, 1), (11, 1), (13, 1), (15, 1)]
]

/-- Partial product 110 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0110 : Poly :=
[
  term ((139525120 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-69762560 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((139525120 : Rat) / 110226591) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-69762560 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0110_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0110
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0111 : Poly :=
[
  term ((-18593482880 : Rat) / 330679773) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 111 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0111 : Poly :=
[
  term ((-37186965760 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((18593482880 : Rat) / 330679773) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((-37186965760 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((18593482880 : Rat) / 330679773) [(3, 2), (9, 1), (11, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0111_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0111
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0112 : Poly :=
[
  term ((-103342925728 : Rat) / 24800982975) [(9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 112 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0112 : Poly :=
[
  term ((-206685851456 : Rat) / 24800982975) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((103342925728 : Rat) / 24800982975) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0112_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0112
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0113 : Poly :=
[
  term ((68761600 : Rat) / 110226591) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 113 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0113 : Poly :=
[
  term ((137523200 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((-68761600 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((137523200 : Rat) / 110226591) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((-68761600 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0113_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0113
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0114 : Poly :=
[
  term ((2320 : Rat) / 201) [(9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 114 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0114 : Poly :=
[
  term ((4640 : Rat) / 201) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((4640 : Rat) / 201) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-2320 : Rat) / 201) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0114_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0114
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0115 : Poly :=
[
  term ((202546857628 : Rat) / 24800982975) [(9, 1), (11, 1), (16, 1)]
]

/-- Partial product 115 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0115 : Poly :=
[
  term ((405093715256 : Rat) / 24800982975) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(3, 2), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0115_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0115
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0116 : Poly :=
[
  term ((-19496960 : Rat) / 110226591) [(9, 1), (11, 2), (15, 1)]
]

/-- Partial product 116 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0116 : Poly :=
[
  term ((-38993920 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((-38993920 : Rat) / 110226591) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((19496960 : Rat) / 110226591) [(3, 2), (9, 1), (11, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0116_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0116
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0117 : Poly :=
[
  term ((-101490718 : Rat) / 12247399) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 117 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0117 : Poly :=
[
  term ((-202981436 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((101490718 : Rat) / 12247399) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-202981436 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((101490718 : Rat) / 12247399) [(3, 2), (9, 1), (12, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0117_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0117
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0118 : Poly :=
[
  term ((6123982322 : Rat) / 330679773) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 118 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0118 : Poly :=
[
  term ((12247964644 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-6123982322 : Rat) / 330679773) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((12247964644 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-6123982322 : Rat) / 330679773) [(3, 2), (9, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0118_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0118
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0119 : Poly :=
[
  term ((-63 : Rat) / 67) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0119 : Poly :=
[
  term ((-126 : Rat) / 67) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-126 : Rat) / 67) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((63 : Rat) / 67) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0119_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0119
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0120 : Poly :=
[
  term ((11958082789 : Rat) / 930802324) [(9, 1), (13, 1)]
]

/-- Partial product 120 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0120 : Poly :=
[
  term ((11958082789 : Rat) / 465401162) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-11958082789 : Rat) / 930802324) [(2, 2), (9, 1), (13, 1)],
  term ((11958082789 : Rat) / 465401162) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-11958082789 : Rat) / 930802324) [(3, 2), (9, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0120_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0120
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0121 : Poly :=
[
  term ((-290523170 : Rat) / 12247399) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 121 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0121 : Poly :=
[
  term ((-581046340 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((290523170 : Rat) / 12247399) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((-581046340 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((290523170 : Rat) / 12247399) [(3, 2), (9, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0121_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0121
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0122 : Poly :=
[
  term ((-3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 122 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0122 : Poly :=
[
  term ((-3229466429 : Rat) / 918554925) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3229466429 : Rat) / 918554925) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((3229466429 : Rat) / 1837109850) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0122_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0122
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0123 : Poly :=
[
  term ((-48736960 : Rat) / 110226591) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 123 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0123 : Poly :=
[
  term ((-97473920 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((48736960 : Rat) / 110226591) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((-97473920 : Rat) / 110226591) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((48736960 : Rat) / 110226591) [(3, 2), (9, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0123_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0123
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0124 : Poly :=
[
  term ((3229466429 : Rat) / 1837109850) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 124 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0124 : Poly :=
[
  term ((3229466429 : Rat) / 918554925) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((3229466429 : Rat) / 918554925) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((-3229466429 : Rat) / 1837109850) [(3, 2), (9, 1), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0124_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0124
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0125 : Poly :=
[
  term ((3655680 : Rat) / 12247399) [(9, 1), (13, 2), (15, 1)]
]

/-- Partial product 125 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0125 : Poly :=
[
  term ((7311360 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((7311360 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((-3655680 : Rat) / 12247399) [(3, 2), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0125_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0125
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0126 : Poly :=
[
  term ((16767337240 : Rat) / 330679773) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 126 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0126 : Poly :=
[
  term ((33534674480 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((-16767337240 : Rat) / 330679773) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((33534674480 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((-16767337240 : Rat) / 330679773) [(3, 2), (9, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0126_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0126
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0127 : Poly :=
[
  term ((20641044794 : Rat) / 24800982975) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 127 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0127 : Poly :=
[
  term ((41282089588 : Rat) / 24800982975) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((41282089588 : Rat) / 24800982975) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0127_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0127
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0128 : Poly :=
[
  term ((-326995417045 : Rat) / 12565831374) [(9, 1), (15, 1)]
]

/-- Partial product 128 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0128 : Poly :=
[
  term ((-326995417045 : Rat) / 6282915687) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((326995417045 : Rat) / 12565831374) [(2, 2), (9, 1), (15, 1)],
  term ((-326995417045 : Rat) / 6282915687) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((326995417045 : Rat) / 12565831374) [(3, 2), (9, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0128_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0128
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0129 : Poly :=
[
  term ((30318188881 : Rat) / 24800982975) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 129 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0129 : Poly :=
[
  term ((60636377762 : Rat) / 24800982975) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((60636377762 : Rat) / 24800982975) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(3, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0129_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0129
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0130 : Poly :=
[
  term ((-15384320 : Rat) / 36742197) [(9, 1), (15, 3)]
]

/-- Partial product 130 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0130 : Poly :=
[
  term ((-30768640 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (15, 3)],
  term ((15384320 : Rat) / 36742197) [(2, 2), (9, 1), (15, 3)],
  term ((-30768640 : Rat) / 36742197) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((15384320 : Rat) / 36742197) [(3, 2), (9, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0130_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0130
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0131 : Poly :=
[
  term ((552 : Rat) / 67) [(9, 2)]
]

/-- Partial product 131 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0131 : Poly :=
[
  term ((1104 : Rat) / 67) [(2, 1), (6, 1), (9, 2)],
  term ((-552 : Rat) / 67) [(2, 2), (9, 2)],
  term ((1104 : Rat) / 67) [(3, 1), (7, 1), (9, 2)],
  term ((-552 : Rat) / 67) [(3, 2), (9, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0131_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0131
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0132 : Poly :=
[
  term ((-22051204672 : Rat) / 18848747061) [(9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0132 : Poly :=
[
  term ((-44102409344 : Rat) / 18848747061) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-44102409344 : Rat) / 18848747061) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((22051204672 : Rat) / 18848747061) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0132_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0132
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0133 : Poly :=
[
  term ((-344550073 : Rat) / 698101743) [(9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 133 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0133 : Poly :=
[
  term ((-689100146 : Rat) / 698101743) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0133_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0133
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0134 : Poly :=
[
  term ((38452883834 : Rat) / 18848747061) [(9, 2), (15, 2), (16, 1)]
]

/-- Partial product 134 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0134 : Poly :=
[
  term ((76905767668 : Rat) / 18848747061) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(3, 2), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0134_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0134
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0135 : Poly :=
[
  term ((19496960 : Rat) / 110226591) [(10, 1), (11, 1), (13, 1)]
]

/-- Partial product 135 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0135 : Poly :=
[
  term ((38993920 : Rat) / 110226591) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-19496960 : Rat) / 110226591) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((38993920 : Rat) / 110226591) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-19496960 : Rat) / 110226591) [(3, 2), (10, 1), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0135_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0135
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0136 : Poly :=
[
  term ((-17582080 : Rat) / 110226591) [(10, 1), (13, 1), (15, 1)]
]

/-- Partial product 136 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0136 : Poly :=
[
  term ((-35164160 : Rat) / 110226591) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((-35164160 : Rat) / 110226591) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((17582080 : Rat) / 110226591) [(3, 2), (10, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0136_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0136
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0137 : Poly :=
[
  term ((913920 : Rat) / 12247399) [(10, 1), (13, 2)]
]

/-- Partial product 137 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0137 : Poly :=
[
  term ((1827840 : Rat) / 12247399) [(2, 1), (6, 1), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(2, 2), (10, 1), (13, 2)],
  term ((1827840 : Rat) / 12247399) [(3, 1), (7, 1), (10, 1), (13, 2)],
  term ((-913920 : Rat) / 12247399) [(3, 2), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0137_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0137
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0138 : Poly :=
[
  term ((306584320 : Rat) / 330679773) [(11, 1), (12, 1), (15, 1)]
]

/-- Partial product 138 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0138 : Poly :=
[
  term ((613168640 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-306584320 : Rat) / 330679773) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((613168640 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-306584320 : Rat) / 330679773) [(3, 2), (11, 1), (12, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0138_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0138
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0139 : Poly :=
[
  term ((-650225359648 : Rat) / 31414578435) [(11, 1), (13, 1)]
]

/-- Partial product 139 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0139 : Poly :=
[
  term ((-1300450719296 : Rat) / 31414578435) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((650225359648 : Rat) / 31414578435) [(2, 2), (11, 1), (13, 1)],
  term ((-1300450719296 : Rat) / 31414578435) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((650225359648 : Rat) / 31414578435) [(3, 2), (11, 1), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0139_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0139
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0140 : Poly :=
[
  term ((1196930560 : Rat) / 330679773) [(11, 1), (13, 1), (14, 1)]
]

/-- Partial product 140 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0140 : Poly :=
[
  term ((2393861120 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1196930560 : Rat) / 330679773) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((2393861120 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((-1196930560 : Rat) / 330679773) [(3, 2), (11, 1), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0140_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0140
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0141 : Poly :=
[
  term ((17582080 : Rat) / 36742197) [(11, 1), (13, 1), (15, 2)]
]

/-- Partial product 141 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0141 : Poly :=
[
  term ((35164160 : Rat) / 36742197) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((35164160 : Rat) / 36742197) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(3, 2), (11, 1), (13, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0141_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0141
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0142 : Poly :=
[
  term ((-2741760 : Rat) / 12247399) [(11, 1), (13, 2), (15, 1)]
]

/-- Partial product 142 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0142 : Poly :=
[
  term ((-5483520 : Rat) / 12247399) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((-5483520 : Rat) / 12247399) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(3, 2), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0142_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0142
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0143 : Poly :=
[
  term ((3090449920 : Rat) / 110226591) [(11, 1), (14, 1), (15, 1)]
]

/-- Partial product 143 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0143 : Poly :=
[
  term ((6180899840 : Rat) / 110226591) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3090449920 : Rat) / 110226591) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((6180899840 : Rat) / 110226591) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((-3090449920 : Rat) / 110226591) [(3, 2), (11, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0143_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0143
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0144 : Poly :=
[
  term ((3300533526844 : Rat) / 94243735305) [(11, 1), (15, 1)]
]

/-- Partial product 144 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0144 : Poly :=
[
  term ((6601067053688 : Rat) / 94243735305) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((-3300533526844 : Rat) / 94243735305) [(2, 2), (11, 1), (15, 1)],
  term ((6601067053688 : Rat) / 94243735305) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((-3300533526844 : Rat) / 94243735305) [(3, 2), (11, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0144_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0144
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0145 : Poly :=
[
  term ((9748480 : Rat) / 36742197) [(11, 1), (15, 3)]
]

/-- Partial product 145 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0145 : Poly :=
[
  term ((19496960 : Rat) / 36742197) [(2, 1), (6, 1), (11, 1), (15, 3)],
  term ((-9748480 : Rat) / 36742197) [(2, 2), (11, 1), (15, 3)],
  term ((19496960 : Rat) / 36742197) [(3, 1), (7, 1), (11, 1), (15, 3)],
  term ((-9748480 : Rat) / 36742197) [(3, 2), (11, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0145_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0145
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0146 : Poly :=
[
  term ((-882260884736 : Rat) / 31414578435) [(11, 2)]
]

/-- Partial product 146 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0146 : Poly :=
[
  term ((-1764521769472 : Rat) / 31414578435) [(2, 1), (6, 1), (11, 2)],
  term ((882260884736 : Rat) / 31414578435) [(2, 2), (11, 2)],
  term ((-1764521769472 : Rat) / 31414578435) [(3, 1), (7, 1), (11, 2)],
  term ((882260884736 : Rat) / 31414578435) [(3, 2), (11, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0146_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0146
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0147 : Poly :=
[
  term ((-19496960 : Rat) / 36742197) [(11, 2), (13, 1), (15, 1)]
]

/-- Partial product 147 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0147 : Poly :=
[
  term ((-38993920 : Rat) / 36742197) [(2, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-38993920 : Rat) / 36742197) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(3, 2), (11, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0147_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0147
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0148 : Poly :=
[
  term ((48742400 : Rat) / 110226591) [(11, 2), (14, 1)]
]

/-- Partial product 148 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0148 : Poly :=
[
  term ((97484800 : Rat) / 110226591) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((-48742400 : Rat) / 110226591) [(2, 2), (11, 2), (14, 1)],
  term ((97484800 : Rat) / 110226591) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((-48742400 : Rat) / 110226591) [(3, 2), (11, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0148_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0148
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0149 : Poly :=
[
  term ((4790380 : Rat) / 12247399) [(12, 1), (13, 1), (15, 1)]
]

/-- Partial product 149 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0149 : Poly :=
[
  term ((9580760 : Rat) / 12247399) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4790380 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((9580760 : Rat) / 12247399) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-4790380 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0149_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0149
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0150 : Poly :=
[
  term ((-276473360 : Rat) / 330679773) [(12, 1), (15, 2)]
]

/-- Partial product 150 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0150 : Poly :=
[
  term ((-552946720 : Rat) / 330679773) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((276473360 : Rat) / 330679773) [(2, 2), (12, 1), (15, 2)],
  term ((-552946720 : Rat) / 330679773) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((276473360 : Rat) / 330679773) [(3, 2), (12, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0150_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0150
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0151 : Poly :=
[
  term ((3298594768 : Rat) / 330679773) [(13, 1), (14, 1), (15, 1)]
]

/-- Partial product 151 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0151 : Poly :=
[
  term ((6597189536 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3298594768 : Rat) / 330679773) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((6597189536 : Rat) / 330679773) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((-3298594768 : Rat) / 330679773) [(3, 2), (13, 1), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0151_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0151
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0152 : Poly :=
[
  term ((103078278209 : Rat) / 12565831374) [(13, 1), (15, 1)]
]

/-- Partial product 152 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0152 : Poly :=
[
  term ((103078278209 : Rat) / 6282915687) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((-103078278209 : Rat) / 12565831374) [(2, 2), (13, 1), (15, 1)],
  term ((103078278209 : Rat) / 6282915687) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((-103078278209 : Rat) / 12565831374) [(3, 2), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0152_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0152
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0153 : Poly :=
[
  term ((1370880 : Rat) / 12247399) [(13, 1), (15, 3)]
]

/-- Partial product 153 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0153 : Poly :=
[
  term ((2741760 : Rat) / 12247399) [(2, 1), (6, 1), (13, 1), (15, 3)],
  term ((-1370880 : Rat) / 12247399) [(2, 2), (13, 1), (15, 3)],
  term ((2741760 : Rat) / 12247399) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-1370880 : Rat) / 12247399) [(3, 2), (13, 1), (15, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0153_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0153
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0154 : Poly :=
[
  term ((-42950999 : Rat) / 12247399) [(13, 2)]
]

/-- Partial product 154 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0154 : Poly :=
[
  term ((-85901998 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)],
  term ((42950999 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((-85901998 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2)],
  term ((42950999 : Rat) / 12247399) [(3, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0154_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0154
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0155 : Poly :=
[
  term ((17738140 : Rat) / 12247399) [(13, 2), (14, 1)]
]

/-- Partial product 155 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0155 : Poly :=
[
  term ((35476280 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((-17738140 : Rat) / 12247399) [(2, 2), (13, 2), (14, 1)],
  term ((35476280 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-17738140 : Rat) / 12247399) [(3, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0155_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0155
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0156 : Poly :=
[
  term ((-49 : Rat) / 67) [(14, 1)]
]

/-- Partial product 156 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0156 : Poly :=
[
  term ((-98 : Rat) / 67) [(2, 1), (6, 1), (14, 1)],
  term ((49 : Rat) / 67) [(2, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(3, 1), (7, 1), (14, 1)],
  term ((49 : Rat) / 67) [(3, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0156_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0156
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0157 : Poly :=
[
  term ((-2826561760 : Rat) / 110226591) [(14, 1), (15, 2)]
]

/-- Partial product 157 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0157 : Poly :=
[
  term ((-5653123520 : Rat) / 110226591) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((2826561760 : Rat) / 110226591) [(2, 2), (14, 1), (15, 2)],
  term ((-5653123520 : Rat) / 110226591) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((2826561760 : Rat) / 110226591) [(3, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0157_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0157
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0158 : Poly :=
[
  term ((15238171919 : Rat) / 18848747061) [(15, 2)]
]

/-- Partial product 158 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0158 : Poly :=
[
  term ((30476343838 : Rat) / 18848747061) [(2, 1), (6, 1), (15, 2)],
  term ((-15238171919 : Rat) / 18848747061) [(2, 2), (15, 2)],
  term ((30476343838 : Rat) / 18848747061) [(3, 1), (7, 1), (15, 2)],
  term ((-15238171919 : Rat) / 18848747061) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0158_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0158
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 17. -/
def rs_R009_ueqv_R009NNNYN_coefficient_17_0159 : Poly :=
[
  term ((-8791040 : Rat) / 36742197) [(15, 4)]
]

/-- Partial product 159 for generator 17. -/
def rs_R009_ueqv_R009NNNYN_partial_17_0159 : Poly :=
[
  term ((-17582080 : Rat) / 36742197) [(2, 1), (6, 1), (15, 4)],
  term ((8791040 : Rat) / 36742197) [(2, 2), (15, 4)],
  term ((-17582080 : Rat) / 36742197) [(3, 1), (7, 1), (15, 4)],
  term ((8791040 : Rat) / 36742197) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 17. -/
theorem rs_R009_ueqv_R009NNNYN_partial_17_0159_valid :
    mulPoly rs_R009_ueqv_R009NNNYN_coefficient_17_0159
        rs_R009_ueqv_R009NNNYN_generator_17_0100_0159 =
      rs_R009_ueqv_R009NNNYN_partial_17_0159 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_partials_17_0100_0159 : List Poly :=
[
  rs_R009_ueqv_R009NNNYN_partial_17_0100,
  rs_R009_ueqv_R009NNNYN_partial_17_0101,
  rs_R009_ueqv_R009NNNYN_partial_17_0102,
  rs_R009_ueqv_R009NNNYN_partial_17_0103,
  rs_R009_ueqv_R009NNNYN_partial_17_0104,
  rs_R009_ueqv_R009NNNYN_partial_17_0105,
  rs_R009_ueqv_R009NNNYN_partial_17_0106,
  rs_R009_ueqv_R009NNNYN_partial_17_0107,
  rs_R009_ueqv_R009NNNYN_partial_17_0108,
  rs_R009_ueqv_R009NNNYN_partial_17_0109,
  rs_R009_ueqv_R009NNNYN_partial_17_0110,
  rs_R009_ueqv_R009NNNYN_partial_17_0111,
  rs_R009_ueqv_R009NNNYN_partial_17_0112,
  rs_R009_ueqv_R009NNNYN_partial_17_0113,
  rs_R009_ueqv_R009NNNYN_partial_17_0114,
  rs_R009_ueqv_R009NNNYN_partial_17_0115,
  rs_R009_ueqv_R009NNNYN_partial_17_0116,
  rs_R009_ueqv_R009NNNYN_partial_17_0117,
  rs_R009_ueqv_R009NNNYN_partial_17_0118,
  rs_R009_ueqv_R009NNNYN_partial_17_0119,
  rs_R009_ueqv_R009NNNYN_partial_17_0120,
  rs_R009_ueqv_R009NNNYN_partial_17_0121,
  rs_R009_ueqv_R009NNNYN_partial_17_0122,
  rs_R009_ueqv_R009NNNYN_partial_17_0123,
  rs_R009_ueqv_R009NNNYN_partial_17_0124,
  rs_R009_ueqv_R009NNNYN_partial_17_0125,
  rs_R009_ueqv_R009NNNYN_partial_17_0126,
  rs_R009_ueqv_R009NNNYN_partial_17_0127,
  rs_R009_ueqv_R009NNNYN_partial_17_0128,
  rs_R009_ueqv_R009NNNYN_partial_17_0129,
  rs_R009_ueqv_R009NNNYN_partial_17_0130,
  rs_R009_ueqv_R009NNNYN_partial_17_0131,
  rs_R009_ueqv_R009NNNYN_partial_17_0132,
  rs_R009_ueqv_R009NNNYN_partial_17_0133,
  rs_R009_ueqv_R009NNNYN_partial_17_0134,
  rs_R009_ueqv_R009NNNYN_partial_17_0135,
  rs_R009_ueqv_R009NNNYN_partial_17_0136,
  rs_R009_ueqv_R009NNNYN_partial_17_0137,
  rs_R009_ueqv_R009NNNYN_partial_17_0138,
  rs_R009_ueqv_R009NNNYN_partial_17_0139,
  rs_R009_ueqv_R009NNNYN_partial_17_0140,
  rs_R009_ueqv_R009NNNYN_partial_17_0141,
  rs_R009_ueqv_R009NNNYN_partial_17_0142,
  rs_R009_ueqv_R009NNNYN_partial_17_0143,
  rs_R009_ueqv_R009NNNYN_partial_17_0144,
  rs_R009_ueqv_R009NNNYN_partial_17_0145,
  rs_R009_ueqv_R009NNNYN_partial_17_0146,
  rs_R009_ueqv_R009NNNYN_partial_17_0147,
  rs_R009_ueqv_R009NNNYN_partial_17_0148,
  rs_R009_ueqv_R009NNNYN_partial_17_0149,
  rs_R009_ueqv_R009NNNYN_partial_17_0150,
  rs_R009_ueqv_R009NNNYN_partial_17_0151,
  rs_R009_ueqv_R009NNNYN_partial_17_0152,
  rs_R009_ueqv_R009NNNYN_partial_17_0153,
  rs_R009_ueqv_R009NNNYN_partial_17_0154,
  rs_R009_ueqv_R009NNNYN_partial_17_0155,
  rs_R009_ueqv_R009NNNYN_partial_17_0156,
  rs_R009_ueqv_R009NNNYN_partial_17_0157,
  rs_R009_ueqv_R009NNNYN_partial_17_0158,
  rs_R009_ueqv_R009NNNYN_partial_17_0159
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009NNNYN_block_17_0100_0159 : Poly :=
[
  term ((21488000 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(2, 1), (6, 1), (7, 1), (13, 2), (15, 1)],
  term ((9831239224 : Rat) / 330679773) [(2, 1), (6, 1), (7, 1), (14, 1), (15, 1)],
  term ((-42785405530739 : Rat) / 471218676525) [(2, 1), (6, 1), (7, 1), (15, 1)],
  term ((-83514880 : Rat) / 110226591) [(2, 1), (6, 1), (7, 1), (15, 3)],
  term ((1939012995584 : Rat) / 31414578435) [(2, 1), (6, 1), (9, 1), (10, 1), (11, 1)],
  term ((30297078056 : Rat) / 1163502905) [(2, 1), (6, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1748574219232 : Rat) / 31414578435) [(2, 1), (6, 1), (9, 1), (10, 1), (15, 1)],
  term ((354026058356 : Rat) / 6282915687) [(2, 1), (6, 1), (9, 1), (11, 1)],
  term ((-12990811904 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((139525120 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-37186965760 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(2, 1), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((137523200 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(2, 1), (6, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(2, 1), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (11, 2), (15, 1)],
  term ((-202981436 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((12247964644 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(2, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((11958082789 : Rat) / 465401162) [(2, 1), (6, 1), (9, 1), (13, 1)],
  term ((-581046340 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3229466429 : Rat) / 918554925) [(2, 1), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-97473920 : Rat) / 110226591) [(2, 1), (6, 1), (9, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(2, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((7311360 : Rat) / 12247399) [(2, 1), (6, 1), (9, 1), (13, 2), (15, 1)],
  term ((33534674480 : Rat) / 330679773) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(2, 1), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-326995417045 : Rat) / 6282915687) [(2, 1), (6, 1), (9, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(2, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30768640 : Rat) / 36742197) [(2, 1), (6, 1), (9, 1), (15, 3)],
  term ((1104 : Rat) / 67) [(2, 1), (6, 1), (9, 2)],
  term ((-44102409344 : Rat) / 18848747061) [(2, 1), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(2, 1), (6, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(2, 1), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((38993920 : Rat) / 110226591) [(2, 1), (6, 1), (10, 1), (11, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(2, 1), (6, 1), (10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(2, 1), (6, 1), (10, 1), (13, 2)],
  term ((613168640 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1300450719296 : Rat) / 31414578435) [(2, 1), (6, 1), (11, 1), (13, 1)],
  term ((2393861120 : Rat) / 330679773) [(2, 1), (6, 1), (11, 1), (13, 1), (14, 1)],
  term ((35164160 : Rat) / 36742197) [(2, 1), (6, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(2, 1), (6, 1), (11, 1), (13, 2), (15, 1)],
  term ((6180899840 : Rat) / 110226591) [(2, 1), (6, 1), (11, 1), (14, 1), (15, 1)],
  term ((6601067053688 : Rat) / 94243735305) [(2, 1), (6, 1), (11, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(2, 1), (6, 1), (11, 1), (15, 3)],
  term ((-1764521769472 : Rat) / 31414578435) [(2, 1), (6, 1), (11, 2)],
  term ((-38993920 : Rat) / 36742197) [(2, 1), (6, 1), (11, 2), (13, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(2, 1), (6, 1), (11, 2), (14, 1)],
  term ((9580760 : Rat) / 12247399) [(2, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-552946720 : Rat) / 330679773) [(2, 1), (6, 1), (12, 1), (15, 2)],
  term ((6597189536 : Rat) / 330679773) [(2, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((103078278209 : Rat) / 6282915687) [(2, 1), (6, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(2, 1), (6, 1), (13, 1), (15, 3)],
  term ((-85901998 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2)],
  term ((35476280 : Rat) / 12247399) [(2, 1), (6, 1), (13, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(2, 1), (6, 1), (14, 1)],
  term ((-5653123520 : Rat) / 110226591) [(2, 1), (6, 1), (14, 1), (15, 2)],
  term ((30476343838 : Rat) / 18848747061) [(2, 1), (6, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(2, 1), (6, 1), (15, 4)],
  term ((-10744000 : Rat) / 110226591) [(2, 2), (7, 1), (13, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(2, 2), (7, 1), (13, 2), (15, 1)],
  term ((-4915619612 : Rat) / 330679773) [(2, 2), (7, 1), (14, 1), (15, 1)],
  term ((42785405530739 : Rat) / 942437353050) [(2, 2), (7, 1), (15, 1)],
  term ((41757440 : Rat) / 110226591) [(2, 2), (7, 1), (15, 3)],
  term ((-969506497792 : Rat) / 31414578435) [(2, 2), (9, 1), (10, 1), (11, 1)],
  term ((-15148539028 : Rat) / 1163502905) [(2, 2), (9, 1), (10, 1), (13, 1)],
  term ((874287109616 : Rat) / 31414578435) [(2, 2), (9, 1), (10, 1), (15, 1)],
  term ((-177013029178 : Rat) / 6282915687) [(2, 2), (9, 1), (11, 1)],
  term ((6495405952 : Rat) / 330679773) [(2, 2), (9, 1), (11, 1), (12, 1)],
  term ((-69762560 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((18593482880 : Rat) / 330679773) [(2, 2), (9, 1), (11, 1), (14, 1)],
  term ((103342925728 : Rat) / 24800982975) [(2, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-68761600 : Rat) / 110226591) [(2, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(2, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(2, 2), (9, 1), (11, 1), (16, 1)],
  term ((19496960 : Rat) / 110226591) [(2, 2), (9, 1), (11, 2), (15, 1)],
  term ((101490718 : Rat) / 12247399) [(2, 2), (9, 1), (12, 1), (13, 1)],
  term ((-6123982322 : Rat) / 330679773) [(2, 2), (9, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(2, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11958082789 : Rat) / 930802324) [(2, 2), (9, 1), (13, 1)],
  term ((290523170 : Rat) / 12247399) [(2, 2), (9, 1), (13, 1), (14, 1)],
  term ((3229466429 : Rat) / 1837109850) [(2, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48736960 : Rat) / 110226591) [(2, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(2, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3655680 : Rat) / 12247399) [(2, 2), (9, 1), (13, 2), (15, 1)],
  term ((-16767337240 : Rat) / 330679773) [(2, 2), (9, 1), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(2, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((326995417045 : Rat) / 12565831374) [(2, 2), (9, 1), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(2, 2), (9, 1), (15, 1), (16, 1)],
  term ((15384320 : Rat) / 36742197) [(2, 2), (9, 1), (15, 3)],
  term ((-552 : Rat) / 67) [(2, 2), (9, 2)],
  term ((22051204672 : Rat) / 18848747061) [(2, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(2, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(2, 2), (9, 2), (15, 2), (16, 1)],
  term ((-19496960 : Rat) / 110226591) [(2, 2), (10, 1), (11, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(2, 2), (10, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(2, 2), (10, 1), (13, 2)],
  term ((-306584320 : Rat) / 330679773) [(2, 2), (11, 1), (12, 1), (15, 1)],
  term ((650225359648 : Rat) / 31414578435) [(2, 2), (11, 1), (13, 1)],
  term ((-1196930560 : Rat) / 330679773) [(2, 2), (11, 1), (13, 1), (14, 1)],
  term ((-17582080 : Rat) / 36742197) [(2, 2), (11, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(2, 2), (11, 1), (13, 2), (15, 1)],
  term ((-3090449920 : Rat) / 110226591) [(2, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3300533526844 : Rat) / 94243735305) [(2, 2), (11, 1), (15, 1)],
  term ((-9748480 : Rat) / 36742197) [(2, 2), (11, 1), (15, 3)],
  term ((882260884736 : Rat) / 31414578435) [(2, 2), (11, 2)],
  term ((19496960 : Rat) / 36742197) [(2, 2), (11, 2), (13, 1), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(2, 2), (11, 2), (14, 1)],
  term ((-4790380 : Rat) / 12247399) [(2, 2), (12, 1), (13, 1), (15, 1)],
  term ((276473360 : Rat) / 330679773) [(2, 2), (12, 1), (15, 2)],
  term ((-3298594768 : Rat) / 330679773) [(2, 2), (13, 1), (14, 1), (15, 1)],
  term ((-103078278209 : Rat) / 12565831374) [(2, 2), (13, 1), (15, 1)],
  term ((-1370880 : Rat) / 12247399) [(2, 2), (13, 1), (15, 3)],
  term ((42950999 : Rat) / 12247399) [(2, 2), (13, 2)],
  term ((-17738140 : Rat) / 12247399) [(2, 2), (13, 2), (14, 1)],
  term ((49 : Rat) / 67) [(2, 2), (14, 1)],
  term ((2826561760 : Rat) / 110226591) [(2, 2), (14, 1), (15, 2)],
  term ((-15238171919 : Rat) / 18848747061) [(2, 2), (15, 2)],
  term ((8791040 : Rat) / 36742197) [(2, 2), (15, 4)],
  term ((1939012995584 : Rat) / 31414578435) [(3, 1), (7, 1), (9, 1), (10, 1), (11, 1)],
  term ((30297078056 : Rat) / 1163502905) [(3, 1), (7, 1), (9, 1), (10, 1), (13, 1)],
  term ((-1748574219232 : Rat) / 31414578435) [(3, 1), (7, 1), (9, 1), (10, 1), (15, 1)],
  term ((354026058356 : Rat) / 6282915687) [(3, 1), (7, 1), (9, 1), (11, 1)],
  term ((-12990811904 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (11, 1), (12, 1)],
  term ((139525120 : Rat) / 110226591) [(3, 1), (7, 1), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((-37186965760 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1)],
  term ((-206685851456 : Rat) / 24800982975) [(3, 1), (7, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((137523200 : Rat) / 110226591) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2)],
  term ((4640 : Rat) / 201) [(3, 1), (7, 1), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((405093715256 : Rat) / 24800982975) [(3, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-38993920 : Rat) / 110226591) [(3, 1), (7, 1), (9, 1), (11, 2), (15, 1)],
  term ((-202981436 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (12, 1), (13, 1)],
  term ((12247964644 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1)],
  term ((-126 : Rat) / 67) [(3, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((11958082789 : Rat) / 465401162) [(3, 1), (7, 1), (9, 1), (13, 1)],
  term ((-581046340 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1)],
  term ((-3229466429 : Rat) / 918554925) [(3, 1), (7, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-97473920 : Rat) / 110226591) [(3, 1), (7, 1), (9, 1), (13, 1), (15, 2)],
  term ((3229466429 : Rat) / 918554925) [(3, 1), (7, 1), (9, 1), (13, 1), (16, 1)],
  term ((7311360 : Rat) / 12247399) [(3, 1), (7, 1), (9, 1), (13, 2), (15, 1)],
  term ((33534674480 : Rat) / 330679773) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1)],
  term ((41282089588 : Rat) / 24800982975) [(3, 1), (7, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-326995417045 : Rat) / 6282915687) [(3, 1), (7, 1), (9, 1), (15, 1)],
  term ((60636377762 : Rat) / 24800982975) [(3, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-30768640 : Rat) / 36742197) [(3, 1), (7, 1), (9, 1), (15, 3)],
  term ((1104 : Rat) / 67) [(3, 1), (7, 1), (9, 2)],
  term ((-44102409344 : Rat) / 18848747061) [(3, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-689100146 : Rat) / 698101743) [(3, 1), (7, 1), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((76905767668 : Rat) / 18848747061) [(3, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((38993920 : Rat) / 110226591) [(3, 1), (7, 1), (10, 1), (11, 1), (13, 1)],
  term ((-35164160 : Rat) / 110226591) [(3, 1), (7, 1), (10, 1), (13, 1), (15, 1)],
  term ((1827840 : Rat) / 12247399) [(3, 1), (7, 1), (10, 1), (13, 2)],
  term ((613168640 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1300450719296 : Rat) / 31414578435) [(3, 1), (7, 1), (11, 1), (13, 1)],
  term ((2393861120 : Rat) / 330679773) [(3, 1), (7, 1), (11, 1), (13, 1), (14, 1)],
  term ((35164160 : Rat) / 36742197) [(3, 1), (7, 1), (11, 1), (13, 1), (15, 2)],
  term ((-5483520 : Rat) / 12247399) [(3, 1), (7, 1), (11, 1), (13, 2), (15, 1)],
  term ((6180899840 : Rat) / 110226591) [(3, 1), (7, 1), (11, 1), (14, 1), (15, 1)],
  term ((6601067053688 : Rat) / 94243735305) [(3, 1), (7, 1), (11, 1), (15, 1)],
  term ((19496960 : Rat) / 36742197) [(3, 1), (7, 1), (11, 1), (15, 3)],
  term ((-1764521769472 : Rat) / 31414578435) [(3, 1), (7, 1), (11, 2)],
  term ((-38993920 : Rat) / 36742197) [(3, 1), (7, 1), (11, 2), (13, 1), (15, 1)],
  term ((97484800 : Rat) / 110226591) [(3, 1), (7, 1), (11, 2), (14, 1)],
  term ((9580760 : Rat) / 12247399) [(3, 1), (7, 1), (12, 1), (13, 1), (15, 1)],
  term ((-552946720 : Rat) / 330679773) [(3, 1), (7, 1), (12, 1), (15, 2)],
  term ((6597189536 : Rat) / 330679773) [(3, 1), (7, 1), (13, 1), (14, 1), (15, 1)],
  term ((103078278209 : Rat) / 6282915687) [(3, 1), (7, 1), (13, 1), (15, 1)],
  term ((2741760 : Rat) / 12247399) [(3, 1), (7, 1), (13, 1), (15, 3)],
  term ((-85901998 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2)],
  term ((35476280 : Rat) / 12247399) [(3, 1), (7, 1), (13, 2), (14, 1)],
  term ((-98 : Rat) / 67) [(3, 1), (7, 1), (14, 1)],
  term ((-5653123520 : Rat) / 110226591) [(3, 1), (7, 1), (14, 1), (15, 2)],
  term ((30476343838 : Rat) / 18848747061) [(3, 1), (7, 1), (15, 2)],
  term ((-17582080 : Rat) / 36742197) [(3, 1), (7, 1), (15, 4)],
  term ((21488000 : Rat) / 110226591) [(3, 1), (7, 2), (13, 1), (15, 2)],
  term ((913920 : Rat) / 12247399) [(3, 1), (7, 2), (13, 2), (15, 1)],
  term ((9831239224 : Rat) / 330679773) [(3, 1), (7, 2), (14, 1), (15, 1)],
  term ((-42785405530739 : Rat) / 471218676525) [(3, 1), (7, 2), (15, 1)],
  term ((-83514880 : Rat) / 110226591) [(3, 1), (7, 2), (15, 3)],
  term ((-10744000 : Rat) / 110226591) [(3, 2), (7, 1), (13, 1), (15, 2)],
  term ((-456960 : Rat) / 12247399) [(3, 2), (7, 1), (13, 2), (15, 1)],
  term ((-4915619612 : Rat) / 330679773) [(3, 2), (7, 1), (14, 1), (15, 1)],
  term ((42785405530739 : Rat) / 942437353050) [(3, 2), (7, 1), (15, 1)],
  term ((41757440 : Rat) / 110226591) [(3, 2), (7, 1), (15, 3)],
  term ((-969506497792 : Rat) / 31414578435) [(3, 2), (9, 1), (10, 1), (11, 1)],
  term ((-15148539028 : Rat) / 1163502905) [(3, 2), (9, 1), (10, 1), (13, 1)],
  term ((874287109616 : Rat) / 31414578435) [(3, 2), (9, 1), (10, 1), (15, 1)],
  term ((-177013029178 : Rat) / 6282915687) [(3, 2), (9, 1), (11, 1)],
  term ((6495405952 : Rat) / 330679773) [(3, 2), (9, 1), (11, 1), (12, 1)],
  term ((-69762560 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1), (13, 1), (15, 1)],
  term ((18593482880 : Rat) / 330679773) [(3, 2), (9, 1), (11, 1), (14, 1)],
  term ((103342925728 : Rat) / 24800982975) [(3, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-68761600 : Rat) / 110226591) [(3, 2), (9, 1), (11, 1), (15, 2)],
  term ((-2320 : Rat) / 201) [(3, 2), (9, 1), (11, 1), (15, 2), (16, 1)],
  term ((-202546857628 : Rat) / 24800982975) [(3, 2), (9, 1), (11, 1), (16, 1)],
  term ((19496960 : Rat) / 110226591) [(3, 2), (9, 1), (11, 2), (15, 1)],
  term ((101490718 : Rat) / 12247399) [(3, 2), (9, 1), (12, 1), (13, 1)],
  term ((-6123982322 : Rat) / 330679773) [(3, 2), (9, 1), (12, 1), (15, 1)],
  term ((63 : Rat) / 67) [(3, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-11958082789 : Rat) / 930802324) [(3, 2), (9, 1), (13, 1)],
  term ((290523170 : Rat) / 12247399) [(3, 2), (9, 1), (13, 1), (14, 1)],
  term ((3229466429 : Rat) / 1837109850) [(3, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((48736960 : Rat) / 110226591) [(3, 2), (9, 1), (13, 1), (15, 2)],
  term ((-3229466429 : Rat) / 1837109850) [(3, 2), (9, 1), (13, 1), (16, 1)],
  term ((-3655680 : Rat) / 12247399) [(3, 2), (9, 1), (13, 2), (15, 1)],
  term ((-16767337240 : Rat) / 330679773) [(3, 2), (9, 1), (14, 1), (15, 1)],
  term ((-20641044794 : Rat) / 24800982975) [(3, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((326995417045 : Rat) / 12565831374) [(3, 2), (9, 1), (15, 1)],
  term ((-30318188881 : Rat) / 24800982975) [(3, 2), (9, 1), (15, 1), (16, 1)],
  term ((15384320 : Rat) / 36742197) [(3, 2), (9, 1), (15, 3)],
  term ((-552 : Rat) / 67) [(3, 2), (9, 2)],
  term ((22051204672 : Rat) / 18848747061) [(3, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((344550073 : Rat) / 698101743) [(3, 2), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-38452883834 : Rat) / 18848747061) [(3, 2), (9, 2), (15, 2), (16, 1)],
  term ((-19496960 : Rat) / 110226591) [(3, 2), (10, 1), (11, 1), (13, 1)],
  term ((17582080 : Rat) / 110226591) [(3, 2), (10, 1), (13, 1), (15, 1)],
  term ((-913920 : Rat) / 12247399) [(3, 2), (10, 1), (13, 2)],
  term ((-306584320 : Rat) / 330679773) [(3, 2), (11, 1), (12, 1), (15, 1)],
  term ((650225359648 : Rat) / 31414578435) [(3, 2), (11, 1), (13, 1)],
  term ((-1196930560 : Rat) / 330679773) [(3, 2), (11, 1), (13, 1), (14, 1)],
  term ((-17582080 : Rat) / 36742197) [(3, 2), (11, 1), (13, 1), (15, 2)],
  term ((2741760 : Rat) / 12247399) [(3, 2), (11, 1), (13, 2), (15, 1)],
  term ((-3090449920 : Rat) / 110226591) [(3, 2), (11, 1), (14, 1), (15, 1)],
  term ((-3300533526844 : Rat) / 94243735305) [(3, 2), (11, 1), (15, 1)],
  term ((-9748480 : Rat) / 36742197) [(3, 2), (11, 1), (15, 3)],
  term ((882260884736 : Rat) / 31414578435) [(3, 2), (11, 2)],
  term ((19496960 : Rat) / 36742197) [(3, 2), (11, 2), (13, 1), (15, 1)],
  term ((-48742400 : Rat) / 110226591) [(3, 2), (11, 2), (14, 1)],
  term ((-4790380 : Rat) / 12247399) [(3, 2), (12, 1), (13, 1), (15, 1)],
  term ((276473360 : Rat) / 330679773) [(3, 2), (12, 1), (15, 2)],
  term ((-3298594768 : Rat) / 330679773) [(3, 2), (13, 1), (14, 1), (15, 1)],
  term ((-103078278209 : Rat) / 12565831374) [(3, 2), (13, 1), (15, 1)],
  term ((-1370880 : Rat) / 12247399) [(3, 2), (13, 1), (15, 3)],
  term ((42950999 : Rat) / 12247399) [(3, 2), (13, 2)],
  term ((-17738140 : Rat) / 12247399) [(3, 2), (13, 2), (14, 1)],
  term ((49 : Rat) / 67) [(3, 2), (14, 1)],
  term ((2826561760 : Rat) / 110226591) [(3, 2), (14, 1), (15, 2)],
  term ((-15238171919 : Rat) / 18848747061) [(3, 2), (15, 2)],
  term ((8791040 : Rat) / 36742197) [(3, 2), (15, 4)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 17, terms 100 through 159. -/
theorem rs_R009_ueqv_R009NNNYN_block_17_0100_0159_valid :
    checkProductSumEq rs_R009_ueqv_R009NNNYN_partials_17_0100_0159
      rs_R009_ueqv_R009NNNYN_block_17_0100_0159 = true := by
  native_decide

end R009UeqvR009NNNYNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
