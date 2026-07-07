/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R009:u=v:R009YNNNN, term block 4:200-299

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R009UeqvR009YNNNNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R009:u=v:R009YNNNN`. -/
def rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 : Poly :=
[
  term (-2 : Rat) [(4, 1)],
  term (1 : Rat) [(4, 2)],
  term (1 : Rat) [(5, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 200 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0200 : Poly :=
[
  term ((4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (15, 1)]
]

/-- Partial product 200 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0200 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 200 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0200_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0200
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0200 := by
  native_decide

/-- Coefficient term 201 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0201 : Poly :=
[
  term ((16865988261146 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1)]
]

/-- Partial product 201 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0201 : Poly :=
[
  term ((-33731976522292 : Rat) / 44404151967) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((16865988261146 : Rat) / 44404151967) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((16865988261146 : Rat) / 44404151967) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((33731976522292 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-16865988261146 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((-16865988261146 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 201 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0201_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0201
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0201 := by
  native_decide

/-- Coefficient term 202 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0202 : Poly :=
[
  term ((-119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1)]
]

/-- Partial product 202 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0202 : Poly :=
[
  term ((239616 : Rat) / 553) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-119808 : Rat) / 553) [(4, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-119808 : Rat) / 553) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-239616 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 202 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0202_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0202
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0202 := by
  native_decide

/-- Coefficient term 203 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0203 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 1)]
]

/-- Partial product 203 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0203 : Poly :=
[
  term ((941242657 : Rat) / 83270796) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 166541592) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 166541592) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 3)],
  term ((-941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 203 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0203_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0203
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0203 := by
  native_decide

/-- Coefficient term 204 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0204 : Poly :=
[
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 204 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0204 : Poly :=
[
  term ((725 : Rat) / 42) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-725 : Rat) / 42) [(6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 204 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0204_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0204
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0204 := by
  native_decide

/-- Coefficient term 205 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0205 : Poly :=
[
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (15, 1)]
]

/-- Partial product 205 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0205 : Poly :=
[
  term ((-223016262790904647 : Rat) / 156657848139576) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 205 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0205_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0205
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0205 := by
  native_decide

/-- Coefficient term 206 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0206 : Poly :=
[
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 206 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0206 : Poly :=
[
  term ((-314 : Rat) / 21) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((314 : Rat) / 21) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 206 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0206_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0206
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0206 := by
  native_decide

/-- Coefficient term 207 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0207 : Poly :=
[
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (13, 1)]
]

/-- Partial product 207 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0207 : Poly :=
[
  term ((-941242657 : Rat) / 83270796) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((941242657 : Rat) / 166541592) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 207 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0207_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0207
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0207 := by
  native_decide

/-- Coefficient term 208 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0208 : Poly :=
[
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 208 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0208 : Poly :=
[
  term ((-725 : Rat) / 42) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(4, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 84) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 208 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0208_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0208
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0208 := by
  native_decide

/-- Coefficient term 209 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0209 : Poly :=
[
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (15, 1)]
]

/-- Partial product 209 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0209 : Poly :=
[
  term ((223016262790904647 : Rat) / 156657848139576) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 209 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0209_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0209
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0209 := by
  native_decide

/-- Coefficient term 210 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0210 : Poly :=
[
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 210 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0210 : Poly :=
[
  term ((314 : Rat) / 21) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 210 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0210_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0210
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0210 := by
  native_decide

/-- Coefficient term 211 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0211 : Poly :=
[
  term ((230762620385813 : Rat) / 11604285047376) [(6, 1), (9, 2)]
]

/-- Partial product 211 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0211 : Poly :=
[
  term ((-230762620385813 : Rat) / 5802142523688) [(4, 1), (6, 1), (9, 2)],
  term ((230762620385813 : Rat) / 11604285047376) [(4, 2), (6, 1), (9, 2)],
  term ((230762620385813 : Rat) / 11604285047376) [(5, 2), (6, 1), (9, 2)],
  term ((230762620385813 : Rat) / 5802142523688) [(6, 1), (9, 2), (12, 1)],
  term ((-230762620385813 : Rat) / 11604285047376) [(6, 1), (9, 2), (12, 2)],
  term ((-230762620385813 : Rat) / 11604285047376) [(6, 1), (9, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 211 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0211_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0211
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0211 := by
  native_decide

/-- Coefficient term 212 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0212 : Poly :=
[
  term ((2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1)]
]

/-- Partial product 212 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0212 : Poly :=
[
  term ((-2172201733 : Rat) / 166541592) [(4, 1), (6, 1), (9, 2), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(4, 2), (6, 1), (9, 2), (12, 1)],
  term ((2172201733 : Rat) / 333083184) [(5, 2), (6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (13, 2)],
  term ((2172201733 : Rat) / 166541592) [(6, 1), (9, 2), (12, 2)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 212 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0212_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0212
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0212 := by
  native_decide

/-- Coefficient term 213 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0213 : Poly :=
[
  term ((-1532199782809 : Rat) / 138146250564) [(6, 1), (10, 1)]
]

/-- Partial product 213 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0213 : Poly :=
[
  term ((1532199782809 : Rat) / 69073125282) [(4, 1), (6, 1), (10, 1)],
  term ((-1532199782809 : Rat) / 138146250564) [(4, 2), (6, 1), (10, 1)],
  term ((-1532199782809 : Rat) / 138146250564) [(5, 2), (6, 1), (10, 1)],
  term ((-1532199782809 : Rat) / 69073125282) [(6, 1), (10, 1), (12, 1)],
  term ((1532199782809 : Rat) / 138146250564) [(6, 1), (10, 1), (12, 2)],
  term ((1532199782809 : Rat) / 138146250564) [(6, 1), (10, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 213 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0213_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0213
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0213 := by
  native_decide

/-- Coefficient term 214 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0214 : Poly :=
[
  term ((1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (14, 1)]
]

/-- Partial product 214 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0214 : Poly :=
[
  term ((-1005180329591 : Rat) / 14801383989) [(4, 1), (6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(4, 2), (6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(5, 2), (6, 1), (10, 1), (14, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (12, 1), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (12, 2), (14, 1)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 214 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0214_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0214
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0214 := by
  native_decide

/-- Coefficient term 215 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0215 : Poly :=
[
  term ((-353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (15, 1)]
]

/-- Partial product 215 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0215 : Poly :=
[
  term ((706121836024930 : Rat) / 6527410339149) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(4, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 215 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0215_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0215
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0215 := by
  native_decide

/-- Coefficient term 216 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0216 : Poly :=
[
  term ((-1350 : Rat) / 7) [(6, 1), (11, 1), (13, 1)]
]

/-- Partial product 216 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0216 : Poly :=
[
  term ((2700 : Rat) / 7) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1350 : Rat) / 7) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((-1350 : Rat) / 7) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((-2700 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((1350 : Rat) / 7) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((1350 : Rat) / 7) [(6, 1), (11, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 216 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0216_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0216
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0216 := by
  native_decide

/-- Coefficient term 217 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0217 : Poly :=
[
  term ((1180641476782151 : Rat) / 26109641356596) [(6, 1), (11, 1), (15, 1)]
]

/-- Partial product 217 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0217 : Poly :=
[
  term ((-1180641476782151 : Rat) / 13054820678298) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((1180641476782151 : Rat) / 26109641356596) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((1180641476782151 : Rat) / 26109641356596) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((1180641476782151 : Rat) / 13054820678298) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1180641476782151 : Rat) / 26109641356596) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((-1180641476782151 : Rat) / 26109641356596) [(6, 1), (11, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 217 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0217_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0217
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0217 := by
  native_decide

/-- Coefficient term 218 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0218 : Poly :=
[
  term ((-2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 1), (15, 1)]
]

/-- Partial product 218 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0218 : Poly :=
[
  term ((2224986028928059 : Rat) / 1598549470812) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 3), (15, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 3), (13, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 218 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0218_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0218
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0218 := by
  native_decide

/-- Coefficient term 219 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0219 : Poly :=
[
  term ((1495 : Rat) / 252) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 219 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0219 : Poly :=
[
  term ((-1495 : Rat) / 126) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 219 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0219_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0219
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0219 := by
  native_decide

/-- Coefficient term 220 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0220 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)]
]

/-- Partial product 220 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0220 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(4, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(5, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-3064399565618 : Rat) / 26861770943) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 3), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 220 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0220_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0220
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0220 := by
  native_decide

/-- Coefficient term 221 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0221 : Poly :=
[
  term ((140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (15, 2)]
]

/-- Partial product 221 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0221 : Poly :=
[
  term ((-140138745041977 : Rat) / 165250894662) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(4, 2), (6, 1), (12, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(5, 2), (6, 1), (12, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((140138745041977 : Rat) / 165250894662) [(6, 1), (12, 2), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 221 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0221_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0221
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0221 := by
  native_decide

/-- Coefficient term 222 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0222 : Poly :=
[
  term ((-247 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)]
]

/-- Partial product 222 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0222 : Poly :=
[
  term ((494 : Rat) / 63) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(4, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((-494 : Rat) / 63) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(6, 1), (12, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 222 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0222_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0222
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0222 := by
  native_decide

/-- Coefficient term 223 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0223 : Poly :=
[
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (13, 1), (14, 1), (15, 1)]
]

/-- Partial product 223 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0223 : Poly :=
[
  term ((-28425155928161 : Rat) / 241755938487) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((28425155928161 : Rat) / 483511876974) [(4, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((28425155928161 : Rat) / 483511876974) [(5, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((28425155928161 : Rat) / 241755938487) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((-28425155928161 : Rat) / 483511876974) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-28425155928161 : Rat) / 483511876974) [(6, 1), (13, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 223 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0223_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0223
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0223 := by
  native_decide

/-- Coefficient term 224 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0224 : Poly :=
[
  term ((49287085518873383 : Rat) / 78328924069788) [(6, 1), (13, 1), (15, 1)]
]

/-- Partial product 224 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0224 : Poly :=
[
  term ((-49287085518873383 : Rat) / 39164462034894) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((49287085518873383 : Rat) / 78328924069788) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((49287085518873383 : Rat) / 78328924069788) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((49287085518873383 : Rat) / 39164462034894) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-49287085518873383 : Rat) / 78328924069788) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((-49287085518873383 : Rat) / 78328924069788) [(6, 1), (13, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 224 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0224_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0224
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0224 := by
  native_decide

/-- Coefficient term 225 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0225 : Poly :=
[
  term ((-1495 : Rat) / 252) [(6, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 225 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0225 : Poly :=
[
  term ((1495 : Rat) / 126) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(6, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 225 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0225_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0225
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0225 := by
  native_decide

/-- Coefficient term 226 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0226 : Poly :=
[
  term ((-2939176196150779 : Rat) / 5802142523688) [(6, 1), (14, 1)]
]

/-- Partial product 226 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0226 : Poly :=
[
  term ((2939176196150779 : Rat) / 2901071261844) [(4, 1), (6, 1), (14, 1)],
  term ((-2939176196150779 : Rat) / 5802142523688) [(4, 2), (6, 1), (14, 1)],
  term ((-2939176196150779 : Rat) / 5802142523688) [(5, 2), (6, 1), (14, 1)],
  term ((-2939176196150779 : Rat) / 2901071261844) [(6, 1), (12, 1), (14, 1)],
  term ((2939176196150779 : Rat) / 5802142523688) [(6, 1), (12, 2), (14, 1)],
  term ((2939176196150779 : Rat) / 5802142523688) [(6, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 226 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0226_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0226
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0226 := by
  native_decide

/-- Coefficient term 227 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0227 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (14, 1), (15, 2)]
]

/-- Partial product 227 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0227 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 2), (6, 1), (14, 1), (15, 2)],
  term ((1532199782809 : Rat) / 26861770943) [(5, 2), (6, 1), (14, 1), (15, 2)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (13, 2), (14, 1), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 227 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0227_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0227
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0227 := by
  native_decide

/-- Coefficient term 228 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0228 : Poly :=
[
  term ((28425155928161 : Rat) / 967023753948) [(6, 1), (14, 2)]
]

/-- Partial product 228 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0228 : Poly :=
[
  term ((-28425155928161 : Rat) / 483511876974) [(4, 1), (6, 1), (14, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(4, 2), (6, 1), (14, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(5, 2), (6, 1), (14, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (12, 1), (14, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (12, 2), (14, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 228 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0228_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0228
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0228 := by
  native_decide

/-- Coefficient term 229 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0229 : Poly :=
[
  term ((-3899691024410935 : Rat) / 6527410339149) [(6, 1), (15, 2)]
]

/-- Partial product 229 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0229 : Poly :=
[
  term ((7799382048821870 : Rat) / 6527410339149) [(4, 1), (6, 1), (15, 2)],
  term ((-3899691024410935 : Rat) / 6527410339149) [(4, 2), (6, 1), (15, 2)],
  term ((-3899691024410935 : Rat) / 6527410339149) [(5, 2), (6, 1), (15, 2)],
  term ((-7799382048821870 : Rat) / 6527410339149) [(6, 1), (12, 1), (15, 2)],
  term ((3899691024410935 : Rat) / 6527410339149) [(6, 1), (12, 2), (15, 2)],
  term ((3899691024410935 : Rat) / 6527410339149) [(6, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 229 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0229_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0229
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0229 := by
  native_decide

/-- Coefficient term 230 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0230 : Poly :=
[
  term ((247 : Rat) / 63) [(6, 1), (15, 2), (16, 1)]
]

/-- Partial product 230 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0230 : Poly :=
[
  term ((-494 : Rat) / 63) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((247 : Rat) / 63) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((494 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((-247 : Rat) / 63) [(6, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 230 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0230_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0230
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0230 := by
  native_decide

/-- Coefficient term 231 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0231 : Poly :=
[
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1)]
]

/-- Partial product 231 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0231 : Poly :=
[
  term ((3849005354029 : Rat) / 1289365005264) [(4, 1), (7, 1), (9, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(4, 2), (7, 1), (9, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(5, 2), (7, 1), (9, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 2)],
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 231 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0231_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0231
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0231 := by
  native_decide

/-- Coefficient term 232 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0232 : Poly :=
[
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1)]
]

/-- Partial product 232 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0232 : Poly :=
[
  term ((-3849005354029 : Rat) / 1289365005264) [(4, 1), (7, 1), (9, 1), (12, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1), (13, 2)],
  term ((3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 2)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 232 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0232_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0232
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0232 := by
  native_decide

/-- Coefficient term 233 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0233 : Poly :=
[
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (14, 1)]
]

/-- Partial product 233 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0233 : Poly :=
[
  term ((53777198303881 : Rat) / 40469606856) [(4, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(4, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 233 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0233_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0233
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0233 := by
  native_decide

/-- Coefficient term 234 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0234 : Poly :=
[
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (14, 1)]
]

/-- Partial product 234 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0234 : Poly :=
[
  term ((-53777198303881 : Rat) / 40469606856) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 234 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0234_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0234
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0234 := by
  native_decide

/-- Coefficient term 235 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0235 : Poly :=
[
  term ((-169986160160725 : Rat) / 1243316255076) [(7, 1), (11, 1)]
]

/-- Partial product 235 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0235 : Poly :=
[
  term ((169986160160725 : Rat) / 621658127538) [(4, 1), (7, 1), (11, 1)],
  term ((-169986160160725 : Rat) / 1243316255076) [(4, 2), (7, 1), (11, 1)],
  term ((-169986160160725 : Rat) / 1243316255076) [(5, 2), (7, 1), (11, 1)],
  term ((-169986160160725 : Rat) / 621658127538) [(7, 1), (11, 1), (12, 1)],
  term ((169986160160725 : Rat) / 1243316255076) [(7, 1), (11, 1), (12, 2)],
  term ((169986160160725 : Rat) / 1243316255076) [(7, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 235 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0235_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0235
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0235 := by
  native_decide

/-- Coefficient term 236 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0236 : Poly :=
[
  term ((166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1)]
]

/-- Partial product 236 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0236 : Poly :=
[
  term ((-333108 : Rat) / 553) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((166554 : Rat) / 553) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((166554 : Rat) / 553) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((333108 : Rat) / 553) [(7, 1), (11, 1), (12, 2)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 236 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0236_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0236
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0236 := by
  native_decide

/-- Coefficient term 237 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0237 : Poly :=
[
  term ((353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (14, 1)]
]

/-- Partial product 237 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0237 : Poly :=
[
  term ((-706121836024930 : Rat) / 6527410339149) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(4, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 237 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0237_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0237
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0237 := by
  native_decide

/-- Coefficient term 238 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0238 : Poly :=
[
  term ((-294072426082889 : Rat) / 26109641356596) [(7, 1), (11, 1), (14, 1)]
]

/-- Partial product 238 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0238 : Poly :=
[
  term ((294072426082889 : Rat) / 13054820678298) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-294072426082889 : Rat) / 26109641356596) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((-294072426082889 : Rat) / 26109641356596) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((-294072426082889 : Rat) / 13054820678298) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((294072426082889 : Rat) / 26109641356596) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((294072426082889 : Rat) / 26109641356596) [(7, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 238 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0238_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0238
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0238 := by
  native_decide

/-- Coefficient term 239 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0239 : Poly :=
[
  term ((941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 1)]
]

/-- Partial product 239 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0239 : Poly :=
[
  term ((-941242657 : Rat) / 166541592) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 333083184) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((941242657 : Rat) / 333083184) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 3)],
  term ((941242657 : Rat) / 166541592) [(7, 1), (12, 2), (13, 1)],
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 239 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0239_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0239
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0239 := by
  native_decide

/-- Coefficient term 240 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0240 : Poly :=
[
  term ((2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 1), (14, 1)]
]

/-- Partial product 240 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0240 : Poly :=
[
  term ((-2224986028928059 : Rat) / 1598549470812) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 3), (14, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 3), (13, 1), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 240 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0240_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0240
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0240 := by
  native_decide

/-- Coefficient term 241 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0241 : Poly :=
[
  term ((-1495 : Rat) / 252) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 241 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0241 : Poly :=
[
  term ((1495 : Rat) / 126) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 126) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 241 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0241_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0241
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0241 := by
  native_decide

/-- Coefficient term 242 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0242 : Poly :=
[
  term ((725 : Rat) / 168) [(7, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 242 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0242 : Poly :=
[
  term ((-725 : Rat) / 84) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 168) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 168) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((725 : Rat) / 84) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 242 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0242_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0242
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0242 := by
  native_decide

/-- Coefficient term 243 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0243 : Poly :=
[
  term ((-150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 243 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0243 : Poly :=
[
  term ((150142660556857 : Rat) / 165250894662) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-150142660556857 : Rat) / 165250894662) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 243 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0243_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0243
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0243 := by
  native_decide

/-- Coefficient term 244 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0244 : Poly :=
[
  term ((247 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 244 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0244 : Poly :=
[
  term ((-494 : Rat) / 63) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((494 : Rat) / 63) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 244 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0244_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0244
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0244 := by
  native_decide

/-- Coefficient term 245 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0245 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 1)]
]

/-- Partial product 245 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0245 : Poly :=
[
  term ((-3064399565618 : Rat) / 26861770943) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(5, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 3), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 245 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0245_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0245
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0245 := by
  native_decide

/-- Coefficient term 246 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0246 : Poly :=
[
  term ((-148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (15, 1)]
]

/-- Partial product 246 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0246 : Poly :=
[
  term ((148780745730977 : Rat) / 2901071261844) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 2901071261844) [(7, 1), (12, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 246 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0246_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0246
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0246 := by
  native_decide

/-- Coefficient term 247 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0247 : Poly :=
[
  term ((-157 : Rat) / 42) [(7, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 247 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0247 : Poly :=
[
  term ((157 : Rat) / 21) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 21) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(7, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 247 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0247_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0247
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0247 := by
  native_decide

/-- Coefficient term 248 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0248 : Poly :=
[
  term ((-2235983296955 : Rat) / 429788335088) [(7, 1), (13, 1)]
]

/-- Partial product 248 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0248 : Poly :=
[
  term ((2235983296955 : Rat) / 214894167544) [(4, 1), (7, 1), (13, 1)],
  term ((-2235983296955 : Rat) / 429788335088) [(4, 2), (7, 1), (13, 1)],
  term ((-2235983296955 : Rat) / 429788335088) [(5, 2), (7, 1), (13, 1)],
  term ((-2235983296955 : Rat) / 214894167544) [(7, 1), (12, 1), (13, 1)],
  term ((2235983296955 : Rat) / 429788335088) [(7, 1), (12, 2), (13, 1)],
  term ((2235983296955 : Rat) / 429788335088) [(7, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 248 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0248_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0248
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0248 := by
  native_decide

/-- Coefficient term 249 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0249 : Poly :=
[
  term ((-98268272942155711 : Rat) / 156657848139576) [(7, 1), (13, 1), (14, 1)]
]

/-- Partial product 249 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0249 : Poly :=
[
  term ((98268272942155711 : Rat) / 78328924069788) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-98268272942155711 : Rat) / 156657848139576) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((-98268272942155711 : Rat) / 156657848139576) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((-98268272942155711 : Rat) / 78328924069788) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((98268272942155711 : Rat) / 156657848139576) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((98268272942155711 : Rat) / 156657848139576) [(7, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 249 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0249_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0249
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0249 := by
  native_decide

/-- Coefficient term 250 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0250 : Poly :=
[
  term ((1495 : Rat) / 252) [(7, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 250 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0250 : Poly :=
[
  term ((-1495 : Rat) / 126) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 252) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 250 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0250_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0250
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0250 := by
  native_decide

/-- Coefficient term 251 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0251 : Poly :=
[
  term ((-1532199782809 : Rat) / 53723541886) [(7, 1), (13, 1), (14, 2)]
]

/-- Partial product 251 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0251 : Poly :=
[
  term ((1532199782809 : Rat) / 26861770943) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(4, 2), (7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 53723541886) [(5, 2), (7, 1), (13, 1), (14, 2)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 251 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0251_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0251
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0251 := by
  native_decide

/-- Coefficient term 252 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0252 : Poly :=
[
  term ((-725 : Rat) / 168) [(7, 1), (13, 1), (16, 1)]
]

/-- Partial product 252 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0252 : Poly :=
[
  term ((725 : Rat) / 84) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((725 : Rat) / 168) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((725 : Rat) / 168) [(7, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 252 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0252_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0252
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0252 := by
  native_decide

/-- Coefficient term 253 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0253 : Poly :=
[
  term ((2225133426004081 : Rat) / 3729948765228) [(7, 1), (14, 1), (15, 1)]
]

/-- Partial product 253 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0253 : Poly :=
[
  term ((-2225133426004081 : Rat) / 1864974382614) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((2225133426004081 : Rat) / 3729948765228) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((2225133426004081 : Rat) / 3729948765228) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((2225133426004081 : Rat) / 1864974382614) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2225133426004081 : Rat) / 3729948765228) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2225133426004081 : Rat) / 3729948765228) [(7, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 253 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0253_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0253
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0253 := by
  native_decide

/-- Coefficient term 254 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0254 : Poly :=
[
  term ((-247 : Rat) / 63) [(7, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 254 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0254 : Poly :=
[
  term ((494 : Rat) / 63) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-247 : Rat) / 63) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((247 : Rat) / 63) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 254 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0254_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0254
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0254 := by
  native_decide

/-- Coefficient term 255 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0255 : Poly :=
[
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (14, 2), (15, 1)]
]

/-- Partial product 255 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0255 : Poly :=
[
  term ((3064399565618 : Rat) / 26861770943) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(4, 2), (7, 1), (14, 2), (15, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(5, 2), (7, 1), (14, 2), (15, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 255 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0255_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0255
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0255 := by
  native_decide

/-- Coefficient term 256 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0256 : Poly :=
[
  term ((162945382702117 : Rat) / 5802142523688) [(7, 1), (15, 1)]
]

/-- Partial product 256 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0256 : Poly :=
[
  term ((-162945382702117 : Rat) / 2901071261844) [(4, 1), (7, 1), (15, 1)],
  term ((162945382702117 : Rat) / 5802142523688) [(4, 2), (7, 1), (15, 1)],
  term ((162945382702117 : Rat) / 5802142523688) [(5, 2), (7, 1), (15, 1)],
  term ((162945382702117 : Rat) / 2901071261844) [(7, 1), (12, 1), (15, 1)],
  term ((-162945382702117 : Rat) / 5802142523688) [(7, 1), (12, 2), (15, 1)],
  term ((-162945382702117 : Rat) / 5802142523688) [(7, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 256 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0256_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0256
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0256 := by
  native_decide

/-- Coefficient term 257 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0257 : Poly :=
[
  term ((157 : Rat) / 42) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 257 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0257 : Poly :=
[
  term ((-157 : Rat) / 21) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 42) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((157 : Rat) / 21) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-157 : Rat) / 42) [(7, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 257 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0257_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0257
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0257 := by
  native_decide

/-- Coefficient term 258 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0258 : Poly :=
[
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2)]
]

/-- Partial product 258 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0258 : Poly :=
[
  term ((1532199782809 : Rat) / 161170625658) [(4, 1), (7, 2)],
  term ((-1532199782809 : Rat) / 322341251316) [(4, 2), (7, 2)],
  term ((-1532199782809 : Rat) / 322341251316) [(5, 2), (7, 2)],
  term ((-1532199782809 : Rat) / 161170625658) [(7, 2), (12, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (12, 2)],
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 258 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0258_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0258
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0258 := by
  native_decide

/-- Coefficient term 259 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0259 : Poly :=
[
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1)]
]

/-- Partial product 259 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0259 : Poly :=
[
  term ((-1532199782809 : Rat) / 161170625658) [(4, 1), (7, 2), (12, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(4, 2), (7, 2), (12, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(5, 2), (7, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1), (13, 2)],
  term ((1532199782809 : Rat) / 161170625658) [(7, 2), (12, 2)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 259 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0259_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0259
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0259 := by
  native_decide

/-- Coefficient term 260 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0260 : Poly :=
[
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (14, 1)]
]

/-- Partial product 260 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0260 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(4, 1), (7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(4, 2), (7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(5, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (13, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 260 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0260_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0260
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0260 := by
  native_decide

/-- Coefficient term 261 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0261 : Poly :=
[
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (14, 1)]
]

/-- Partial product 261 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0261 : Poly :=
[
  term ((4349915183394751 : Rat) / 6527410339149) [(4, 1), (7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(4, 2), (7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(5, 2), (7, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 2), (14, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 261 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0261_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0261
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0261 := by
  native_decide

/-- Coefficient term 262 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0262 : Poly :=
[
  term ((-2496 : Rat) / 79) [(9, 1), (10, 1), (11, 1)]
]

/-- Partial product 262 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0262 : Poly :=
[
  term ((4992 : Rat) / 79) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-2496 : Rat) / 79) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term ((-2496 : Rat) / 79) [(5, 2), (9, 1), (10, 1), (11, 1)],
  term ((-4992 : Rat) / 79) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((2496 : Rat) / 79) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((2496 : Rat) / 79) [(9, 1), (10, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 262 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0262_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0262
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0262 := by
  native_decide

/-- Coefficient term 263 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0263 : Poly :=
[
  term ((4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1)]
]

/-- Partial product 263 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0263 : Poly :=
[
  term ((-9984 : Rat) / 553) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((4992 : Rat) / 553) [(4, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((4992 : Rat) / 553) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((9984 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 263 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0263_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0263
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0263 := by
  native_decide

/-- Coefficient term 264 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0264 : Poly :=
[
  term ((29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (14, 1)]
]

/-- Partial product 264 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0264 : Poly :=
[
  term ((-59904 : Rat) / 553) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((29952 : Rat) / 553) [(4, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((29952 : Rat) / 553) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 264 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0264_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0264
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0264 := by
  native_decide

/-- Coefficient term 265 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0265 : Poly :=
[
  term ((-6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 1)]
]

/-- Partial product 265 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0265 : Poly :=
[
  term ((6090608323475 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 3)],
  term ((-6090608323475 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 265 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0265_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0265
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0265 := by
  native_decide

/-- Coefficient term 266 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0266 : Poly :=
[
  term ((5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 266 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0266 : Poly :=
[
  term ((-5 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 6) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((5 : Rat) / 6) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((5 : Rat) / 3) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 266 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0266_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0266
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0266 := by
  native_decide

/-- Coefficient term 267 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0267 : Poly :=
[
  term ((30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (15, 1)]
]

/-- Partial product 267 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0267 : Poly :=
[
  term ((-30188368622915 : Rat) / 177616607868) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((30188368622915 : Rat) / 177616607868) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 267 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0267_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0267
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0267 := by
  native_decide

/-- Coefficient term 268 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0268 : Poly :=
[
  term ((-16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 268 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0268 : Poly :=
[
  term ((32 : Rat) / 21) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-16 : Rat) / 21) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 21) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 268 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0268_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0268
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0268 := by
  native_decide

/-- Coefficient term 269 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0269 : Poly :=
[
  term ((-194243309063 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 1)]
]

/-- Partial product 269 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0269 : Poly :=
[
  term ((194243309063 : Rat) / 133212455901) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-194243309063 : Rat) / 266424911802) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((-194243309063 : Rat) / 266424911802) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((-194243309063 : Rat) / 133212455901) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((194243309063 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((194243309063 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 269 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0269_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0269
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0269 := by
  native_decide

/-- Coefficient term 270 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0270 : Poly :=
[
  term ((8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 1), (14, 1)]
]

/-- Partial product 270 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0270 : Poly :=
[
  term ((-8926828802611 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 270 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0270_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0270
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0270 := by
  native_decide

/-- Coefficient term 271 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0271 : Poly :=
[
  term ((55 : Rat) / 28) [(9, 1), (10, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 271 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0271 : Poly :=
[
  term ((-55 : Rat) / 14) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 28) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 28) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((55 : Rat) / 14) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 271 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0271_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0271
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0271 := by
  native_decide

/-- Coefficient term 272 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0272 : Poly :=
[
  term ((-235 : Rat) / 168) [(9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 272 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0272 : Poly :=
[
  term ((235 : Rat) / 84) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-235 : Rat) / 168) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-235 : Rat) / 168) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-235 : Rat) / 84) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((235 : Rat) / 168) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((235 : Rat) / 168) [(9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 272 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0272_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0272
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0272 := by
  native_decide

/-- Coefficient term 273 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0273 : Poly :=
[
  term ((-170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (14, 1), (15, 1)]
]

/-- Partial product 273 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0273 : Poly :=
[
  term ((170525183774905 : Rat) / 355233215736) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 273 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0273_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0273
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0273 := by
  native_decide

/-- Coefficient term 274 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0274 : Poly :=
[
  term ((-11 : Rat) / 7) [(9, 1), (10, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 274 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0274 : Poly :=
[
  term ((22 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-11 : Rat) / 7) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-22 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 274 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0274_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0274
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0274 := by
  native_decide

/-- Coefficient term 275 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0275 : Poly :=
[
  term ((12691597676045 : Rat) / 473644287648) [(9, 1), (10, 1), (15, 1)]
]

/-- Partial product 275 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0275 : Poly :=
[
  term ((-12691597676045 : Rat) / 236822143824) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((12691597676045 : Rat) / 473644287648) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((12691597676045 : Rat) / 473644287648) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((12691597676045 : Rat) / 236822143824) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-12691597676045 : Rat) / 473644287648) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-12691597676045 : Rat) / 473644287648) [(9, 1), (10, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 275 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0275_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0275
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0275 := by
  native_decide

/-- Coefficient term 276 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0276 : Poly :=
[
  term ((7 : Rat) / 6) [(9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 276 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0276 : Poly :=
[
  term ((-7 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 6) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 6) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((7 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-7 : Rat) / 6) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 276 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0276_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0276
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0276 := by
  native_decide

/-- Coefficient term 277 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0277 : Poly :=
[
  term ((-62726157394913 : Rat) / 8525597177664) [(9, 1), (11, 1)]
]

/-- Partial product 277 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0277 : Poly :=
[
  term ((62726157394913 : Rat) / 4262798588832) [(4, 1), (9, 1), (11, 1)],
  term ((-62726157394913 : Rat) / 8525597177664) [(4, 2), (9, 1), (11, 1)],
  term ((-62726157394913 : Rat) / 8525597177664) [(5, 2), (9, 1), (11, 1)],
  term ((-62726157394913 : Rat) / 4262798588832) [(9, 1), (11, 1), (12, 1)],
  term ((62726157394913 : Rat) / 8525597177664) [(9, 1), (11, 1), (12, 2)],
  term ((62726157394913 : Rat) / 8525597177664) [(9, 1), (11, 1), (13, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 277 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0277_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0277
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0277 := by
  native_decide

/-- Coefficient term 278 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0278 : Poly :=
[
  term ((-16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1)]
]

/-- Partial product 278 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0278 : Poly :=
[
  term ((33225805736000 : Rat) / 133212455901) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-33225805736000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 2)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 278 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0278_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0278
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0278 := by
  native_decide

/-- Coefficient term 279 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0279 : Poly :=
[
  term ((-492931248330727 : Rat) / 2131399294416) [(9, 1), (11, 1), (14, 1)]
]

/-- Partial product 279 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0279 : Poly :=
[
  term ((492931248330727 : Rat) / 1065699647208) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-492931248330727 : Rat) / 2131399294416) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((-492931248330727 : Rat) / 2131399294416) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((-492931248330727 : Rat) / 1065699647208) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((492931248330727 : Rat) / 2131399294416) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((492931248330727 : Rat) / 2131399294416) [(9, 1), (11, 1), (13, 2), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 279 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0279_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0279
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0279 := by
  native_decide

/-- Coefficient term 280 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0280 : Poly :=
[
  term ((59904 : Rat) / 553) [(9, 1), (11, 1), (14, 2)]
]

/-- Partial product 280 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0280 : Poly :=
[
  term ((-119808 : Rat) / 553) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(4, 2), (9, 1), (11, 1), (14, 2)],
  term ((59904 : Rat) / 553) [(5, 2), (9, 1), (11, 1), (14, 2)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (12, 2), (14, 2)],
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (13, 2), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 280 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0280_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0280
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0280 := by
  native_decide

/-- Coefficient term 281 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0281 : Poly :=
[
  term ((9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (15, 2)]
]

/-- Partial product 281 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0281 : Poly :=
[
  term ((-9008294618453 : Rat) / 118411071912) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (13, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 281 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0281_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0281
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0281 := by
  native_decide

/-- Coefficient term 282 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0282 : Poly :=
[
  term ((97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 1)]
]

/-- Partial product 282 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0282 : Poly :=
[
  term ((-97923607474811 : Rat) / 532849823604) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((97923607474811 : Rat) / 1065699647208) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 3)],
  term ((97923607474811 : Rat) / 532849823604) [(9, 1), (12, 2), (13, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 3), (13, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 282 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0282_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0282
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0282 := by
  native_decide

/-- Coefficient term 283 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0283 : Poly :=
[
  term ((-475 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)]
]

/-- Partial product 283 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0283 : Poly :=
[
  term ((475 : Rat) / 42) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-475 : Rat) / 84) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-475 : Rat) / 84) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((475 : Rat) / 84) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-475 : Rat) / 42) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((475 : Rat) / 84) [(9, 1), (12, 3), (13, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 283 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0283_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0283
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0283 := by
  native_decide

/-- Coefficient term 284 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0284 : Poly :=
[
  term ((2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (14, 1), (15, 1)]
]

/-- Partial product 284 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0284 : Poly :=
[
  term ((-2172201733 : Rat) / 333083184) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 666166368) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 666166368) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((2172201733 : Rat) / 333083184) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 3), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 284 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0284_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0284
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0284 := by
  native_decide

/-- Coefficient term 285 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0285 : Poly :=
[
  term ((-10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (15, 1)]
]

/-- Partial product 285 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0285 : Poly :=
[
  term ((10110568816218515 : Rat) / 69625710284256) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-10110568816218515 : Rat) / 69625710284256) [(9, 1), (12, 2), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 3), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 285 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0285_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0285
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0285 := by
  native_decide

/-- Coefficient term 286 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0286 : Poly :=
[
  term ((32 : Rat) / 7) [(9, 1), (12, 1), (15, 1), (16, 1)]
]

/-- Partial product 286 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0286 : Poly :=
[
  term ((-64 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((32 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 286 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0286_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0286
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0286 := by
  native_decide

/-- Coefficient term 287 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0287 : Poly :=
[
  term ((430215797773249 : Rat) / 4262798588832) [(9, 1), (13, 1)]
]

/-- Partial product 287 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0287 : Poly :=
[
  term ((-430215797773249 : Rat) / 2131399294416) [(4, 1), (9, 1), (13, 1)],
  term ((430215797773249 : Rat) / 4262798588832) [(4, 2), (9, 1), (13, 1)],
  term ((430215797773249 : Rat) / 4262798588832) [(5, 2), (9, 1), (13, 1)],
  term ((430215797773249 : Rat) / 2131399294416) [(9, 1), (12, 1), (13, 1)],
  term ((-430215797773249 : Rat) / 4262798588832) [(9, 1), (12, 2), (13, 1)],
  term ((-430215797773249 : Rat) / 4262798588832) [(9, 1), (13, 3)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 287 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0287_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0287
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0287 := by
  native_decide

/-- Coefficient term 288 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0288 : Poly :=
[
  term ((-1435241433190279 : Rat) / 8525597177664) [(9, 1), (13, 1), (14, 1)]
]

/-- Partial product 288 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0288 : Poly :=
[
  term ((1435241433190279 : Rat) / 4262798588832) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((-1435241433190279 : Rat) / 8525597177664) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-1435241433190279 : Rat) / 8525597177664) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-1435241433190279 : Rat) / 4262798588832) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((1435241433190279 : Rat) / 8525597177664) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((1435241433190279 : Rat) / 8525597177664) [(9, 1), (13, 3), (14, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 288 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0288_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0288
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0288 := by
  native_decide

/-- Coefficient term 289 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0289 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 289 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0289 : Poly :=
[
  term ((65 : Rat) / 7) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 289 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0289_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0289
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0289 := by
  native_decide

/-- Coefficient term 290 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0290 : Poly :=
[
  term ((-6422908767787 : Rat) / 157881429216) [(9, 1), (13, 1), (14, 2)]
]

/-- Partial product 290 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0290 : Poly :=
[
  term ((6422908767787 : Rat) / 78940714608) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((-6422908767787 : Rat) / 157881429216) [(4, 2), (9, 1), (13, 1), (14, 2)],
  term ((-6422908767787 : Rat) / 157881429216) [(5, 2), (9, 1), (13, 1), (14, 2)],
  term ((-6422908767787 : Rat) / 78940714608) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (13, 3), (14, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 290 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0290_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0290
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0290 := by
  native_decide

/-- Coefficient term 291 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0291 : Poly :=
[
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (14, 2), (16, 1)]
]

/-- Partial product 291 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0291 : Poly :=
[
  term ((-305 : Rat) / 28) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 56) [(4, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 56) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 3), (14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 291 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0291_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0291
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0291 := by
  native_decide

/-- Coefficient term 292 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0292 : Poly :=
[
  term ((-2954048478533 : Rat) / 78940714608) [(9, 1), (13, 1), (15, 2)]
]

/-- Partial product 292 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0292 : Poly :=
[
  term ((2954048478533 : Rat) / 39470357304) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 78940714608) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 3), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 292 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0292_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0292
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0292 := by
  native_decide

/-- Coefficient term 293 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0293 : Poly :=
[
  term ((305 : Rat) / 56) [(9, 1), (13, 1), (15, 2), (16, 1)]
]

/-- Partial product 293 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0293 : Poly :=
[
  term ((-305 : Rat) / 28) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 56) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((305 : Rat) / 28) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 3), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 293 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0293_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0293
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0293 := by
  native_decide

/-- Coefficient term 294 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0294 : Poly :=
[
  term ((-335 : Rat) / 168) [(9, 1), (13, 1), (16, 1)]
]

/-- Partial product 294 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0294 : Poly :=
[
  term ((335 : Rat) / 84) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-335 : Rat) / 168) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((-335 : Rat) / 168) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((-335 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((335 : Rat) / 168) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((335 : Rat) / 168) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 294 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0294_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0294
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0294 := by
  native_decide

/-- Coefficient term 295 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0295 : Poly :=
[
  term ((167880819350441 : Rat) / 1420932862944) [(9, 1), (14, 1), (15, 1)]
]

/-- Partial product 295 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0295 : Poly :=
[
  term ((-167880819350441 : Rat) / 710466431472) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((167880819350441 : Rat) / 1420932862944) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((167880819350441 : Rat) / 1420932862944) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((167880819350441 : Rat) / 710466431472) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-167880819350441 : Rat) / 1420932862944) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-167880819350441 : Rat) / 1420932862944) [(9, 1), (13, 2), (14, 1), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 295 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0295_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0295
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0295 := by
  native_decide

/-- Coefficient term 296 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0296 : Poly :=
[
  term ((30 : Rat) / 7) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 296 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0296 : Poly :=
[
  term ((-60 : Rat) / 7) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((30 : Rat) / 7) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((60 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-30 : Rat) / 7) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 296 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0296_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0296
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0296 := by
  native_decide

/-- Coefficient term 297 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0297 : Poly :=
[
  term ((3366906314273 : Rat) / 59205535956) [(9, 1), (14, 2), (15, 1)]
]

/-- Partial product 297 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0297 : Poly :=
[
  term ((-3366906314273 : Rat) / 29602767978) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(4, 2), (9, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (13, 2), (14, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 297 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0297_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0297
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0297 := by
  native_decide

/-- Coefficient term 298 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0298 : Poly :=
[
  term ((-65 : Rat) / 14) [(9, 1), (14, 2), (15, 1), (16, 1)]
]

/-- Partial product 298 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0298 : Poly :=
[
  term ((65 : Rat) / 7) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(4, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 14) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((65 : Rat) / 14) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 298 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0298_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0298
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0298 := by
  native_decide

/-- Coefficient term 299 from coefficient polynomial 4. -/
def rs_R009_ueqv_R009YNNNN_coefficient_04_0299 : Poly :=
[
  term ((-5567064246745259 : Rat) / 139251420568512) [(9, 1), (15, 1)]
]

/-- Partial product 299 for generator 4. -/
def rs_R009_ueqv_R009YNNNN_partial_04_0299 : Poly :=
[
  term ((5567064246745259 : Rat) / 69625710284256) [(4, 1), (9, 1), (15, 1)],
  term ((-5567064246745259 : Rat) / 139251420568512) [(4, 2), (9, 1), (15, 1)],
  term ((-5567064246745259 : Rat) / 139251420568512) [(5, 2), (9, 1), (15, 1)],
  term ((-5567064246745259 : Rat) / 69625710284256) [(9, 1), (12, 1), (15, 1)],
  term ((5567064246745259 : Rat) / 139251420568512) [(9, 1), (12, 2), (15, 1)],
  term ((5567064246745259 : Rat) / 139251420568512) [(9, 1), (13, 2), (15, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 299 for generator 4. -/
theorem rs_R009_ueqv_R009YNNNN_partial_04_0299_valid :
    mulPoly rs_R009_ueqv_R009YNNNN_coefficient_04_0299
        rs_R009_ueqv_R009YNNNN_generator_04_0200_0299 =
      rs_R009_ueqv_R009YNNNN_partial_04_0299 := by
  native_decide

/-- Partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_partials_04_0200_0299 : List Poly :=
[
  rs_R009_ueqv_R009YNNNN_partial_04_0200,
  rs_R009_ueqv_R009YNNNN_partial_04_0201,
  rs_R009_ueqv_R009YNNNN_partial_04_0202,
  rs_R009_ueqv_R009YNNNN_partial_04_0203,
  rs_R009_ueqv_R009YNNNN_partial_04_0204,
  rs_R009_ueqv_R009YNNNN_partial_04_0205,
  rs_R009_ueqv_R009YNNNN_partial_04_0206,
  rs_R009_ueqv_R009YNNNN_partial_04_0207,
  rs_R009_ueqv_R009YNNNN_partial_04_0208,
  rs_R009_ueqv_R009YNNNN_partial_04_0209,
  rs_R009_ueqv_R009YNNNN_partial_04_0210,
  rs_R009_ueqv_R009YNNNN_partial_04_0211,
  rs_R009_ueqv_R009YNNNN_partial_04_0212,
  rs_R009_ueqv_R009YNNNN_partial_04_0213,
  rs_R009_ueqv_R009YNNNN_partial_04_0214,
  rs_R009_ueqv_R009YNNNN_partial_04_0215,
  rs_R009_ueqv_R009YNNNN_partial_04_0216,
  rs_R009_ueqv_R009YNNNN_partial_04_0217,
  rs_R009_ueqv_R009YNNNN_partial_04_0218,
  rs_R009_ueqv_R009YNNNN_partial_04_0219,
  rs_R009_ueqv_R009YNNNN_partial_04_0220,
  rs_R009_ueqv_R009YNNNN_partial_04_0221,
  rs_R009_ueqv_R009YNNNN_partial_04_0222,
  rs_R009_ueqv_R009YNNNN_partial_04_0223,
  rs_R009_ueqv_R009YNNNN_partial_04_0224,
  rs_R009_ueqv_R009YNNNN_partial_04_0225,
  rs_R009_ueqv_R009YNNNN_partial_04_0226,
  rs_R009_ueqv_R009YNNNN_partial_04_0227,
  rs_R009_ueqv_R009YNNNN_partial_04_0228,
  rs_R009_ueqv_R009YNNNN_partial_04_0229,
  rs_R009_ueqv_R009YNNNN_partial_04_0230,
  rs_R009_ueqv_R009YNNNN_partial_04_0231,
  rs_R009_ueqv_R009YNNNN_partial_04_0232,
  rs_R009_ueqv_R009YNNNN_partial_04_0233,
  rs_R009_ueqv_R009YNNNN_partial_04_0234,
  rs_R009_ueqv_R009YNNNN_partial_04_0235,
  rs_R009_ueqv_R009YNNNN_partial_04_0236,
  rs_R009_ueqv_R009YNNNN_partial_04_0237,
  rs_R009_ueqv_R009YNNNN_partial_04_0238,
  rs_R009_ueqv_R009YNNNN_partial_04_0239,
  rs_R009_ueqv_R009YNNNN_partial_04_0240,
  rs_R009_ueqv_R009YNNNN_partial_04_0241,
  rs_R009_ueqv_R009YNNNN_partial_04_0242,
  rs_R009_ueqv_R009YNNNN_partial_04_0243,
  rs_R009_ueqv_R009YNNNN_partial_04_0244,
  rs_R009_ueqv_R009YNNNN_partial_04_0245,
  rs_R009_ueqv_R009YNNNN_partial_04_0246,
  rs_R009_ueqv_R009YNNNN_partial_04_0247,
  rs_R009_ueqv_R009YNNNN_partial_04_0248,
  rs_R009_ueqv_R009YNNNN_partial_04_0249,
  rs_R009_ueqv_R009YNNNN_partial_04_0250,
  rs_R009_ueqv_R009YNNNN_partial_04_0251,
  rs_R009_ueqv_R009YNNNN_partial_04_0252,
  rs_R009_ueqv_R009YNNNN_partial_04_0253,
  rs_R009_ueqv_R009YNNNN_partial_04_0254,
  rs_R009_ueqv_R009YNNNN_partial_04_0255,
  rs_R009_ueqv_R009YNNNN_partial_04_0256,
  rs_R009_ueqv_R009YNNNN_partial_04_0257,
  rs_R009_ueqv_R009YNNNN_partial_04_0258,
  rs_R009_ueqv_R009YNNNN_partial_04_0259,
  rs_R009_ueqv_R009YNNNN_partial_04_0260,
  rs_R009_ueqv_R009YNNNN_partial_04_0261,
  rs_R009_ueqv_R009YNNNN_partial_04_0262,
  rs_R009_ueqv_R009YNNNN_partial_04_0263,
  rs_R009_ueqv_R009YNNNN_partial_04_0264,
  rs_R009_ueqv_R009YNNNN_partial_04_0265,
  rs_R009_ueqv_R009YNNNN_partial_04_0266,
  rs_R009_ueqv_R009YNNNN_partial_04_0267,
  rs_R009_ueqv_R009YNNNN_partial_04_0268,
  rs_R009_ueqv_R009YNNNN_partial_04_0269,
  rs_R009_ueqv_R009YNNNN_partial_04_0270,
  rs_R009_ueqv_R009YNNNN_partial_04_0271,
  rs_R009_ueqv_R009YNNNN_partial_04_0272,
  rs_R009_ueqv_R009YNNNN_partial_04_0273,
  rs_R009_ueqv_R009YNNNN_partial_04_0274,
  rs_R009_ueqv_R009YNNNN_partial_04_0275,
  rs_R009_ueqv_R009YNNNN_partial_04_0276,
  rs_R009_ueqv_R009YNNNN_partial_04_0277,
  rs_R009_ueqv_R009YNNNN_partial_04_0278,
  rs_R009_ueqv_R009YNNNN_partial_04_0279,
  rs_R009_ueqv_R009YNNNN_partial_04_0280,
  rs_R009_ueqv_R009YNNNN_partial_04_0281,
  rs_R009_ueqv_R009YNNNN_partial_04_0282,
  rs_R009_ueqv_R009YNNNN_partial_04_0283,
  rs_R009_ueqv_R009YNNNN_partial_04_0284,
  rs_R009_ueqv_R009YNNNN_partial_04_0285,
  rs_R009_ueqv_R009YNNNN_partial_04_0286,
  rs_R009_ueqv_R009YNNNN_partial_04_0287,
  rs_R009_ueqv_R009YNNNN_partial_04_0288,
  rs_R009_ueqv_R009YNNNN_partial_04_0289,
  rs_R009_ueqv_R009YNNNN_partial_04_0290,
  rs_R009_ueqv_R009YNNNN_partial_04_0291,
  rs_R009_ueqv_R009YNNNN_partial_04_0292,
  rs_R009_ueqv_R009YNNNN_partial_04_0293,
  rs_R009_ueqv_R009YNNNN_partial_04_0294,
  rs_R009_ueqv_R009YNNNN_partial_04_0295,
  rs_R009_ueqv_R009YNNNN_partial_04_0296,
  rs_R009_ueqv_R009YNNNN_partial_04_0297,
  rs_R009_ueqv_R009YNNNN_partial_04_0298,
  rs_R009_ueqv_R009YNNNN_partial_04_0299
]

/-- Sum of partial products in this block. -/
def rs_R009_ueqv_R009YNNNN_block_04_0200_0299 : Poly :=
[
  term ((-4349915183394751 : Rat) / 6527410339149) [(4, 1), (6, 1), (7, 1), (15, 1)],
  term ((-33731976522292 : Rat) / 44404151967) [(4, 1), (6, 1), (9, 1), (11, 1)],
  term ((239616 : Rat) / 553) [(4, 1), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((941242657 : Rat) / 83270796) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 42) [(4, 1), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(4, 1), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 83270796) [(4, 1), (6, 1), (9, 1), (13, 1)],
  term ((-725 : Rat) / 42) [(4, 1), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 156657848139576) [(4, 1), (6, 1), (9, 1), (15, 1)],
  term ((314 : Rat) / 21) [(4, 1), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-230762620385813 : Rat) / 5802142523688) [(4, 1), (6, 1), (9, 2)],
  term ((-2172201733 : Rat) / 166541592) [(4, 1), (6, 1), (9, 2), (12, 1)],
  term ((1532199782809 : Rat) / 69073125282) [(4, 1), (6, 1), (10, 1)],
  term ((-1005180329591 : Rat) / 14801383989) [(4, 1), (6, 1), (10, 1), (14, 1)],
  term ((706121836024930 : Rat) / 6527410339149) [(4, 1), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((2700 : Rat) / 7) [(4, 1), (6, 1), (11, 1), (13, 1)],
  term ((-1180641476782151 : Rat) / 13054820678298) [(4, 1), (6, 1), (11, 1), (15, 1)],
  term ((2224986028928059 : Rat) / 1598549470812) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 126) [(4, 1), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(4, 1), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 165250894662) [(4, 1), (6, 1), (12, 1), (15, 2)],
  term ((494 : Rat) / 63) [(4, 1), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-28425155928161 : Rat) / 241755938487) [(4, 1), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((-49287085518873383 : Rat) / 39164462034894) [(4, 1), (6, 1), (13, 1), (15, 1)],
  term ((1495 : Rat) / 126) [(4, 1), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((2939176196150779 : Rat) / 2901071261844) [(4, 1), (6, 1), (14, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(4, 1), (6, 1), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 483511876974) [(4, 1), (6, 1), (14, 2)],
  term ((7799382048821870 : Rat) / 6527410339149) [(4, 1), (6, 1), (15, 2)],
  term ((-494 : Rat) / 63) [(4, 1), (6, 1), (15, 2), (16, 1)],
  term ((3849005354029 : Rat) / 1289365005264) [(4, 1), (7, 1), (9, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(4, 1), (7, 1), (9, 1), (12, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(4, 1), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((-53777198303881 : Rat) / 40469606856) [(4, 1), (7, 1), (9, 1), (14, 1)],
  term ((169986160160725 : Rat) / 621658127538) [(4, 1), (7, 1), (11, 1)],
  term ((-333108 : Rat) / 553) [(4, 1), (7, 1), (11, 1), (12, 1)],
  term ((-706121836024930 : Rat) / 6527410339149) [(4, 1), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((294072426082889 : Rat) / 13054820678298) [(4, 1), (7, 1), (11, 1), (14, 1)],
  term ((-941242657 : Rat) / 166541592) [(4, 1), (7, 1), (12, 1), (13, 1)],
  term ((-2224986028928059 : Rat) / 1598549470812) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 126) [(4, 1), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 84) [(4, 1), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((150142660556857 : Rat) / 165250894662) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(4, 1), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(4, 1), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 2901071261844) [(4, 1), (7, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 21) [(4, 1), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((2235983296955 : Rat) / 214894167544) [(4, 1), (7, 1), (13, 1)],
  term ((98268272942155711 : Rat) / 78328924069788) [(4, 1), (7, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 126) [(4, 1), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 1), (7, 1), (13, 1), (14, 2)],
  term ((725 : Rat) / 84) [(4, 1), (7, 1), (13, 1), (16, 1)],
  term ((-2225133426004081 : Rat) / 1864974382614) [(4, 1), (7, 1), (14, 1), (15, 1)],
  term ((494 : Rat) / 63) [(4, 1), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(4, 1), (7, 1), (14, 2), (15, 1)],
  term ((-162945382702117 : Rat) / 2901071261844) [(4, 1), (7, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(4, 1), (7, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 161170625658) [(4, 1), (7, 2)],
  term ((-1532199782809 : Rat) / 161170625658) [(4, 1), (7, 2), (12, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(4, 1), (7, 2), (12, 1), (14, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(4, 1), (7, 2), (14, 1)],
  term ((4992 : Rat) / 79) [(4, 1), (9, 1), (10, 1), (11, 1)],
  term ((-9984 : Rat) / 553) [(4, 1), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-59904 : Rat) / 553) [(4, 1), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((6090608323475 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((-5 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 177616607868) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 21) [(4, 1), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((194243309063 : Rat) / 133212455901) [(4, 1), (9, 1), (10, 1), (13, 1)],
  term ((-8926828802611 : Rat) / 266424911802) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((-55 : Rat) / 14) [(4, 1), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((235 : Rat) / 84) [(4, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((170525183774905 : Rat) / 355233215736) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((22 : Rat) / 7) [(4, 1), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((-12691597676045 : Rat) / 236822143824) [(4, 1), (9, 1), (10, 1), (15, 1)],
  term ((-7 : Rat) / 3) [(4, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((62726157394913 : Rat) / 4262798588832) [(4, 1), (9, 1), (11, 1)],
  term ((33225805736000 : Rat) / 133212455901) [(4, 1), (9, 1), (11, 1), (12, 1)],
  term ((492931248330727 : Rat) / 1065699647208) [(4, 1), (9, 1), (11, 1), (14, 1)],
  term ((-119808 : Rat) / 553) [(4, 1), (9, 1), (11, 1), (14, 2)],
  term ((-9008294618453 : Rat) / 118411071912) [(4, 1), (9, 1), (11, 1), (15, 2)],
  term ((-97923607474811 : Rat) / 532849823604) [(4, 1), (9, 1), (12, 1), (13, 1)],
  term ((475 : Rat) / 42) [(4, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2172201733 : Rat) / 333083184) [(4, 1), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 69625710284256) [(4, 1), (9, 1), (12, 1), (15, 1)],
  term ((-64 : Rat) / 7) [(4, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-430215797773249 : Rat) / 2131399294416) [(4, 1), (9, 1), (13, 1)],
  term ((1435241433190279 : Rat) / 4262798588832) [(4, 1), (9, 1), (13, 1), (14, 1)],
  term ((65 : Rat) / 7) [(4, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 78940714608) [(4, 1), (9, 1), (13, 1), (14, 2)],
  term ((-305 : Rat) / 28) [(4, 1), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 39470357304) [(4, 1), (9, 1), (13, 1), (15, 2)],
  term ((-305 : Rat) / 28) [(4, 1), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((335 : Rat) / 84) [(4, 1), (9, 1), (13, 1), (16, 1)],
  term ((-167880819350441 : Rat) / 710466431472) [(4, 1), (9, 1), (14, 1), (15, 1)],
  term ((-60 : Rat) / 7) [(4, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 29602767978) [(4, 1), (9, 1), (14, 2), (15, 1)],
  term ((65 : Rat) / 7) [(4, 1), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((5567064246745259 : Rat) / 69625710284256) [(4, 1), (9, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(4, 2), (6, 1), (7, 1), (15, 1)],
  term ((16865988261146 : Rat) / 44404151967) [(4, 2), (6, 1), (9, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(4, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-941242657 : Rat) / 166541592) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-725 : Rat) / 84) [(4, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 21) [(4, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(4, 2), (6, 1), (9, 1), (13, 1)],
  term ((725 : Rat) / 84) [(4, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(4, 2), (6, 1), (9, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(4, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((230762620385813 : Rat) / 11604285047376) [(4, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 333083184) [(4, 2), (6, 1), (9, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 138146250564) [(4, 2), (6, 1), (10, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(4, 2), (6, 1), (10, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(4, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1350 : Rat) / 7) [(4, 2), (6, 1), (11, 1), (13, 1)],
  term ((1180641476782151 : Rat) / 26109641356596) [(4, 2), (6, 1), (11, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1495 : Rat) / 252) [(4, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(4, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(4, 2), (6, 1), (12, 1), (15, 2)],
  term ((-247 : Rat) / 63) [(4, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((28425155928161 : Rat) / 483511876974) [(4, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((49287085518873383 : Rat) / 78328924069788) [(4, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 252) [(4, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2939176196150779 : Rat) / 5802142523688) [(4, 2), (6, 1), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 2), (6, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(4, 2), (6, 1), (14, 2)],
  term ((-3899691024410935 : Rat) / 6527410339149) [(4, 2), (6, 1), (15, 2)],
  term ((247 : Rat) / 63) [(4, 2), (6, 1), (15, 2), (16, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(4, 2), (7, 1), (9, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(4, 2), (7, 1), (9, 1), (12, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(4, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(4, 2), (7, 1), (9, 1), (14, 1)],
  term ((-169986160160725 : Rat) / 1243316255076) [(4, 2), (7, 1), (11, 1)],
  term ((166554 : Rat) / 553) [(4, 2), (7, 1), (11, 1), (12, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(4, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-294072426082889 : Rat) / 26109641356596) [(4, 2), (7, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(4, 2), (7, 1), (12, 1), (13, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 252) [(4, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(4, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(4, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(4, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(4, 2), (7, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 42) [(4, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2235983296955 : Rat) / 429788335088) [(4, 2), (7, 1), (13, 1)],
  term ((-98268272942155711 : Rat) / 156657848139576) [(4, 2), (7, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 252) [(4, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(4, 2), (7, 1), (13, 1), (14, 2)],
  term ((-725 : Rat) / 168) [(4, 2), (7, 1), (13, 1), (16, 1)],
  term ((2225133426004081 : Rat) / 3729948765228) [(4, 2), (7, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(4, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(4, 2), (7, 1), (14, 2), (15, 1)],
  term ((162945382702117 : Rat) / 5802142523688) [(4, 2), (7, 1), (15, 1)],
  term ((157 : Rat) / 42) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(4, 2), (7, 2)],
  term ((1532199782809 : Rat) / 322341251316) [(4, 2), (7, 2), (12, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(4, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(4, 2), (7, 2), (14, 1)],
  term ((-2496 : Rat) / 79) [(4, 2), (9, 1), (10, 1), (11, 1)],
  term ((4992 : Rat) / 553) [(4, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((29952 : Rat) / 553) [(4, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 6) [(4, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16 : Rat) / 21) [(4, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-194243309063 : Rat) / 266424911802) [(4, 2), (9, 1), (10, 1), (13, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 28) [(4, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-235 : Rat) / 168) [(4, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 7) [(4, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12691597676045 : Rat) / 473644287648) [(4, 2), (9, 1), (10, 1), (15, 1)],
  term ((7 : Rat) / 6) [(4, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-62726157394913 : Rat) / 8525597177664) [(4, 2), (9, 1), (11, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(4, 2), (9, 1), (11, 1), (12, 1)],
  term ((-492931248330727 : Rat) / 2131399294416) [(4, 2), (9, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(4, 2), (9, 1), (11, 1), (14, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(4, 2), (9, 1), (11, 1), (15, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(4, 2), (9, 1), (12, 1), (13, 1)],
  term ((-475 : Rat) / 84) [(4, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2172201733 : Rat) / 666166368) [(4, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(4, 2), (9, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 7) [(4, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((430215797773249 : Rat) / 4262798588832) [(4, 2), (9, 1), (13, 1)],
  term ((-1435241433190279 : Rat) / 8525597177664) [(4, 2), (9, 1), (13, 1), (14, 1)],
  term ((-65 : Rat) / 14) [(4, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 157881429216) [(4, 2), (9, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 56) [(4, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(4, 2), (9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(4, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-335 : Rat) / 168) [(4, 2), (9, 1), (13, 1), (16, 1)],
  term ((167880819350441 : Rat) / 1420932862944) [(4, 2), (9, 1), (14, 1), (15, 1)],
  term ((30 : Rat) / 7) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(4, 2), (9, 1), (14, 2), (15, 1)],
  term ((-65 : Rat) / 14) [(4, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5567064246745259 : Rat) / 139251420568512) [(4, 2), (9, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(5, 2), (6, 1), (7, 1), (15, 1)],
  term ((16865988261146 : Rat) / 44404151967) [(5, 2), (6, 1), (9, 1), (11, 1)],
  term ((-119808 : Rat) / 553) [(5, 2), (6, 1), (9, 1), (11, 1), (12, 1)],
  term ((-941242657 : Rat) / 166541592) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1)],
  term ((-725 : Rat) / 84) [(5, 2), (6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 21) [(5, 2), (6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(5, 2), (6, 1), (9, 1), (13, 1)],
  term ((725 : Rat) / 84) [(5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(5, 2), (6, 1), (9, 1), (15, 1)],
  term ((-157 : Rat) / 21) [(5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((230762620385813 : Rat) / 11604285047376) [(5, 2), (6, 1), (9, 2)],
  term ((2172201733 : Rat) / 333083184) [(5, 2), (6, 1), (9, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 138146250564) [(5, 2), (6, 1), (10, 1)],
  term ((1005180329591 : Rat) / 29602767978) [(5, 2), (6, 1), (10, 1), (14, 1)],
  term ((-353060918012465 : Rat) / 6527410339149) [(5, 2), (6, 1), (11, 1), (12, 1), (15, 1)],
  term ((-1350 : Rat) / 7) [(5, 2), (6, 1), (11, 1), (13, 1)],
  term ((1180641476782151 : Rat) / 26109641356596) [(5, 2), (6, 1), (11, 1), (15, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1)],
  term ((1495 : Rat) / 252) [(5, 2), (6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(5, 2), (6, 1), (12, 1), (14, 1), (15, 2)],
  term ((140138745041977 : Rat) / 330501789324) [(5, 2), (6, 1), (12, 1), (15, 2)],
  term ((-247 : Rat) / 63) [(5, 2), (6, 1), (12, 1), (15, 2), (16, 1)],
  term ((28425155928161 : Rat) / 483511876974) [(5, 2), (6, 1), (13, 1), (14, 1), (15, 1)],
  term ((49287085518873383 : Rat) / 78328924069788) [(5, 2), (6, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 252) [(5, 2), (6, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2939176196150779 : Rat) / 5802142523688) [(5, 2), (6, 1), (14, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(5, 2), (6, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 967023753948) [(5, 2), (6, 1), (14, 2)],
  term ((-3899691024410935 : Rat) / 6527410339149) [(5, 2), (6, 1), (15, 2)],
  term ((247 : Rat) / 63) [(5, 2), (6, 1), (15, 2), (16, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(5, 2), (7, 1), (9, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(5, 2), (7, 1), (9, 1), (12, 1)],
  term ((-53777198303881 : Rat) / 80939213712) [(5, 2), (7, 1), (9, 1), (12, 1), (14, 1)],
  term ((53777198303881 : Rat) / 80939213712) [(5, 2), (7, 1), (9, 1), (14, 1)],
  term ((-169986160160725 : Rat) / 1243316255076) [(5, 2), (7, 1), (11, 1)],
  term ((166554 : Rat) / 553) [(5, 2), (7, 1), (11, 1), (12, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(5, 2), (7, 1), (11, 1), (12, 1), (14, 1)],
  term ((-294072426082889 : Rat) / 26109641356596) [(5, 2), (7, 1), (11, 1), (14, 1)],
  term ((941242657 : Rat) / 333083184) [(5, 2), (7, 1), (12, 1), (13, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 252) [(5, 2), (7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((725 : Rat) / 168) [(5, 2), (7, 1), (12, 1), (13, 1), (16, 1)],
  term ((-150142660556857 : Rat) / 330501789324) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(5, 2), (7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(5, 2), (7, 1), (12, 1), (14, 2), (15, 1)],
  term ((-148780745730977 : Rat) / 5802142523688) [(5, 2), (7, 1), (12, 1), (15, 1)],
  term ((-157 : Rat) / 42) [(5, 2), (7, 1), (12, 1), (15, 1), (16, 1)],
  term ((-2235983296955 : Rat) / 429788335088) [(5, 2), (7, 1), (13, 1)],
  term ((-98268272942155711 : Rat) / 156657848139576) [(5, 2), (7, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 252) [(5, 2), (7, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 53723541886) [(5, 2), (7, 1), (13, 1), (14, 2)],
  term ((-725 : Rat) / 168) [(5, 2), (7, 1), (13, 1), (16, 1)],
  term ((2225133426004081 : Rat) / 3729948765228) [(5, 2), (7, 1), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(5, 2), (7, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(5, 2), (7, 1), (14, 2), (15, 1)],
  term ((162945382702117 : Rat) / 5802142523688) [(5, 2), (7, 1), (15, 1)],
  term ((157 : Rat) / 42) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(5, 2), (7, 2)],
  term ((1532199782809 : Rat) / 322341251316) [(5, 2), (7, 2), (12, 1)],
  term ((4349915183394751 : Rat) / 13054820678298) [(5, 2), (7, 2), (12, 1), (14, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(5, 2), (7, 2), (14, 1)],
  term ((-2496 : Rat) / 79) [(5, 2), (9, 1), (10, 1), (11, 1)],
  term ((4992 : Rat) / 553) [(5, 2), (9, 1), (10, 1), (11, 1), (12, 1)],
  term ((29952 : Rat) / 553) [(5, 2), (9, 1), (10, 1), (11, 1), (14, 1)],
  term ((-6090608323475 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1)],
  term ((5 : Rat) / 6) [(5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((30188368622915 : Rat) / 355233215736) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1)],
  term ((-16 : Rat) / 21) [(5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-194243309063 : Rat) / 266424911802) [(5, 2), (9, 1), (10, 1), (13, 1)],
  term ((8926828802611 : Rat) / 532849823604) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 28) [(5, 2), (9, 1), (10, 1), (13, 1), (14, 1), (16, 1)],
  term ((-235 : Rat) / 168) [(5, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-170525183774905 : Rat) / 710466431472) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1)],
  term ((-11 : Rat) / 7) [(5, 2), (9, 1), (10, 1), (14, 1), (15, 1), (16, 1)],
  term ((12691597676045 : Rat) / 473644287648) [(5, 2), (9, 1), (10, 1), (15, 1)],
  term ((7 : Rat) / 6) [(5, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-62726157394913 : Rat) / 8525597177664) [(5, 2), (9, 1), (11, 1)],
  term ((-16612902868000 : Rat) / 133212455901) [(5, 2), (9, 1), (11, 1), (12, 1)],
  term ((-492931248330727 : Rat) / 2131399294416) [(5, 2), (9, 1), (11, 1), (14, 1)],
  term ((59904 : Rat) / 553) [(5, 2), (9, 1), (11, 1), (14, 2)],
  term ((9008294618453 : Rat) / 236822143824) [(5, 2), (9, 1), (11, 1), (15, 2)],
  term ((97923607474811 : Rat) / 1065699647208) [(5, 2), (9, 1), (12, 1), (13, 1)],
  term ((-475 : Rat) / 84) [(5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((2172201733 : Rat) / 666166368) [(5, 2), (9, 1), (12, 1), (14, 1), (15, 1)],
  term ((-10110568816218515 : Rat) / 139251420568512) [(5, 2), (9, 1), (12, 1), (15, 1)],
  term ((32 : Rat) / 7) [(5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((430215797773249 : Rat) / 4262798588832) [(5, 2), (9, 1), (13, 1)],
  term ((-1435241433190279 : Rat) / 8525597177664) [(5, 2), (9, 1), (13, 1), (14, 1)],
  term ((-65 : Rat) / 14) [(5, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 157881429216) [(5, 2), (9, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 56) [(5, 2), (9, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 78940714608) [(5, 2), (9, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 56) [(5, 2), (9, 1), (13, 1), (15, 2), (16, 1)],
  term ((-335 : Rat) / 168) [(5, 2), (9, 1), (13, 1), (16, 1)],
  term ((167880819350441 : Rat) / 1420932862944) [(5, 2), (9, 1), (14, 1), (15, 1)],
  term ((30 : Rat) / 7) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 59205535956) [(5, 2), (9, 1), (14, 2), (15, 1)],
  term ((-65 : Rat) / 14) [(5, 2), (9, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5567064246745259 : Rat) / 139251420568512) [(5, 2), (9, 1), (15, 1)],
  term ((4349915183394751 : Rat) / 6527410339149) [(6, 1), (7, 1), (12, 1), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (12, 2), (15, 1)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(6, 1), (7, 1), (13, 2), (15, 1)],
  term ((33731976522292 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1), (12, 1)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-36106395634970 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1), (12, 2)],
  term ((119808 : Rat) / 553) [(6, 1), (9, 1), (11, 1), (12, 3)],
  term ((-16865988261146 : Rat) / 44404151967) [(6, 1), (9, 1), (11, 1), (13, 2)],
  term ((941242657 : Rat) / 83270796) [(6, 1), (9, 1), (12, 1), (13, 1)],
  term ((725 : Rat) / 42) [(6, 1), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 1), (13, 3)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 1), (13, 3), (16, 1)],
  term ((-223016262790904647 : Rat) / 156657848139576) [(6, 1), (9, 1), (12, 1), (15, 1)],
  term ((-314 : Rat) / 21) [(6, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 55513864) [(6, 1), (9, 1), (12, 2), (13, 1)],
  term ((-725 : Rat) / 28) [(6, 1), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 104438565426384) [(6, 1), (9, 1), (12, 2), (15, 1)],
  term ((157 : Rat) / 7) [(6, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((941242657 : Rat) / 166541592) [(6, 1), (9, 1), (12, 3), (13, 1)],
  term ((725 : Rat) / 84) [(6, 1), (9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (12, 3), (15, 1)],
  term ((-157 : Rat) / 21) [(6, 1), (9, 1), (12, 3), (15, 1), (16, 1)],
  term ((223016262790904647 : Rat) / 313315696279152) [(6, 1), (9, 1), (13, 2), (15, 1)],
  term ((157 : Rat) / 21) [(6, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 166541592) [(6, 1), (9, 1), (13, 3)],
  term ((-725 : Rat) / 84) [(6, 1), (9, 1), (13, 3), (16, 1)],
  term ((230762620385813 : Rat) / 5802142523688) [(6, 1), (9, 2), (12, 1)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 1), (13, 2)],
  term ((-79407948033839 : Rat) / 11604285047376) [(6, 1), (9, 2), (12, 2)],
  term ((-2172201733 : Rat) / 333083184) [(6, 1), (9, 2), (12, 3)],
  term ((-230762620385813 : Rat) / 11604285047376) [(6, 1), (9, 2), (13, 2)],
  term ((-1532199782809 : Rat) / 69073125282) [(6, 1), (10, 1), (12, 1)],
  term ((1005180329591 : Rat) / 14801383989) [(6, 1), (10, 1), (12, 1), (14, 1)],
  term ((1532199782809 : Rat) / 138146250564) [(6, 1), (10, 1), (12, 2)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (12, 2), (14, 1)],
  term ((1532199782809 : Rat) / 138146250564) [(6, 1), (10, 1), (13, 2)],
  term ((-1005180329591 : Rat) / 29602767978) [(6, 1), (10, 1), (13, 2), (14, 1)],
  term ((-2700 : Rat) / 7) [(6, 1), (11, 1), (12, 1), (13, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 1), (13, 2), (15, 1)],
  term ((1180641476782151 : Rat) / 13054820678298) [(6, 1), (11, 1), (12, 1), (15, 1)],
  term ((1350 : Rat) / 7) [(6, 1), (11, 1), (12, 2), (13, 1)],
  term ((-445014313431319 : Rat) / 2901071261844) [(6, 1), (11, 1), (12, 2), (15, 1)],
  term ((353060918012465 : Rat) / 6527410339149) [(6, 1), (11, 1), (12, 3), (15, 1)],
  term ((-1180641476782151 : Rat) / 26109641356596) [(6, 1), (11, 1), (13, 2), (15, 1)],
  term ((1350 : Rat) / 7) [(6, 1), (11, 1), (13, 3)],
  term ((28425155928161 : Rat) / 241755938487) [(6, 1), (12, 1), (13, 1), (14, 1), (15, 1)],
  term ((49287085518873383 : Rat) / 39164462034894) [(6, 1), (12, 1), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 126) [(6, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 1), (13, 2), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 1), (13, 2), (15, 2)],
  term ((247 : Rat) / 63) [(6, 1), (12, 1), (13, 2), (15, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 1), (13, 3), (15, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 1), (13, 3), (15, 1), (16, 1)],
  term ((-2939176196150779 : Rat) / 2901071261844) [(6, 1), (12, 1), (14, 1)],
  term ((3064399565618 : Rat) / 26861770943) [(6, 1), (12, 1), (14, 1), (15, 2)],
  term ((28425155928161 : Rat) / 483511876974) [(6, 1), (12, 1), (14, 2)],
  term ((-7799382048821870 : Rat) / 6527410339149) [(6, 1), (12, 1), (15, 2)],
  term ((494 : Rat) / 63) [(6, 1), (12, 1), (15, 2), (16, 1)],
  term ((-28425155928161 : Rat) / 483511876974) [(6, 1), (12, 2), (13, 1), (14, 1), (15, 1)],
  term ((-26385233489391379 : Rat) / 13054820678298) [(6, 1), (12, 2), (13, 1), (15, 1)],
  term ((1495 : Rat) / 84) [(6, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((2939176196150779 : Rat) / 5802142523688) [(6, 1), (12, 2), (14, 1)],
  term ((-4596599348427 : Rat) / 26861770943) [(6, 1), (12, 2), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (12, 2), (14, 2)],
  term ((6290114302379351 : Rat) / 4351606892766) [(6, 1), (12, 2), (15, 2)],
  term ((-247 : Rat) / 21) [(6, 1), (12, 2), (15, 2), (16, 1)],
  term ((2224986028928059 : Rat) / 3197098941624) [(6, 1), (12, 3), (13, 1), (15, 1)],
  term ((-1495 : Rat) / 252) [(6, 1), (12, 3), (13, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(6, 1), (12, 3), (14, 1), (15, 2)],
  term ((-140138745041977 : Rat) / 330501789324) [(6, 1), (12, 3), (15, 2)],
  term ((247 : Rat) / 63) [(6, 1), (12, 3), (15, 2), (16, 1)],
  term ((2939176196150779 : Rat) / 5802142523688) [(6, 1), (13, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(6, 1), (13, 2), (14, 1), (15, 2)],
  term ((-28425155928161 : Rat) / 967023753948) [(6, 1), (13, 2), (14, 2)],
  term ((3899691024410935 : Rat) / 6527410339149) [(6, 1), (13, 2), (15, 2)],
  term ((-247 : Rat) / 63) [(6, 1), (13, 2), (15, 2), (16, 1)],
  term ((-28425155928161 : Rat) / 483511876974) [(6, 1), (13, 3), (14, 1), (15, 1)],
  term ((-49287085518873383 : Rat) / 78328924069788) [(6, 1), (13, 3), (15, 1)],
  term ((1495 : Rat) / 252) [(6, 1), (13, 3), (15, 1), (16, 1)],
  term ((-3849005354029 : Rat) / 1289365005264) [(7, 1), (9, 1), (12, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 1), (13, 2)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 1), (13, 2), (14, 1)],
  term ((53777198303881 : Rat) / 40469606856) [(7, 1), (9, 1), (12, 1), (14, 1)],
  term ((3849005354029 : Rat) / 859576670176) [(7, 1), (9, 1), (12, 2)],
  term ((-53777198303881 : Rat) / 26979737904) [(7, 1), (9, 1), (12, 2), (14, 1)],
  term ((-3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (12, 3)],
  term ((53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (12, 3), (14, 1)],
  term ((3849005354029 : Rat) / 2578730010528) [(7, 1), (9, 1), (13, 2)],
  term ((-53777198303881 : Rat) / 80939213712) [(7, 1), (9, 1), (13, 2), (14, 1)],
  term ((-169986160160725 : Rat) / 621658127538) [(7, 1), (11, 1), (12, 1)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 1), (13, 2)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 1), (13, 2), (14, 1)],
  term ((-294072426082889 : Rat) / 13054820678298) [(7, 1), (11, 1), (12, 1), (14, 1)],
  term ((918916704637861 : Rat) / 1243316255076) [(7, 1), (11, 1), (12, 2)],
  term ((12833579301163 : Rat) / 107447083772) [(7, 1), (11, 1), (12, 2), (14, 1)],
  term ((-166554 : Rat) / 553) [(7, 1), (11, 1), (12, 3)],
  term ((-353060918012465 : Rat) / 6527410339149) [(7, 1), (11, 1), (12, 3), (14, 1)],
  term ((169986160160725 : Rat) / 1243316255076) [(7, 1), (11, 1), (13, 2)],
  term ((294072426082889 : Rat) / 26109641356596) [(7, 1), (11, 1), (13, 2), (14, 1)],
  term ((-2235983296955 : Rat) / 214894167544) [(7, 1), (12, 1), (13, 1)],
  term ((-98268272942155711 : Rat) / 78328924069788) [(7, 1), (12, 1), (13, 1), (14, 1)],
  term ((1495 : Rat) / 126) [(7, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (13, 1), (14, 2)],
  term ((-725 : Rat) / 84) [(7, 1), (12, 1), (13, 1), (16, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 1), (13, 2), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 1), (13, 2), (15, 1)],
  term ((157 : Rat) / 42) [(7, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 1), (13, 3)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 1), (13, 3), (14, 1)],
  term ((1495 : Rat) / 252) [(7, 1), (12, 1), (13, 3), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 1), (12, 1), (13, 3), (16, 1)],
  term ((2225133426004081 : Rat) / 1864974382614) [(7, 1), (12, 1), (14, 1), (15, 1)],
  term ((-494 : Rat) / 63) [(7, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3064399565618 : Rat) / 26861770943) [(7, 1), (12, 1), (14, 2), (15, 1)],
  term ((162945382702117 : Rat) / 2901071261844) [(7, 1), (12, 1), (15, 1)],
  term ((157 : Rat) / 21) [(7, 1), (12, 1), (15, 1), (16, 1)],
  term ((13995050541359 : Rat) / 1289365005264) [(7, 1), (12, 2), (13, 1)],
  term ((105438967925701831 : Rat) / 52219282713192) [(7, 1), (12, 2), (13, 1), (14, 1)],
  term ((-1495 : Rat) / 84) [(7, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (12, 2), (13, 1), (14, 2)],
  term ((725 : Rat) / 56) [(7, 1), (12, 2), (13, 1), (16, 1)],
  term ((-13099491450003991 : Rat) / 8703213785532) [(7, 1), (12, 2), (14, 1), (15, 1)],
  term ((247 : Rat) / 21) [(7, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((4596599348427 : Rat) / 26861770943) [(7, 1), (12, 2), (14, 2), (15, 1)],
  term ((-65786696309153 : Rat) / 828877503384) [(7, 1), (12, 2), (15, 1)],
  term ((-157 : Rat) / 14) [(7, 1), (12, 2), (15, 1), (16, 1)],
  term ((-941242657 : Rat) / 333083184) [(7, 1), (12, 3), (13, 1)],
  term ((-2224986028928059 : Rat) / 3197098941624) [(7, 1), (12, 3), (13, 1), (14, 1)],
  term ((1495 : Rat) / 252) [(7, 1), (12, 3), (13, 1), (14, 1), (16, 1)],
  term ((-725 : Rat) / 168) [(7, 1), (12, 3), (13, 1), (16, 1)],
  term ((150142660556857 : Rat) / 330501789324) [(7, 1), (12, 3), (14, 1), (15, 1)],
  term ((-247 : Rat) / 63) [(7, 1), (12, 3), (14, 1), (15, 1), (16, 1)],
  term ((-1532199782809 : Rat) / 26861770943) [(7, 1), (12, 3), (14, 2), (15, 1)],
  term ((148780745730977 : Rat) / 5802142523688) [(7, 1), (12, 3), (15, 1)],
  term ((157 : Rat) / 42) [(7, 1), (12, 3), (15, 1), (16, 1)],
  term ((-2225133426004081 : Rat) / 3729948765228) [(7, 1), (13, 2), (14, 1), (15, 1)],
  term ((247 : Rat) / 63) [(7, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1532199782809 : Rat) / 26861770943) [(7, 1), (13, 2), (14, 2), (15, 1)],
  term ((-162945382702117 : Rat) / 5802142523688) [(7, 1), (13, 2), (15, 1)],
  term ((-157 : Rat) / 42) [(7, 1), (13, 2), (15, 1), (16, 1)],
  term ((2235983296955 : Rat) / 429788335088) [(7, 1), (13, 3)],
  term ((98268272942155711 : Rat) / 156657848139576) [(7, 1), (13, 3), (14, 1)],
  term ((-1495 : Rat) / 252) [(7, 1), (13, 3), (14, 1), (16, 1)],
  term ((1532199782809 : Rat) / 53723541886) [(7, 1), (13, 3), (14, 2)],
  term ((725 : Rat) / 168) [(7, 1), (13, 3), (16, 1)],
  term ((-1532199782809 : Rat) / 161170625658) [(7, 2), (12, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 1), (13, 2)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 1), (13, 2), (14, 1)],
  term ((-4349915183394751 : Rat) / 6527410339149) [(7, 2), (12, 1), (14, 1)],
  term ((1532199782809 : Rat) / 107447083772) [(7, 2), (12, 2)],
  term ((4349915183394751 : Rat) / 4351606892766) [(7, 2), (12, 2), (14, 1)],
  term ((-1532199782809 : Rat) / 322341251316) [(7, 2), (12, 3)],
  term ((-4349915183394751 : Rat) / 13054820678298) [(7, 2), (12, 3), (14, 1)],
  term ((1532199782809 : Rat) / 322341251316) [(7, 2), (13, 2)],
  term ((4349915183394751 : Rat) / 13054820678298) [(7, 2), (13, 2), (14, 1)],
  term ((-4992 : Rat) / 79) [(9, 1), (10, 1), (11, 1), (12, 1)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (13, 2)],
  term ((59904 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 1), (14, 1)],
  term ((27456 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 2)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 2), (14, 1)],
  term ((-4992 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (12, 3)],
  term ((2496 : Rat) / 79) [(9, 1), (10, 1), (11, 1), (13, 2)],
  term ((-29952 : Rat) / 553) [(9, 1), (10, 1), (11, 1), (13, 2), (14, 1)],
  term ((-194243309063 : Rat) / 133212455901) [(9, 1), (10, 1), (12, 1), (13, 1)],
  term ((8926828802611 : Rat) / 266424911802) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1)],
  term ((55 : Rat) / 14) [(9, 1), (10, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-235 : Rat) / 84) [(9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 1), (13, 3)],
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 1), (13, 3), (16, 1)],
  term ((-170525183774905 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1)],
  term ((-22 : Rat) / 7) [(9, 1), (10, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((12691597676045 : Rat) / 236822143824) [(9, 1), (10, 1), (12, 1), (15, 1)],
  term ((7 : Rat) / 3) [(9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4146529546 : Rat) / 187359291) [(9, 1), (10, 1), (12, 2), (13, 1)],
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((515 : Rat) / 168) [(9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((203432155955185 : Rat) / 1420932862944) [(9, 1), (10, 1), (12, 2), (15, 1)],
  term ((-113 : Rat) / 42) [(9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((6090608323475 : Rat) / 532849823604) [(9, 1), (10, 1), (12, 3), (13, 1)],
  term ((-5 : Rat) / 6) [(9, 1), (10, 1), (12, 3), (13, 1), (16, 1)],
  term ((-30188368622915 : Rat) / 355233215736) [(9, 1), (10, 1), (12, 3), (15, 1)],
  term ((16 : Rat) / 21) [(9, 1), (10, 1), (12, 3), (15, 1), (16, 1)],
  term ((170525183774905 : Rat) / 710466431472) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1)],
  term ((11 : Rat) / 7) [(9, 1), (10, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-12691597676045 : Rat) / 473644287648) [(9, 1), (10, 1), (13, 2), (15, 1)],
  term ((-7 : Rat) / 6) [(9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((194243309063 : Rat) / 266424911802) [(9, 1), (10, 1), (13, 3)],
  term ((-8926828802611 : Rat) / 532849823604) [(9, 1), (10, 1), (13, 3), (14, 1)],
  term ((-55 : Rat) / 28) [(9, 1), (10, 1), (13, 3), (14, 1), (16, 1)],
  term ((235 : Rat) / 168) [(9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-62726157394913 : Rat) / 4262798588832) [(9, 1), (11, 1), (12, 1)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 1), (13, 2)],
  term ((-492931248330727 : Rat) / 1065699647208) [(9, 1), (11, 1), (12, 1), (14, 1)],
  term ((119808 : Rat) / 553) [(9, 1), (11, 1), (12, 1), (14, 2)],
  term ((9008294618453 : Rat) / 118411071912) [(9, 1), (11, 1), (12, 1), (15, 2)],
  term ((-687908469903029 : Rat) / 2841865725888) [(9, 1), (11, 1), (12, 2)],
  term ((492931248330727 : Rat) / 2131399294416) [(9, 1), (11, 1), (12, 2), (14, 1)],
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (12, 2), (14, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (12, 2), (15, 2)],
  term ((16612902868000 : Rat) / 133212455901) [(9, 1), (11, 1), (12, 3)],
  term ((62726157394913 : Rat) / 8525597177664) [(9, 1), (11, 1), (13, 2)],
  term ((492931248330727 : Rat) / 2131399294416) [(9, 1), (11, 1), (13, 2), (14, 1)],
  term ((-59904 : Rat) / 553) [(9, 1), (11, 1), (13, 2), (14, 2)],
  term ((-9008294618453 : Rat) / 236822143824) [(9, 1), (11, 1), (13, 2), (15, 2)],
  term ((430215797773249 : Rat) / 2131399294416) [(9, 1), (12, 1), (13, 1)],
  term ((-1435241433190279 : Rat) / 4262798588832) [(9, 1), (12, 1), (13, 1), (14, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6422908767787 : Rat) / 78940714608) [(9, 1), (12, 1), (13, 1), (14, 2)],
  term ((305 : Rat) / 28) [(9, 1), (12, 1), (13, 1), (14, 2), (16, 1)],
  term ((-2954048478533 : Rat) / 39470357304) [(9, 1), (12, 1), (13, 1), (15, 2)],
  term ((305 : Rat) / 28) [(9, 1), (12, 1), (13, 1), (15, 2), (16, 1)],
  term ((-335 : Rat) / 84) [(9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 1), (13, 2), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 1), (13, 2), (15, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 1), (13, 2), (15, 1), (16, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 1), (13, 3)],
  term ((475 : Rat) / 84) [(9, 1), (12, 1), (13, 3), (16, 1)],
  term ((167880819350441 : Rat) / 710466431472) [(9, 1), (12, 1), (14, 1), (15, 1)],
  term ((60 : Rat) / 7) [(9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3366906314273 : Rat) / 29602767978) [(9, 1), (12, 1), (14, 2), (15, 1)],
  term ((-65 : Rat) / 7) [(9, 1), (12, 1), (14, 2), (15, 1), (16, 1)],
  term ((-5567064246745259 : Rat) / 69625710284256) [(9, 1), (12, 1), (15, 1)],
  term ((117724354008413 : Rat) / 1420932862944) [(9, 1), (12, 2), (13, 1)],
  term ((1435241433190279 : Rat) / 8525597177664) [(9, 1), (12, 2), (13, 1), (14, 1)],
  term ((65 : Rat) / 14) [(9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (12, 2), (13, 1), (14, 2)],
  term ((-305 : Rat) / 56) [(9, 1), (12, 2), (13, 1), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (12, 2), (13, 1), (15, 2)],
  term ((-305 : Rat) / 56) [(9, 1), (12, 2), (13, 1), (15, 2), (16, 1)],
  term ((-1565 : Rat) / 168) [(9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-158614206757463 : Rat) / 1420932862944) [(9, 1), (12, 2), (14, 1), (15, 1)],
  term ((-30 : Rat) / 7) [(9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (12, 2), (14, 2), (15, 1)],
  term ((65 : Rat) / 14) [(9, 1), (12, 2), (14, 2), (15, 1), (16, 1)],
  term ((-14654073385691771 : Rat) / 139251420568512) [(9, 1), (12, 2), (15, 1)],
  term ((64 : Rat) / 7) [(9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-97923607474811 : Rat) / 1065699647208) [(9, 1), (12, 3), (13, 1)],
  term ((475 : Rat) / 84) [(9, 1), (12, 3), (13, 1), (16, 1)],
  term ((-2172201733 : Rat) / 666166368) [(9, 1), (12, 3), (14, 1), (15, 1)],
  term ((10110568816218515 : Rat) / 139251420568512) [(9, 1), (12, 3), (15, 1)],
  term ((-32 : Rat) / 7) [(9, 1), (12, 3), (15, 1), (16, 1)],
  term ((-167880819350441 : Rat) / 1420932862944) [(9, 1), (13, 2), (14, 1), (15, 1)],
  term ((-30 : Rat) / 7) [(9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((-3366906314273 : Rat) / 59205535956) [(9, 1), (13, 2), (14, 2), (15, 1)],
  term ((65 : Rat) / 14) [(9, 1), (13, 2), (14, 2), (15, 1), (16, 1)],
  term ((5567064246745259 : Rat) / 139251420568512) [(9, 1), (13, 2), (15, 1)],
  term ((-430215797773249 : Rat) / 4262798588832) [(9, 1), (13, 3)],
  term ((1435241433190279 : Rat) / 8525597177664) [(9, 1), (13, 3), (14, 1)],
  term ((65 : Rat) / 14) [(9, 1), (13, 3), (14, 1), (16, 1)],
  term ((6422908767787 : Rat) / 157881429216) [(9, 1), (13, 3), (14, 2)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 3), (14, 2), (16, 1)],
  term ((2954048478533 : Rat) / 78940714608) [(9, 1), (13, 3), (15, 2)],
  term ((-305 : Rat) / 56) [(9, 1), (13, 3), (15, 2), (16, 1)],
  term ((335 : Rat) / 168) [(9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 200 through 299. -/
theorem rs_R009_ueqv_R009YNNNN_block_04_0200_0299_valid :
    checkProductSumEq rs_R009_ueqv_R009YNNNN_partials_04_0200_0299
      rs_R009_ueqv_R009YNNNN_block_04_0200_0299 = true := by
  native_decide

end R009UeqvR009YNNNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
