/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YY, term block 19:0-7

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YYTermShards

/-- Generator polynomial 19 for relaxed split surplus certificate `R010:u=v:R010YY`. -/
def rs_R010_ueqv_R010YY_generator_19_0000_0007 : Poly :=
[
  term (2 : Rat) [(4, 1), (8, 1)],
  term (-1 : Rat) [(4, 2)],
  term (2 : Rat) [(5, 1), (9, 1)],
  term (-1 : Rat) [(5, 2)]
]

/-- Coefficient term 0 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YY_coefficient_19_0000 : Poly :=
[
  term ((-28064 : Rat) / 25) [(1, 1), (15, 1), (16, 1)]
]

/-- Partial product 0 for generator 19. -/
def rs_R010_ueqv_R010YY_partial_19_0000 : Poly :=
[
  term ((-56128 : Rat) / 25) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 0 for generator 19. -/
theorem rs_R010_ueqv_R010YY_partial_19_0000_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_19_0000
        rs_R010_ueqv_R010YY_generator_19_0000_0007 =
      rs_R010_ueqv_R010YY_partial_19_0000 := by
  native_decide

/-- Coefficient term 1 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YY_coefficient_19_0001 : Poly :=
[
  term ((-1344 : Rat) / 25) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 1 for generator 19. -/
def rs_R010_ueqv_R010YY_partial_19_0001 : Poly :=
[
  term ((-2688 : Rat) / 25) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(3, 1), (5, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 1 for generator 19. -/
theorem rs_R010_ueqv_R010YY_partial_19_0001_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_19_0001
        rs_R010_ueqv_R010YY_generator_19_0000_0007 =
      rs_R010_ueqv_R010YY_partial_19_0001 := by
  native_decide

/-- Coefficient term 2 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YY_coefficient_19_0002 : Poly :=
[
  term ((-448 : Rat) / 25) [(7, 1), (15, 1), (16, 1)]
]

/-- Partial product 2 for generator 19. -/
def rs_R010_ueqv_R010YY_partial_19_0002 : Poly :=
[
  term ((-896 : Rat) / 25) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(5, 2), (7, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 2 for generator 19. -/
theorem rs_R010_ueqv_R010YY_partial_19_0002_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_19_0002
        rs_R010_ueqv_R010YY_generator_19_0000_0007 =
      rs_R010_ueqv_R010YY_partial_19_0002 := by
  native_decide

/-- Coefficient term 3 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YY_coefficient_19_0003 : Poly :=
[
  term ((-1792 : Rat) / 25) [(9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 3 for generator 19. -/
def rs_R010_ueqv_R010YY_partial_19_0003 : Poly :=
[
  term ((-3584 : Rat) / 25) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 3 for generator 19. -/
theorem rs_R010_ueqv_R010YY_partial_19_0003_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_19_0003
        rs_R010_ueqv_R010YY_generator_19_0000_0007 =
      rs_R010_ueqv_R010YY_partial_19_0003 := by
  native_decide

/-- Coefficient term 4 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YY_coefficient_19_0004 : Poly :=
[
  term ((896 : Rat) / 25) [(9, 1), (15, 1), (16, 1)]
]

/-- Partial product 4 for generator 19. -/
def rs_R010_ueqv_R010YY_partial_19_0004 : Poly :=
[
  term ((1792 : Rat) / 25) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 2), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 4 for generator 19. -/
theorem rs_R010_ueqv_R010YY_partial_19_0004_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_19_0004
        rs_R010_ueqv_R010YY_generator_19_0000_0007 =
      rs_R010_ueqv_R010YY_partial_19_0004 := by
  native_decide

/-- Coefficient term 5 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YY_coefficient_19_0005 : Poly :=
[
  term ((-1792 : Rat) / 25) [(11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 5 for generator 19. -/
def rs_R010_ueqv_R010YY_partial_19_0005 : Poly :=
[
  term ((-3584 : Rat) / 25) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 5 for generator 19. -/
theorem rs_R010_ueqv_R010YY_partial_19_0005_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_19_0005
        rs_R010_ueqv_R010YY_generator_19_0000_0007 =
      rs_R010_ueqv_R010YY_partial_19_0005 := by
  native_decide

/-- Coefficient term 6 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YY_coefficient_19_0006 : Poly :=
[
  term ((1792 : Rat) / 25) [(11, 1), (15, 1), (16, 1)]
]

/-- Partial product 6 for generator 19. -/
def rs_R010_ueqv_R010YY_partial_19_0006 : Poly :=
[
  term ((3584 : Rat) / 25) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 6 for generator 19. -/
theorem rs_R010_ueqv_R010YY_partial_19_0006_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_19_0006
        rs_R010_ueqv_R010YY_generator_19_0000_0007 =
      rs_R010_ueqv_R010YY_partial_19_0006 := by
  native_decide

/-- Coefficient term 7 from coefficient polynomial 19. -/
def rs_R010_ueqv_R010YY_coefficient_19_0007 : Poly :=
[
  term ((29408 : Rat) / 25) [(15, 2), (16, 1)]
]

/-- Partial product 7 for generator 19. -/
def rs_R010_ueqv_R010YY_partial_19_0007 : Poly :=
[
  term ((58816 : Rat) / 25) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((-29408 : Rat) / 25) [(4, 2), (15, 2), (16, 1)],
  term ((58816 : Rat) / 25) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-29408 : Rat) / 25) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 7 for generator 19. -/
theorem rs_R010_ueqv_R010YY_partial_19_0007_valid :
    mulPoly rs_R010_ueqv_R010YY_coefficient_19_0007
        rs_R010_ueqv_R010YY_generator_19_0000_0007 =
      rs_R010_ueqv_R010YY_partial_19_0007 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YY_partials_19_0000_0007 : List Poly :=
[
  rs_R010_ueqv_R010YY_partial_19_0000,
  rs_R010_ueqv_R010YY_partial_19_0001,
  rs_R010_ueqv_R010YY_partial_19_0002,
  rs_R010_ueqv_R010YY_partial_19_0003,
  rs_R010_ueqv_R010YY_partial_19_0004,
  rs_R010_ueqv_R010YY_partial_19_0005,
  rs_R010_ueqv_R010YY_partial_19_0006,
  rs_R010_ueqv_R010YY_partial_19_0007
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YY_block_19_0000_0007 : Poly :=
[
  term ((-56128 : Rat) / 25) [(1, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 1), (4, 2), (15, 1), (16, 1)],
  term ((-56128 : Rat) / 25) [(1, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((28064 : Rat) / 25) [(1, 1), (5, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (4, 1), (8, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(3, 1), (4, 2), (15, 1), (16, 1)],
  term ((-2688 : Rat) / 25) [(3, 1), (5, 1), (9, 1), (15, 1), (16, 1)],
  term ((1344 : Rat) / 25) [(3, 1), (5, 2), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 1), (7, 1), (8, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (8, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(4, 1), (8, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(4, 1), (8, 1), (11, 1), (15, 1), (16, 1)],
  term ((58816 : Rat) / 25) [(4, 1), (8, 1), (15, 2), (16, 1)],
  term ((448 : Rat) / 25) [(4, 2), (7, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(4, 2), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(4, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(4, 2), (11, 1), (15, 1), (16, 1)],
  term ((-29408 : Rat) / 25) [(4, 2), (15, 2), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((3584 : Rat) / 25) [(5, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((58816 : Rat) / 25) [(5, 1), (9, 1), (15, 2), (16, 1)],
  term ((-3584 : Rat) / 25) [(5, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 1), (9, 2), (15, 1), (16, 1)],
  term ((448 : Rat) / 25) [(5, 2), (7, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-896 : Rat) / 25) [(5, 2), (9, 1), (15, 1), (16, 1)],
  term ((1792 : Rat) / 25) [(5, 2), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1792 : Rat) / 25) [(5, 2), (11, 1), (15, 1), (16, 1)],
  term ((-29408 : Rat) / 25) [(5, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 19, terms 0 through 7. -/
theorem rs_R010_ueqv_R010YY_block_19_0000_0007_valid :
    checkProductSumEq rs_R010_ueqv_R010YY_partials_19_0000_0007
      rs_R010_ueqv_R010YY_block_19_0000_0007 = true := by
  native_decide

end R010UeqvR010YYTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
