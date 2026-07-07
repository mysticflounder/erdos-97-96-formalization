/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 12:100-199

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 12 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_12_0100_0199 : Poly :=
[
  term (2 : Rat) [(2, 1), (12, 1)],
  term (2 : Rat) [(3, 1), (13, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 100 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0100 : Poly :=
[
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 100 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0100 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 100 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0100_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0100
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0100 := by
  native_decide

/-- Coefficient term 101 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0101 : Poly :=
[
  term ((453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 101 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0101 : Poly :=
[
  term ((906527399610261434368 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((906527399610261434368 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 101 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0101_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0101
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0101 := by
  native_decide

/-- Coefficient term 102 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0102 : Poly :=
[
  term ((4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 1), (16, 1)]
]

/-- Partial product 102 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0102 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (13, 2), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 102 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0102_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0102
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0102 := by
  native_decide

/-- Coefficient term 103 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0103 : Poly :=
[
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 103 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0103 : Poly :=
[
  term ((-16443216260964144640 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16443216260964144640 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 103 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0103_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0103
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0103 := by
  native_decide

/-- Coefficient term 104 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0104 : Poly :=
[
  term ((-1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 104 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0104 : Poly :=
[
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 104 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0104_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0104
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0104 := by
  native_decide

/-- Coefficient term 105 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0105 : Poly :=
[
  term ((3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 105 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0105 : Poly :=
[
  term ((6902620396042353664 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((6902620396042353664 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 105 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0105_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0105
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0105 := by
  native_decide

/-- Coefficient term 106 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0106 : Poly :=
[
  term ((423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 106 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0106 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 106 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0106_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0106
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0106 := by
  native_decide

/-- Coefficient term 107 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0107 : Poly :=
[
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 107 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0107 : Poly :=
[
  term ((-1694572729772558058112 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1694572729772558058112 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 107 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0107_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0107
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0107 := by
  native_decide

/-- Coefficient term 108 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0108 : Poly :=
[
  term ((-475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 108 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0108 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 108 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0108_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0108
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0108 := by
  native_decide

/-- Coefficient term 109 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0109 : Poly :=
[
  term ((951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 109 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0109 : Poly :=
[
  term ((1902887332950016000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 109 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0109_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0109
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0109 := by
  native_decide

/-- Coefficient term 110 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0110 : Poly :=
[
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 110 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0110 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 110 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0110_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0110
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0110 := by
  native_decide

/-- Coefficient term 111 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0111 : Poly :=
[
  term ((545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 111 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0111 : Poly :=
[
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 111 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0111_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0111
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0111 := by
  native_decide

/-- Coefficient term 112 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0112 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 1), (16, 1)]
]

/-- Partial product 112 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0112 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (13, 2), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 2), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 112 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0112_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0112
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0112 := by
  native_decide

/-- Coefficient term 113 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0113 : Poly :=
[
  term ((15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

/-- Partial product 113 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0113 : Poly :=
[
  term ((30352470281839815680 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((30352470281839815680 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 113 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0113_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0113
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0113 := by
  native_decide

/-- Coefficient term 114 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0114 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 114 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0114 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 114 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0114_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0114
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0114 := by
  native_decide

/-- Coefficient term 115 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0115 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 115 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0115 : Poly :=
[
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 115 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0115_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0115
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0115 := by
  native_decide

/-- Coefficient term 116 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0116 : Poly :=
[
  term (-4 : Rat) [(1, 1), (13, 1), (16, 1)]
]

/-- Partial product 116 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0116 : Poly :=
[
  term (-8 : Rat) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 116 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0116_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0116
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0116 := by
  native_decide

/-- Coefficient term 117 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0117 : Poly :=
[
  term (8 : Rat) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 117 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0117 : Poly :=
[
  term (16 : Rat) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 117 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0117_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0117
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0117 := by
  native_decide

/-- Coefficient term 118 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0118 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 118 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0118 : Poly :=
[
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 118 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0118_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0118
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0118 := by
  native_decide

/-- Coefficient term 119 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0119 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 119 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0119 : Poly :=
[
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 119 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0119_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0119
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0119 := by
  native_decide

/-- Coefficient term 120 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0120 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 120 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0120 : Poly :=
[
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 120 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0120_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0120
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0120 := by
  native_decide

/-- Coefficient term 121 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0121 : Poly :=
[
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 121 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0121 : Poly :=
[
  term ((-101550138081280000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-101550138081280000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 121 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0121_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0121
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0121 := by
  native_decide

/-- Coefficient term 122 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0122 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 122 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0122 : Poly :=
[
  term ((250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 122 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0122_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0122
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0122 := by
  native_decide

/-- Coefficient term 123 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0123 : Poly :=
[
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 123 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0123 : Poly :=
[
  term ((-501539731434885970048 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-501539731434885970048 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 123 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0123_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0123
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0123 := by
  native_decide

/-- Coefficient term 124 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0124 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 124 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0124 : Poly :=
[
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 124 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0124_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0124
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0124 := by
  native_decide

/-- Coefficient term 125 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0125 : Poly :=
[
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 125 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0125 : Poly :=
[
  term ((4572188843769774080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4572188843769774080 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 125 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0125_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0125
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0125 := by
  native_decide

/-- Coefficient term 126 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0126 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 126 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0126 : Poly :=
[
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 126 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0126_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0126
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0126 := by
  native_decide

/-- Coefficient term 127 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0127 : Poly :=
[
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 127 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0127 : Poly :=
[
  term ((-8640747765166899200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-8640747765166899200 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 127 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0127_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0127
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0127 := by
  native_decide

/-- Coefficient term 128 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0128 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 128 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0128 : Poly :=
[
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 128 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0128_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0128
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0128 := by
  native_decide

/-- Coefficient term 129 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0129 : Poly :=
[
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 129 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0129 : Poly :=
[
  term ((-103234662752321952064 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-103234662752321952064 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 129 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0129_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0129
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0129 := by
  native_decide

/-- Coefficient term 130 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0130 : Poly :=
[
  term (-4 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 130 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0130 : Poly :=
[
  term (-8 : Rat) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 130 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0130_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0130
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0130 := by
  native_decide

/-- Coefficient term 131 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0131 : Poly :=
[
  term (8 : Rat) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 131 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0131 : Poly :=
[
  term (16 : Rat) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 131 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0131_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0131
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0131 := by
  native_decide

/-- Coefficient term 132 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0132 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 132 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0132 : Poly :=
[
  term ((5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 132 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0132_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0132
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0132 := by
  native_decide

/-- Coefficient term 133 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0133 : Poly :=
[
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 133 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0133 : Poly :=
[
  term ((-11779099177210697728 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-11779099177210697728 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 133 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0133_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0133
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0133 := by
  native_decide

/-- Coefficient term 134 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0134 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 134 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0134 : Poly :=
[
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 134 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0134_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0134
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0134 := by
  native_decide

/-- Coefficient term 135 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0135 : Poly :=
[
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (15, 1), (16, 1)]
]

/-- Partial product 135 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0135 : Poly :=
[
  term ((101550138081280000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((101550138081280000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 135 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0135_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0135
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0135 := by
  native_decide

/-- Coefficient term 136 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0136 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 136 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0136 : Poly :=
[
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 136 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0136_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0136
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0136 := by
  native_decide

/-- Coefficient term 137 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0137 : Poly :=
[
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 137 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0137 : Poly :=
[
  term ((501539731434885970048 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((501539731434885970048 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 137 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0137_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0137
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0137 := by
  native_decide

/-- Coefficient term 138 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0138 : Poly :=
[
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 138 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0138 : Poly :=
[
  term ((2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 138 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0138_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0138
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0138 := by
  native_decide

/-- Coefficient term 139 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0139 : Poly :=
[
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 139 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0139 : Poly :=
[
  term ((-4572188843769774080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4572188843769774080 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 139 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0139_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0139
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0139 := by
  native_decide

/-- Coefficient term 140 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0140 : Poly :=
[
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 140 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0140 : Poly :=
[
  term ((7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 140 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0140_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0140
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0140 := by
  native_decide

/-- Coefficient term 141 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0141 : Poly :=
[
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 141 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0141 : Poly :=
[
  term ((-14811927865666629632 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-14811927865666629632 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 141 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0141_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0141
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0141 := by
  native_decide

/-- Coefficient term 142 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0142 : Poly :=
[
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 1), (16, 1)]
]

/-- Partial product 142 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0142 : Poly :=
[
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (13, 2), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 142 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0142_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0142
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0142 := by
  native_decide

/-- Coefficient term 143 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0143 : Poly :=
[
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 143 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0143 : Poly :=
[
  term ((8640747765166899200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((8640747765166899200 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 143 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0143_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0143
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0143 := by
  native_decide

/-- Coefficient term 144 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0144 : Poly :=
[
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 144 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0144 : Poly :=
[
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 144 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0144_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0144
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0144 := by
  native_decide

/-- Coefficient term 145 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0145 : Poly :=
[
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 145 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0145 : Poly :=
[
  term ((103234662752321952064 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((103234662752321952064 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 145 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0145_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0145
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0145 := by
  native_decide

/-- Coefficient term 146 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0146 : Poly :=
[
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 146 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0146 : Poly :=
[
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 146 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0146_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0146
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0146 := by
  native_decide

/-- Coefficient term 147 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0147 : Poly :=
[
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 147 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0147 : Poly :=
[
  term ((11779099177210697728 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((11779099177210697728 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 147 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0147_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0147
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0147 := by
  native_decide

/-- Coefficient term 148 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0148 : Poly :=
[
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 1), (16, 1)]
]

/-- Partial product 148 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0148 : Poly :=
[
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (13, 2), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 148 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0148_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0148
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0148 := by
  native_decide

/-- Coefficient term 149 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0149 : Poly :=
[
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 149 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0149 : Poly :=
[
  term ((14811927865666629632 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((14811927865666629632 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 149 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0149_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0149
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0149 := by
  native_decide

/-- Coefficient term 150 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0150 : Poly :=
[
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 150 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0150 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 150 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0150_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0150
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0150 := by
  native_decide

/-- Coefficient term 151 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0151 : Poly :=
[
  term ((166603837426378240 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 151 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0151 : Poly :=
[
  term ((333207674852756480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 151 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0151_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0151
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0151 := by
  native_decide

/-- Coefficient term 152 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0152 : Poly :=
[
  term ((-333207674852756480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 152 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0152 : Poly :=
[
  term ((-666415349705512960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-666415349705512960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 152 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0152_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0152
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0152 := by
  native_decide

/-- Coefficient term 153 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0153 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 153 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0153 : Poly :=
[
  term ((2526408031189360640 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 153 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0153_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0153
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0153 := by
  native_decide

/-- Coefficient term 154 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0154 : Poly :=
[
  term ((-139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 154 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0154 : Poly :=
[
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 154 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0154_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0154
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0154 := by
  native_decide

/-- Coefficient term 155 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0155 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 155 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0155 : Poly :=
[
  term ((557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 155 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0155_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0155
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0155 := by
  native_decide

/-- Coefficient term 156 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0156 : Poly :=
[
  term ((290200140551145376 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 156 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0156 : Poly :=
[
  term ((580400281102290752 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 156 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0156_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0156
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0156 := by
  native_decide

/-- Coefficient term 157 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0157 : Poly :=
[
  term ((-580400281102290752 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 157 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0157 : Poly :=
[
  term ((-1160800562204581504 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1160800562204581504 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 157 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0157_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0157
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0157 := by
  native_decide

/-- Coefficient term 158 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0158 : Poly :=
[
  term ((382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 158 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0158 : Poly :=
[
  term ((765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 158 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0158_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0158
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0158 := by
  native_decide

/-- Coefficient term 159 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0159 : Poly :=
[
  term ((-765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 159 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0159 : Poly :=
[
  term ((-1531787043959603200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-1531787043959603200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 159 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0159_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0159
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0159 := by
  native_decide

/-- Coefficient term 160 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0160 : Poly :=
[
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 160 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0160 : Poly :=
[
  term ((1263204015594680320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 160 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0160_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0160
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0160 := by
  native_decide

/-- Coefficient term 161 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0161 : Poly :=
[
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (15, 3), (16, 1)]
]

/-- Partial product 161 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0161 : Poly :=
[
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 161 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0161_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0161
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0161 := by
  native_decide

/-- Coefficient term 162 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0162 : Poly :=
[
  term ((-1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 162 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0162 : Poly :=
[
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 162 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0162_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0162
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0162 := by
  native_decide

/-- Coefficient term 163 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0163 : Poly :=
[
  term ((2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (15, 2), (16, 1)]
]

/-- Partial product 163 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0163 : Poly :=
[
  term ((4456107764246118400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((4456107764246118400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 163 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0163_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0163
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0163 := by
  native_decide

/-- Coefficient term 164 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0164 : Poly :=
[
  term ((-1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 164 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0164 : Poly :=
[
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 164 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0164_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0164
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0164 := by
  native_decide

/-- Coefficient term 165 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0165 : Poly :=
[
  term ((2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (15, 2), (16, 1)]
]

/-- Partial product 165 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0165 : Poly :=
[
  term ((4362857639094471872 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4362857639094471872 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 165 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0165_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0165
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0165 := by
  native_decide

/-- Coefficient term 166 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0166 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 166 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0166 : Poly :=
[
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 166 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0166_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0166
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0166 := by
  native_decide

/-- Coefficient term 167 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0167 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 167 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0167 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 167 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0167_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0167
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0167 := by
  native_decide

/-- Coefficient term 168 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0168 : Poly :=
[
  term ((-94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 168 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0168 : Poly :=
[
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 168 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0168_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0168
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0168 := by
  native_decide

/-- Coefficient term 169 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0169 : Poly :=
[
  term ((377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 169 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0169 : Poly :=
[
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 169 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0169_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0169
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0169 := by
  native_decide

/-- Coefficient term 170 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0170 : Poly :=
[
  term ((-755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (15, 3), (16, 1)]
]

/-- Partial product 170 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0170 : Poly :=
[
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 170 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0170_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0170
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0170 := by
  native_decide

/-- Coefficient term 171 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0171 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 171 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0171 : Poly :=
[
  term ((-65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 171 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0171_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0171
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0171 := by
  native_decide

/-- Coefficient term 172 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0172 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 172 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0172 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 172 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0172_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0172
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0172 := by
  native_decide

/-- Coefficient term 173 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0173 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 173 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0173 : Poly :=
[
  term ((3158010038986700800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 173 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0173_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0173
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0173 := by
  native_decide

/-- Coefficient term 174 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0174 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 174 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0174 : Poly :=
[
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 174 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0174_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0174
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0174 := by
  native_decide

/-- Coefficient term 175 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0175 : Poly :=
[
  term ((65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 175 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0175 : Poly :=
[
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 175 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0175_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0175
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0175 := by
  native_decide

/-- Coefficient term 176 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0176 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 176 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0176 : Poly :=
[
  term ((1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 176 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0176_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0176
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0176 := by
  native_decide

/-- Coefficient term 177 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0177 : Poly :=
[
  term ((-131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 177 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0177 : Poly :=
[
  term ((-262473904242278400 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-262473904242278400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 177 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0177_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0177
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0177 := by
  native_decide

/-- Coefficient term 178 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0178 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (16, 1)]
]

/-- Partial product 178 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0178 : Poly :=
[
  term ((-32809238030284800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 178 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0178_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0178
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0178 := by
  native_decide

/-- Coefficient term 179 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0179 : Poly :=
[
  term ((-3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 179 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0179 : Poly :=
[
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 179 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0179_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0179
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0179 := by
  native_decide

/-- Coefficient term 180 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0180 : Poly :=
[
  term ((6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (15, 4), (16, 1)]
]

/-- Partial product 180 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0180 : Poly :=
[
  term ((12632040155946803200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 4), (16, 1)],
  term ((12632040155946803200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (15, 4), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 4), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 180 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0180_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0180
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0180 := by
  native_decide

/-- Coefficient term 181 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0181 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 181 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0181 : Poly :=
[
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 181 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0181_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0181
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0181 := by
  native_decide

/-- Coefficient term 182 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0182 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 182 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0182 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 182 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0182_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0182
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0182 := by
  native_decide

/-- Coefficient term 183 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0183 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (16, 1)]
]

/-- Partial product 183 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0183 : Poly :=
[
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 183 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0183_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0183
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0183 := by
  native_decide

/-- Coefficient term 184 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0184 : Poly :=
[
  term ((2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 184 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0184 : Poly :=
[
  term ((4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 184 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0184_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0184
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0184 := by
  native_decide

/-- Coefficient term 185 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0185 : Poly :=
[
  term ((-4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (15, 3), (16, 1)]
]

/-- Partial product 185 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0185 : Poly :=
[
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 185 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0185_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0185
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0185 := by
  native_decide

/-- Coefficient term 186 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0186 : Poly :=
[
  term ((867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 186 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0186 : Poly :=
[
  term ((1735609243875225600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 186 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0186_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0186
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0186 := by
  native_decide

/-- Coefficient term 187 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0187 : Poly :=
[
  term ((-1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 187 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0187 : Poly :=
[
  term ((-3471218487750451200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3471218487750451200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 187 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0187_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0187
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0187 := by
  native_decide

/-- Coefficient term 188 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0188 : Poly :=
[
  term ((868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 188 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0188 : Poly :=
[
  term ((1736905521442685440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 188 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0188_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0188
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0188 := by
  native_decide

/-- Coefficient term 189 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0189 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (15, 2), (16, 1)]
]

/-- Partial product 189 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0189 : Poly :=
[
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 189 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0189_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0189
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0189 := by
  native_decide

/-- Coefficient term 190 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0190 : Poly :=
[
  term ((-14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 190 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0190 : Poly :=
[
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 190 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0190_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0190
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0190 := by
  native_decide

/-- Coefficient term 191 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0191 : Poly :=
[
  term ((-446971267735596800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 191 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0191 : Poly :=
[
  term ((-893942535471193600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((446971267735596800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((446971267735596800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 191 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0191_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0191
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0191 := by
  native_decide

/-- Coefficient term 192 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0192 : Poly :=
[
  term ((2196621676553207680 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 192 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0192 : Poly :=
[
  term ((4393243353106415360 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((4393243353106415360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2196621676553207680 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2196621676553207680 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 192 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0192_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0192
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0192 := by
  native_decide

/-- Coefficient term 193 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0193 : Poly :=
[
  term ((28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (15, 3), (16, 1)]
]

/-- Partial product 193 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0193 : Poly :=
[
  term ((57429116717129400320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((57429116717129400320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 193 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0193_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0193
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0193 := by
  native_decide

/-- Coefficient term 194 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0194 : Poly :=
[
  term ((56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 194 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0194 : Poly :=
[
  term ((112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 194 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0194_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0194
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0194 := by
  native_decide

/-- Coefficient term 195 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0195 : Poly :=
[
  term ((-112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (15, 2), (16, 1)]
]

/-- Partial product 195 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0195 : Poly :=
[
  term ((-225732769845452800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((-225732769845452800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 195 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0195_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0195
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0195 := by
  native_decide

/-- Coefficient term 196 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0196 : Poly :=
[
  term ((433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 196 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0196 : Poly :=
[
  term ((867804621937612800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 196 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0196_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0196
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0196 := by
  native_decide

/-- Coefficient term 197 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0197 : Poly :=
[
  term ((-511245185108588067616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 197 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0197 : Poly :=
[
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 197 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0197_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0197
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0197 := by
  native_decide

/-- Coefficient term 198 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0198 : Poly :=
[
  term ((-1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 1), (15, 3), (16, 1)]
]

/-- Partial product 198 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0198 : Poly :=
[
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 198 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0198_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0198
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0198 := by
  native_decide

/-- Coefficient term 199 from coefficient polynomial 12. -/
def rs_R010_ueqv_R010YNN_coefficient_12_0199 : Poly :=
[
  term ((1022490370217176135232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 199 for generator 12. -/
def rs_R010_ueqv_R010YNN_partial_12_0199 : Poly :=
[
  term ((2044980740434352270464 : Rat) / 4042369870927946325) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((2044980740434352270464 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 199 for generator 12. -/
theorem rs_R010_ueqv_R010YNN_partial_12_0199_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_12_0199
        rs_R010_ueqv_R010YNN_generator_12_0100_0199 =
      rs_R010_ueqv_R010YNN_partial_12_0199 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_12_0100_0199 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_12_0100,
  rs_R010_ueqv_R010YNN_partial_12_0101,
  rs_R010_ueqv_R010YNN_partial_12_0102,
  rs_R010_ueqv_R010YNN_partial_12_0103,
  rs_R010_ueqv_R010YNN_partial_12_0104,
  rs_R010_ueqv_R010YNN_partial_12_0105,
  rs_R010_ueqv_R010YNN_partial_12_0106,
  rs_R010_ueqv_R010YNN_partial_12_0107,
  rs_R010_ueqv_R010YNN_partial_12_0108,
  rs_R010_ueqv_R010YNN_partial_12_0109,
  rs_R010_ueqv_R010YNN_partial_12_0110,
  rs_R010_ueqv_R010YNN_partial_12_0111,
  rs_R010_ueqv_R010YNN_partial_12_0112,
  rs_R010_ueqv_R010YNN_partial_12_0113,
  rs_R010_ueqv_R010YNN_partial_12_0114,
  rs_R010_ueqv_R010YNN_partial_12_0115,
  rs_R010_ueqv_R010YNN_partial_12_0116,
  rs_R010_ueqv_R010YNN_partial_12_0117,
  rs_R010_ueqv_R010YNN_partial_12_0118,
  rs_R010_ueqv_R010YNN_partial_12_0119,
  rs_R010_ueqv_R010YNN_partial_12_0120,
  rs_R010_ueqv_R010YNN_partial_12_0121,
  rs_R010_ueqv_R010YNN_partial_12_0122,
  rs_R010_ueqv_R010YNN_partial_12_0123,
  rs_R010_ueqv_R010YNN_partial_12_0124,
  rs_R010_ueqv_R010YNN_partial_12_0125,
  rs_R010_ueqv_R010YNN_partial_12_0126,
  rs_R010_ueqv_R010YNN_partial_12_0127,
  rs_R010_ueqv_R010YNN_partial_12_0128,
  rs_R010_ueqv_R010YNN_partial_12_0129,
  rs_R010_ueqv_R010YNN_partial_12_0130,
  rs_R010_ueqv_R010YNN_partial_12_0131,
  rs_R010_ueqv_R010YNN_partial_12_0132,
  rs_R010_ueqv_R010YNN_partial_12_0133,
  rs_R010_ueqv_R010YNN_partial_12_0134,
  rs_R010_ueqv_R010YNN_partial_12_0135,
  rs_R010_ueqv_R010YNN_partial_12_0136,
  rs_R010_ueqv_R010YNN_partial_12_0137,
  rs_R010_ueqv_R010YNN_partial_12_0138,
  rs_R010_ueqv_R010YNN_partial_12_0139,
  rs_R010_ueqv_R010YNN_partial_12_0140,
  rs_R010_ueqv_R010YNN_partial_12_0141,
  rs_R010_ueqv_R010YNN_partial_12_0142,
  rs_R010_ueqv_R010YNN_partial_12_0143,
  rs_R010_ueqv_R010YNN_partial_12_0144,
  rs_R010_ueqv_R010YNN_partial_12_0145,
  rs_R010_ueqv_R010YNN_partial_12_0146,
  rs_R010_ueqv_R010YNN_partial_12_0147,
  rs_R010_ueqv_R010YNN_partial_12_0148,
  rs_R010_ueqv_R010YNN_partial_12_0149,
  rs_R010_ueqv_R010YNN_partial_12_0150,
  rs_R010_ueqv_R010YNN_partial_12_0151,
  rs_R010_ueqv_R010YNN_partial_12_0152,
  rs_R010_ueqv_R010YNN_partial_12_0153,
  rs_R010_ueqv_R010YNN_partial_12_0154,
  rs_R010_ueqv_R010YNN_partial_12_0155,
  rs_R010_ueqv_R010YNN_partial_12_0156,
  rs_R010_ueqv_R010YNN_partial_12_0157,
  rs_R010_ueqv_R010YNN_partial_12_0158,
  rs_R010_ueqv_R010YNN_partial_12_0159,
  rs_R010_ueqv_R010YNN_partial_12_0160,
  rs_R010_ueqv_R010YNN_partial_12_0161,
  rs_R010_ueqv_R010YNN_partial_12_0162,
  rs_R010_ueqv_R010YNN_partial_12_0163,
  rs_R010_ueqv_R010YNN_partial_12_0164,
  rs_R010_ueqv_R010YNN_partial_12_0165,
  rs_R010_ueqv_R010YNN_partial_12_0166,
  rs_R010_ueqv_R010YNN_partial_12_0167,
  rs_R010_ueqv_R010YNN_partial_12_0168,
  rs_R010_ueqv_R010YNN_partial_12_0169,
  rs_R010_ueqv_R010YNN_partial_12_0170,
  rs_R010_ueqv_R010YNN_partial_12_0171,
  rs_R010_ueqv_R010YNN_partial_12_0172,
  rs_R010_ueqv_R010YNN_partial_12_0173,
  rs_R010_ueqv_R010YNN_partial_12_0174,
  rs_R010_ueqv_R010YNN_partial_12_0175,
  rs_R010_ueqv_R010YNN_partial_12_0176,
  rs_R010_ueqv_R010YNN_partial_12_0177,
  rs_R010_ueqv_R010YNN_partial_12_0178,
  rs_R010_ueqv_R010YNN_partial_12_0179,
  rs_R010_ueqv_R010YNN_partial_12_0180,
  rs_R010_ueqv_R010YNN_partial_12_0181,
  rs_R010_ueqv_R010YNN_partial_12_0182,
  rs_R010_ueqv_R010YNN_partial_12_0183,
  rs_R010_ueqv_R010YNN_partial_12_0184,
  rs_R010_ueqv_R010YNN_partial_12_0185,
  rs_R010_ueqv_R010YNN_partial_12_0186,
  rs_R010_ueqv_R010YNN_partial_12_0187,
  rs_R010_ueqv_R010YNN_partial_12_0188,
  rs_R010_ueqv_R010YNN_partial_12_0189,
  rs_R010_ueqv_R010YNN_partial_12_0190,
  rs_R010_ueqv_R010YNN_partial_12_0191,
  rs_R010_ueqv_R010YNN_partial_12_0192,
  rs_R010_ueqv_R010YNN_partial_12_0193,
  rs_R010_ueqv_R010YNN_partial_12_0194,
  rs_R010_ueqv_R010YNN_partial_12_0195,
  rs_R010_ueqv_R010YNN_partial_12_0196,
  rs_R010_ueqv_R010YNN_partial_12_0197,
  rs_R010_ueqv_R010YNN_partial_12_0198,
  rs_R010_ueqv_R010YNN_partial_12_0199
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_12_0100_0199 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((906527399610261434368 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (13, 1), (16, 1)],
  term ((-16443216260964144640 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((6902620396042353664 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1694572729772558058112 : Rat) / 269491324728529755) [(1, 1), (2, 1), (5, 2), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(1, 1), (2, 1), (5, 2), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (12, 1), (13, 1), (16, 1)],
  term ((30352470281839815680 : Rat) / 53898264945705951) [(1, 1), (2, 1), (5, 2), (12, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(1, 1), (2, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(1, 1), (2, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (2, 1), (12, 1), (15, 1), (16, 1)],
  term ((906527399610261434368 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16443216260964144640 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (13, 1), (15, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (8, 1), (13, 2), (16, 1)],
  term ((6902620396042353664 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1694572729772558058112 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (3, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1902887332950016000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1090336610156299902976 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (3, 1), (5, 2), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((30352470281839815680 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (13, 1), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (3, 1), (5, 2), (13, 2), (16, 1)],
  term ((-37650152062693068800 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (3, 1), (5, 3), (9, 2), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(1, 1), (3, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (3, 1), (13, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 2), (13, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(1, 1), (5, 2), (8, 1), (13, 3), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3451310198021176832 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1725655099010588416 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(1, 1), (5, 2), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(1, 1), (5, 2), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(1, 1), (5, 2), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 2), (13, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (12, 2), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 1), (5, 2), (13, 3), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(1, 1), (5, 3), (9, 2), (13, 3), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (12, 2), (13, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (12, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(1, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(1, 1), (13, 3), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (2, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((-15176235140919907840 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (3, 1), (5, 1), (13, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(1, 2), (5, 1), (13, 3), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-101550138081280000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-501539731434885970048 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4572188843769774080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-8640747765166899200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-103234662752321952064 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term (-8 : Rat) [(2, 1), (4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (16 : Rat) [(2, 1), (4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-11779099177210697728 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((101550138081280000 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (15, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((501539731434885970048 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-4572188843769774080 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-14811927865666629632 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 2), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (12, 1), (13, 1), (16, 1)],
  term ((8640747765166899200 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 2), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((103234662752321952064 : Rat) / 269491324728529755) [(2, 1), (4, 1), (5, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((11779099177210697728 : Rat) / 53898264945705951) [(2, 1), (4, 1), (5, 3), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 3), (9, 2), (12, 1), (13, 1), (16, 1)],
  term ((14811927865666629632 : Rat) / 17966088315235317) [(2, 1), (4, 1), (5, 3), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-666415349705512960 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2526408031189360640 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1160800562204581504 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1531787043959603200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 3), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4456107764246118400 : Rat) / 53898264945705951) [(2, 1), (5, 1), (6, 1), (9, 3), (12, 1), (15, 2), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((4362857639094471872 : Rat) / 17966088315235317) [(2, 1), (5, 1), (6, 1), (11, 1), (12, 1), (15, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(2, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 3), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-262473904242278400 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (7, 1), (9, 2), (11, 2), (12, 1), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((12632040155946803200 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 4), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (11, 1), (12, 1), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(2, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 3), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-3471218487750451200 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (10, 1), (12, 1), (15, 2), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((4393243353106415360 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((57429116717129400320 : Rat) / 53898264945705951) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 3), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-225732769845452800 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (15, 2), (16, 1)],
  term ((867804621937612800 : Rat) / 5988696105078439) [(2, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (13, 1), (15, 3), (16, 1)],
  term ((2044980740434352270464 : Rat) / 4042369870927946325) [(2, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-101550138081280000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-501539731434885970048 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((4572188843769774080 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-8640747765166899200 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-103234662752321952064 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term (16 : Rat) [(3, 1), (4, 1), (5, 1), (13, 1), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (4, 1), (5, 1), (13, 2), (16, 1)],
  term ((-11779099177210697728 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((101550138081280000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((501539731434885970048 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (9, 1), (13, 2), (16, 1)],
  term ((-4572188843769774080 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-14811927865666629632 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (13, 1), (15, 2), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 2), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((8640747765166899200 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 2), (9, 3), (13, 2), (16, 1)],
  term ((103234662752321952064 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(3, 1), (4, 1), (5, 2), (11, 1), (13, 2), (16, 1)],
  term ((11779099177210697728 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(3, 1), (4, 1), (5, 3), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((14811927865666629632 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (13, 1), (15, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(3, 1), (4, 1), (5, 3), (9, 2), (13, 2), (16, 1)],
  term ((-666415349705512960 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((-1160800562204581504 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1531787043959603200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2526408031189360640 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (13, 1), (15, 3), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((4456107764246118400 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (13, 1), (15, 2), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(3, 1), (5, 1), (6, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((4362857639094471872 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 2), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(3, 1), (5, 1), (6, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-188812957189026867416 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 1), (16, 1)],
  term ((-1510503657512214939328 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 1), (15, 3), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(3, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-262473904242278400 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (7, 1), (9, 2), (11, 2), (13, 1), (16, 1)],
  term ((12632040155946803200 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 1), (15, 4), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (10, 1), (13, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (11, 1), (13, 1), (16, 1)],
  term ((-8405931269691146240 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (13, 1), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(3, 1), (5, 1), (7, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-3471218487750451200 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 1), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((4393243353106415360 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((57429116717129400320 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 1), (15, 3), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-893942535471193600 : Rat) / 53898264945705951) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-225732769845452800 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (15, 2), (16, 1)],
  term ((867804621937612800 : Rat) / 5988696105078439) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((2044980740434352270464 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3473811042885370880 : Rat) / 17966088315235317) [(3, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (15, 1), (16, 1)],
  term ((-50775069040640000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 2), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 3), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-250769865717442985024 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 3), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((2286094421884887040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 2), (11, 1), (13, 3), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((-3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 2), (13, 3), (15, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 2), (13, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-4320373882583449600 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 3), (13, 3), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-51617331376160976032 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 2), (11, 1), (13, 3), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-5889549588605348864 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 3), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (13, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-7405963932833314816 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((3702981966416657408 : Rat) / 17966088315235317) [(4, 1), (5, 3), (9, 2), (13, 3), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((333207674852756480 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((-166603837426378240 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((139253367632691200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((580400281102290752 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-290200140551145376 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((765893521979801600 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((-382946760989900800 : Rat) / 17966088315235317) [(5, 1), (6, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (12, 2), (15, 3), (16, 1)],
  term ((1263204015594680320 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 2), (15, 3), (16, 1)],
  term ((-631602007797340160 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 2), (13, 3), (15, 2), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (12, 2), (15, 2), (16, 1)],
  term ((-2228053882123059200 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 2), (15, 2), (16, 1)],
  term ((1114026941061529600 : Rat) / 53898264945705951) [(5, 1), (6, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (12, 2), (15, 2), (16, 1)],
  term ((-2181428819547235936 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 2), (15, 2), (16, 1)],
  term ((1090714409773617968 : Rat) / 17966088315235317) [(5, 1), (6, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((188812957189026867416 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (10, 1), (13, 3), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((94406478594513433708 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (12, 2), (15, 3), (16, 1)],
  term ((755251828756107469664 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 2), (15, 3), (16, 1)],
  term ((-377625914378053734832 : Rat) / 449152207880882925) [(5, 1), (7, 1), (9, 1), (13, 3), (15, 2), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((131236952121139200 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((-65618476060569600 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (12, 2), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(5, 1), (7, 1), (9, 2), (11, 2), (13, 2), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (12, 2), (15, 4), (16, 1)],
  term ((-6316020077973401600 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 2), (15, 4), (16, 1)],
  term ((3158010038986700800 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 2), (13, 3), (15, 3), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (10, 1), (13, 3), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (12, 2), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (11, 1), (13, 2), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (12, 2), (15, 3), (16, 1)],
  term ((4202965634845573120 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 2), (15, 3), (16, 1)],
  term ((-2101482817422786560 : Rat) / 17966088315235317) [(5, 1), (7, 1), (9, 3), (13, 3), (15, 2), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((1735609243875225600 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-867804621937612800 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (12, 2), (15, 2), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 2), (15, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (10, 1), (13, 3), (15, 1), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((446971267735596800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((-2196621676553207680 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 3), (16, 1)],
  term ((-2196621676553207680 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28714558358564700160 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 3), (16, 1)],
  term ((14357279179282350080 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (15, 2), (16, 1)],
  term ((446971267735596800 : Rat) / 53898264945705951) [(5, 1), (8, 1), (9, 1), (11, 1), (13, 3), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (15, 2), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((112866384922726400 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (15, 2), (16, 1)],
  term ((-433902310968806400 : Rat) / 5988696105078439) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-56433192461363200 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (12, 2), (13, 1), (15, 3), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-1022490370217176135232 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((511245185108588067616 : Rat) / 4042369870927946325) [(5, 1), (8, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((1736905521442685440 : Rat) / 17966088315235317) [(5, 1), (8, 1), (9, 1), (13, 3), (15, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 12, terms 100 through 199. -/
theorem rs_R010_ueqv_R010YNN_block_12_0100_0199_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_12_0100_0199
      rs_R010_ueqv_R010YNN_block_12_0100_0199 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
