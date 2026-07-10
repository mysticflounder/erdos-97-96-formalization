/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Relaxed split surplus certificate R010:u=v:R010YNN, term block 4:400-499

This generated module checks partial products for one block of an internally
sharded relaxed pinned-surplus split certificate.
-/

namespace Problem97

namespace SurplusCertificate

namespace RelaxedSplit

open Problem97.EndpointCertificate

namespace R010UeqvR010YNNTermShards

/-- Generator polynomial 4 for relaxed split surplus certificate `R010:u=v:R010YNN`. -/
def rs_R010_ueqv_R010YNN_generator_04_0400_0499 : Poly :=
[
  term (-2 : Rat) [(6, 1)],
  term (1 : Rat) [(6, 2)],
  term (1 : Rat) [(7, 2)],
  term (2 : Rat) [(12, 1)],
  term (-1 : Rat) [(12, 2)],
  term (-1 : Rat) [(13, 2)]
]

/-- Coefficient term 400 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0400 : Poly :=
[
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 400 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0400 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (6, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 400 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0400_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0400
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0400 := by
  native_decide

/-- Coefficient term 401 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0401 : Poly :=
[
  term ((36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 401 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0401 : Poly :=
[
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 401 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0401_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0401
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0401 := by
  native_decide

/-- Coefficient term 402 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0402 : Poly :=
[
  term ((226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 402 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0402 : Poly :=
[
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 402 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0402_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0402
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0402 := by
  native_decide

/-- Coefficient term 403 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0403 : Poly :=
[
  term ((11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 403 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0403 : Poly :=
[
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 403 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0403_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0403
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0403 := by
  native_decide

/-- Coefficient term 404 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0404 : Poly :=
[
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (16, 1)]
]

/-- Partial product 404 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0404 : Poly :=
[
  term ((8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (8, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (8, 1), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (8, 1), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 2), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 404 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0404_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0404
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0404 := by
  native_decide

/-- Coefficient term 405 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0405 : Poly :=
[
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 405 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0405 : Poly :=
[
  term ((3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 405 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0405_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0405
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0405 := by
  native_decide

/-- Coefficient term 406 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0406 : Poly :=
[
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 406 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0406 : Poly :=
[
  term ((847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 406 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0406_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0406
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0406 := by
  native_decide

/-- Coefficient term 407 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0407 : Poly :=
[
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (16, 1)]
]

/-- Partial product 407 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0407 : Poly :=
[
  term ((55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 407 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0407_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0407
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0407 := by
  native_decide

/-- Coefficient term 408 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0408 : Poly :=
[
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 408 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0408 : Poly :=
[
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 408 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0408_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0408
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0408 := by
  native_decide

/-- Coefficient term 409 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0409 : Poly :=
[
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 409 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0409 : Poly :=
[
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 409 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0409_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0409
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0409 := by
  native_decide

/-- Coefficient term 410 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0410 : Poly :=
[
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (16, 1)]
]

/-- Partial product 410 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0410 : Poly :=
[
  term ((37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (16, 1)],
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (9, 2), (16, 1)],
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (9, 2), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 2), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 410 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0410_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0410
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0410 := by
  native_decide

/-- Coefficient term 411 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0411 : Poly :=
[
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 411 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0411 : Poly :=
[
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (6, 2), (9, 3), (15, 1), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (7, 2), (9, 3), (15, 1), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 411 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0411_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0411
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0411 := by
  native_decide

/-- Coefficient term 412 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0412 : Poly :=
[
  term ((3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (16, 1)]
]

/-- Partial product 412 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0412 : Poly :=
[
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 412 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0412_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0412
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0412 := by
  native_decide

/-- Coefficient term 413 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0413 : Poly :=
[
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 413 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0413 : Poly :=
[
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 413 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0413_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0413
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0413 := by
  native_decide

/-- Coefficient term 414 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0414 : Poly :=
[
  term (-4 : Rat) [(3, 1), (15, 1), (16, 1)]
]

/-- Partial product 414 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0414 : Poly :=
[
  term (8 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 414 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0414_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0414
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0414 := by
  native_decide

/-- Coefficient term 415 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0415 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 415 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0415 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 1), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 415 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0415_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0415
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0415 := by
  native_decide

/-- Coefficient term 416 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0416 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 416 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0416 : Poly :=
[
  term ((34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((-69626683816345600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 1), (11, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 416 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0416_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0416
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0416 := by
  native_decide

/-- Coefficient term 417 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0417 : Poly :=
[
  term ((-197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)]
]

/-- Partial product 417 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0417 : Poly :=
[
  term ((-197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((395005826415140048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 417 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0417_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0417
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0417 := by
  native_decide

/-- Coefficient term 418 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0418 : Poly :=
[
  term ((-95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 418 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0418 : Poly :=
[
  term ((-95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((191473380494950400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 3), (9, 2), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 418 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0418_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0418
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0418 := by
  native_decide

/-- Coefficient term 419 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0419 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 419 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0419 : Poly :=
[
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 419 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0419_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0419
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0419 := by
  native_decide

/-- Coefficient term 420 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0420 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)]
]

/-- Partial product 420 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0420 : Poly :=
[
  term ((278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 3), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (12, 2), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (13, 2), (16, 1)],
  term ((-557013470530764800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 3), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 420 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0420_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0420
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0420 := by
  native_decide

/-- Coefficient term 421 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0421 : Poly :=
[
  term ((501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)]
]

/-- Partial product 421 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0421 : Poly :=
[
  term ((501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((1003729741692938948 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((-501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-1003729741692938948 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 421 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0421_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0421
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0421 := by
  native_decide

/-- Coefficient term 422 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0422 : Poly :=
[
  term ((-43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 422 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0422 : Poly :=
[
  term ((86031302831488000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 3), (8, 1), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 422 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0422_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0422
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0422 := by
  native_decide

/-- Coefficient term 423 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0423 : Poly :=
[
  term ((-78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 423 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0423 : Poly :=
[
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (8, 1), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 423 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0423_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0423
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0423 := by
  native_decide

/-- Coefficient term 424 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0424 : Poly :=
[
  term ((-53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 424 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0424 : Poly :=
[
  term ((107610601457623040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (8, 1), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 424 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0424_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0424
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0424 := by
  native_decide

/-- Coefficient term 425 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0425 : Poly :=
[
  term ((-54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (16, 1)]
]

/-- Partial product 425 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0425 : Poly :=
[
  term ((108178885286362368908 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((-108178885286362368908 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((-54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 3), (8, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 425 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0425_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0425
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0425 := by
  native_decide

/-- Coefficient term 426 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0426 : Poly :=
[
  term ((20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 426 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0426 : Poly :=
[
  term ((-40281548246553600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 426 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0426_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0426
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0426 := by
  native_decide

/-- Coefficient term 427 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0427 : Poly :=
[
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 427 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0427 : Poly :=
[
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 3), (9, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 427 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0427_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0427
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0427 := by
  native_decide

/-- Coefficient term 428 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0428 : Poly :=
[
  term ((-16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 428 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0428 : Poly :=
[
  term ((32809238030284800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 3), (9, 2), (11, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 428 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0428_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0428
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0428 := by
  native_decide

/-- Coefficient term 429 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0429 : Poly :=
[
  term ((789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (15, 2), (16, 1)]
]

/-- Partial product 429 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0429 : Poly :=
[
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 3), (9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 429 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0429_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0429
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0429 := by
  native_decide

/-- Coefficient term 430 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0430 : Poly :=
[
  term ((-102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (16, 1)]
]

/-- Partial product 430 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0430 : Poly :=
[
  term ((205709475715932160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 430 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0430_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0430
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0430 := by
  native_decide

/-- Coefficient term 431 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0431 : Poly :=
[
  term ((-525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (15, 1), (16, 1)]
]

/-- Partial product 431 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0431 : Poly :=
[
  term ((1050741408711393280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 3), (9, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 431 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0431_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0431
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0431 := by
  native_decide

/-- Coefficient term 432 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0432 : Poly :=
[
  term ((-653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (16, 1)]
]

/-- Partial product 432 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0432 : Poly :=
[
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 432 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0432_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0432
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0432 := by
  native_decide

/-- Coefficient term 433 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0433 : Poly :=
[
  term ((25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (16, 1)]
]

/-- Partial product 433 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0433 : Poly :=
[
  term ((-51500840302832738036 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((51500840302832738036 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 433 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0433_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0433
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0433 := by
  native_decide

/-- Coefficient term 434 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0434 : Poly :=
[
  term ((3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 434 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0434 : Poly :=
[
  term ((-7202795609474160640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((7202795609474160640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 434 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0434_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0434
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0434 := by
  native_decide

/-- Coefficient term 435 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0435 : Poly :=
[
  term ((-14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 435 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0435 : Poly :=
[
  term ((28216596230681600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 435 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0435_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0435
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0435 := by
  native_decide

/-- Coefficient term 436 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0436 : Poly :=
[
  term ((434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 436 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0436 : Poly :=
[
  term ((-868452760721342720 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 436 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0436_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0436
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0436 := by
  native_decide

/-- Coefficient term 437 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0437 : Poly :=
[
  term ((319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 437 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0437 : Poly :=
[
  term ((-639507676356321920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((639507676356321920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 437 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0437_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0437
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0437 := by
  native_decide

/-- Coefficient term 438 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0438 : Poly :=
[
  term ((547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 438 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0438 : Poly :=
[
  term ((-1094512650554408960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((1094512650554408960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 438 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0438_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0438
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0438 := by
  native_decide

/-- Coefficient term 439 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0439 : Poly :=
[
  term ((2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 439 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0439 : Poly :=
[
  term ((-5206481319421921280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((5206481319421921280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 439 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0439_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0439
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0439 := by
  native_decide

/-- Coefficient term 440 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0440 : Poly :=
[
  term ((-2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (16, 1)]
]

/-- Partial product 440 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0440 : Poly :=
[
  term ((4146946454607973244 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((-2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((-4146946454607973244 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 440 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0440_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0440
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0440 := by
  native_decide

/-- Coefficient term 441 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0441 : Poly :=
[
  term ((263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (15, 1), (16, 1)]
]

/-- Partial product 441 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0441 : Poly :=
[
  term ((-527253835876593590744 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((527253835876593590744 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 441 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0441_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0441
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0441 := by
  native_decide

/-- Coefficient term 442 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0442 : Poly :=
[
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)]
]

/-- Partial product 442 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0442 : Poly :=
[
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 442 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0442_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0442
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0442 := by
  native_decide

/-- Coefficient term 443 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0443 : Poly :=
[
  term ((-13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 443 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0443 : Poly :=
[
  term ((26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 443 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0443_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0443
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0443 := by
  native_decide

/-- Coefficient term 444 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0444 : Poly :=
[
  term ((-58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 444 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0444 : Poly :=
[
  term ((117071074683241343324 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((-58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((-58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((-117071074683241343324 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 444 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0444_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0444
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0444 := by
  native_decide

/-- Coefficient term 445 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0445 : Poly :=
[
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 445 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0445 : Poly :=
[
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 445 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0445_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0445
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0445 := by
  native_decide

/-- Coefficient term 446 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0446 : Poly :=
[
  term ((-3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 446 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0446 : Poly :=
[
  term ((6448371121561600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 446 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0446_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0446
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0446 := by
  native_decide

/-- Coefficient term 447 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0447 : Poly :=
[
  term ((-3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 447 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0447 : Poly :=
[
  term ((6342272947038542080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-6342272947038542080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 447 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0447_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0447
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0447 := by
  native_decide

/-- Coefficient term 448 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0448 : Poly :=
[
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 448 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0448 : Poly :=
[
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 448 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0448_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0448
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0448 := by
  native_decide

/-- Coefficient term 449 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0449 : Poly :=
[
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (14, 1), (16, 1)]
]

/-- Partial product 449 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0449 : Poly :=
[
  term ((53428896465459200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-53428896465459200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 449 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0449_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0449
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0449 := by
  native_decide

/-- Coefficient term 450 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0450 : Poly :=
[
  term ((199400989557190400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (16, 1)]
]

/-- Partial product 450 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0450 : Poly :=
[
  term ((-398801979114380800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((199400989557190400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((199400989557190400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((398801979114380800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-199400989557190400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((-199400989557190400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 450 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0450_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0450
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0450 := by
  native_decide

/-- Coefficient term 451 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0451 : Poly :=
[
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 451 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0451 : Poly :=
[
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 451 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0451_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0451
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0451 := by
  native_decide

/-- Coefficient term 452 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0452 : Poly :=
[
  term ((-842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (14, 1), (16, 1)]
]

/-- Partial product 452 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0452 : Poly :=
[
  term ((1685478196714672507472 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((-842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1685478196714672507472 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 452 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0452_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0452
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0452 := by
  native_decide

/-- Coefficient term 453 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0453 : Poly :=
[
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (15, 2), (16, 1)]
]

/-- Partial product 453 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0453 : Poly :=
[
  term ((2289557278265358080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (13, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 453 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0453_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0453
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0453 := by
  native_decide

/-- Coefficient term 454 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0454 : Poly :=
[
  term ((-1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (16, 1)]
]

/-- Partial product 454 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0454 : Poly :=
[
  term ((3823922968166103352 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((-1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((-3823922968166103352 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 454 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0454_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0454
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0454 := by
  native_decide

/-- Coefficient term 455 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0455 : Poly :=
[
  term ((27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 455 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0455 : Poly :=
[
  term ((-54383689375769600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((54383689375769600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 455 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0455_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0455
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0455 := by
  native_decide

/-- Coefficient term 456 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0456 : Poly :=
[
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 456 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0456 : Poly :=
[
  term ((10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 456 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0456_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0456
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0456 := by
  native_decide

/-- Coefficient term 457 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0457 : Poly :=
[
  term ((462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 457 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0457 : Poly :=
[
  term ((-924542676245493760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((924542676245493760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 457 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0457_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0457
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0457 := by
  native_decide

/-- Coefficient term 458 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0458 : Poly :=
[
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 458 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0458 : Poly :=
[
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 458 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0458_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0458
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0458 := by
  native_decide

/-- Coefficient term 459 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0459 : Poly :=
[
  term ((538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 459 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0459 : Poly :=
[
  term ((-1076261730530560000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((1076261730530560000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 459 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0459_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0459
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0459 := by
  native_decide

/-- Coefficient term 460 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0460 : Poly :=
[
  term ((-45340098681095680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (16, 1)]
]

/-- Partial product 460 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0460 : Poly :=
[
  term ((90680197362191360 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-45340098681095680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((-45340098681095680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-90680197362191360 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((45340098681095680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((45340098681095680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 460 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0460_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0460
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0460 := by
  native_decide

/-- Coefficient term 461 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0461 : Poly :=
[
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 461 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0461 : Poly :=
[
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 461 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0461_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0461
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0461 := by
  native_decide

/-- Coefficient term 462 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0462 : Poly :=
[
  term ((-2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 462 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0462 : Poly :=
[
  term ((4750053127536640 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 462 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0462_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0462
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0462 := by
  native_decide

/-- Coefficient term 463 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0463 : Poly :=
[
  term ((-1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 463 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0463 : Poly :=
[
  term ((3702641550847708952992 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-3702641550847708952992 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 463 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0463_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0463
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0463 := by
  native_decide

/-- Coefficient term 464 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0464 : Poly :=
[
  term ((-200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (10, 1), (16, 1)]
]

/-- Partial product 464 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0464 : Poly :=
[
  term ((401204141444341760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((-200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 3), (10, 1), (16, 1)],
  term ((-200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((-401204141444341760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (10, 1), (12, 2), (16, 1)],
  term ((200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (10, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 464 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0464_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0464
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0464 := by
  native_decide

/-- Coefficient term 465 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0465 : Poly :=
[
  term ((63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (15, 1), (16, 1)]
]

/-- Partial product 465 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0465 : Poly :=
[
  term ((-127103842707251200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 465 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0465_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0465
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0465 := by
  native_decide

/-- Coefficient term 466 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0466 : Poly :=
[
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 466 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0466 : Poly :=
[
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 466 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0466_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0466
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0466 := by
  native_decide

/-- Coefficient term 467 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0467 : Poly :=
[
  term ((-342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (14, 1), (16, 1)]
]

/-- Partial product 467 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0467 : Poly :=
[
  term ((684723763646218240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 3), (14, 1), (16, 1)],
  term ((-342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 3), (14, 1), (16, 1)],
  term ((-684723763646218240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 2), (14, 1), (16, 1)],
  term ((342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 467 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0467_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0467
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0467 := by
  native_decide

/-- Coefficient term 468 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0468 : Poly :=
[
  term ((260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (16, 1)]
]

/-- Partial product 468 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0468 : Poly :=
[
  term ((-521146146567925760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 3), (16, 1)],
  term ((260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 3), (16, 1)],
  term ((521146146567925760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 1), (16, 1)],
  term ((-260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 2), (16, 1)],
  term ((-260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 468 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0468_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0468
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0468 := by
  native_decide

/-- Coefficient term 469 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0469 : Poly :=
[
  term ((-717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (15, 1), (16, 1)]
]

/-- Partial product 469 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0469 : Poly :=
[
  term ((1435727629753876480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 4), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 4), (15, 1), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 4), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (12, 2), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 469 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0469_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0469
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0469 := by
  native_decide

/-- Coefficient term 470 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0470 : Poly :=
[
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 470 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0470 : Poly :=
[
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 470 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0470_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0470
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0470 := by
  native_decide

/-- Coefficient term 471 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0471 : Poly :=
[
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 471 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0471 : Poly :=
[
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 471 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0471_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0471
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0471 := by
  native_decide

/-- Coefficient term 472 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0472 : Poly :=
[
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 472 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0472 : Poly :=
[
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 472 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0472_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0472
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0472 := by
  native_decide

/-- Coefficient term 473 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0473 : Poly :=
[
  term ((24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 473 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0473 : Poly :=
[
  term ((-49343490187415346076 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((49343490187415346076 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 473 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0473_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0473
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0473 := by
  native_decide

/-- Coefficient term 474 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0474 : Poly :=
[
  term ((-40023408056843629378 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (16, 1)]
]

/-- Partial product 474 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0474 : Poly :=
[
  term ((80046816113687258756 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((-40023408056843629378 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-40023408056843629378 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-80046816113687258756 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((40023408056843629378 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((40023408056843629378 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 474 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0474_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0474
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0474 := by
  native_decide

/-- Coefficient term 475 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0475 : Poly :=
[
  term ((-10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 475 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0475 : Poly :=
[
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term ((-10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term ((-10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 475 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0475_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0475
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0475 := by
  native_decide

/-- Coefficient term 476 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0476 : Poly :=
[
  term (2 : Rat) [(4, 1), (5, 1), (13, 1), (16, 1)]
]

/-- Partial product 476 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0476 : Poly :=
[
  term (-4 : Rat) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 476 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0476_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0476
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0476 := by
  native_decide

/-- Coefficient term 477 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0477 : Poly :=
[
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 477 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0477 : Poly :=
[
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 477 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0477_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0477
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0477 := by
  native_decide

/-- Coefficient term 478 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0478 : Poly :=
[
  term ((-57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (15, 1), (16, 1)]
]

/-- Partial product 478 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0478 : Poly :=
[
  term ((115796023708945215488 : Rat) / 89830441576176585) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((-57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-115796023708945215488 : Rat) / 89830441576176585) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 478 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0478_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0478
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0478 := by
  native_decide

/-- Coefficient term 479 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0479 : Poly :=
[
  term ((-329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 479 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0479 : Poly :=
[
  term ((-329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-658929702405729920 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((658929702405729920 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 3), (9, 1), (11, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 479 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0479_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0479
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0479 := by
  native_decide

/-- Coefficient term 480 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0480 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (16, 1)]
]

/-- Partial product 480 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0480 : Poly :=
[
  term ((-18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (12, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (13, 2), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 2), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 3), (9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 480 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0480_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0480
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0480 := by
  native_decide

/-- Coefficient term 481 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0481 : Poly :=
[
  term ((2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (16, 1)]
]

/-- Partial product 481 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0481 : Poly :=
[
  term ((-4084947824446715776 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((4084947824446715776 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 3), (8, 1), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 481 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0481_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0481
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0481 := by
  native_decide

/-- Coefficient term 482 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0482 : Poly :=
[
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (16, 1)]
]

/-- Partial product 482 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0482 : Poly :=
[
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 3), (9, 1), (10, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 482 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0482_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0482
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0482 := by
  native_decide

/-- Coefficient term 483 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0483 : Poly :=
[
  term ((-5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (16, 1)]
]

/-- Partial product 483 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0483 : Poly :=
[
  term ((10955545468596454528 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((-10955545468596454528 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((-5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 3), (9, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 483 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0483_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0483
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0483 := by
  native_decide

/-- Coefficient term 484 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0484 : Poly :=
[
  term ((5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (15, 1), (16, 1)]
]

/-- Partial product 484 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0484 : Poly :=
[
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 3), (9, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 484 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0484_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0484
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0484 := by
  native_decide

/-- Coefficient term 485 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0485 : Poly :=
[
  term ((-79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 485 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0485 : Poly :=
[
  term ((158648048355215488 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-158648048355215488 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 485 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0485_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0485
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0485 := by
  native_decide

/-- Coefficient term 486 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0486 : Poly :=
[
  term ((286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 486 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0486 : Poly :=
[
  term ((-572860073961025345792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((572860073961025345792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 486 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0486_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0486
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0486 := by
  native_decide

/-- Coefficient term 487 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0487 : Poly :=
[
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (16, 1)]
]

/-- Partial product 487 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0487 : Poly :=
[
  term ((59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 487 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0487_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0487
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0487 := by
  native_decide

/-- Coefficient term 488 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0488 : Poly :=
[
  term ((-241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (16, 1)]
]

/-- Partial product 488 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0488 : Poly :=
[
  term ((483182297728022828392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 2), (8, 1), (16, 1)],
  term ((-241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (7, 2), (8, 1), (16, 1)],
  term ((-483182297728022828392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (12, 2), (16, 1)],
  term ((241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 488 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0488_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0488
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0488 := by
  native_decide

/-- Coefficient term 489 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0489 : Poly :=
[
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (16, 1)]
]

/-- Partial product 489 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0489 : Poly :=
[
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 489 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0489_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0489
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0489 := by
  native_decide

/-- Coefficient term 490 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0490 : Poly :=
[
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 1), (16, 1)]
]

/-- Partial product 490 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0490 : Poly :=
[
  term ((-824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 490 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0490_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0490
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0490 := by
  native_decide

/-- Coefficient term 491 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0491 : Poly :=
[
  term ((4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (15, 1), (16, 1)]
]

/-- Partial product 491 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0491 : Poly :=
[
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 491 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0491_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0491
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0491 := by
  native_decide

/-- Coefficient term 492 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0492 : Poly :=
[
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)]
]

/-- Partial product 492 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0492 : Poly :=
[
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 492 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0492_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0492
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0492 := by
  native_decide

/-- Coefficient term 493 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0493 : Poly :=
[
  term ((1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (11, 1), (14, 1), (16, 1)]
]

/-- Partial product 493 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0493 : Poly :=
[
  term ((-2544656041672678784 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((2544656041672678784 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((-1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 493 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0493_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0493
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0493 := by
  native_decide

/-- Coefficient term 494 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0494 : Poly :=
[
  term ((-673561983674105152 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (16, 1)]
]

/-- Partial product 494 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0494 : Poly :=
[
  term ((1347123967348210304 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-673561983674105152 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-673561983674105152 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-1347123967348210304 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((673561983674105152 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((673561983674105152 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 494 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0494_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0494
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0494 := by
  native_decide

/-- Coefficient term 495 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0495 : Poly :=
[
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 1), (16, 1)]
]

/-- Partial product 495 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0495 : Poly :=
[
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 495 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0495_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0495
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0495 := by
  native_decide

/-- Coefficient term 496 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0496 : Poly :=
[
  term ((-1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (14, 1), (16, 1)]
]

/-- Partial product 496 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0496 : Poly :=
[
  term ((3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 3), (14, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 496 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0496_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0496
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0496 := by
  native_decide

/-- Coefficient term 497 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0497 : Poly :=
[
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 1), (16, 1)]
]

/-- Partial product 497 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0497 : Poly :=
[
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 497 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0497_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0497
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0497 := by
  native_decide

/-- Coefficient term 498 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0498 : Poly :=
[
  term ((4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (14, 1), (15, 1), (16, 1)]
]

/-- Partial product 498 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0498 : Poly :=
[
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 498 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0498_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0498
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0498 := by
  native_decide

/-- Coefficient term 499 from coefficient polynomial 4. -/
def rs_R010_ueqv_R010YNN_coefficient_04_0499 : Poly :=
[
  term ((-19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (15, 1), (16, 1)]
]

/-- Partial product 499 for generator 4. -/
def rs_R010_ueqv_R010YNN_partial_04_0499 : Poly :=
[
  term ((38668458998334513808 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-38668458998334513808 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 499 for generator 4. -/
theorem rs_R010_ueqv_R010YNN_partial_04_0499_valid :
    mulPoly rs_R010_ueqv_R010YNN_coefficient_04_0499
        rs_R010_ueqv_R010YNN_generator_04_0400_0499 =
      rs_R010_ueqv_R010YNN_partial_04_0499 := by
  native_decide

/-- Partial products in this block. -/
def rs_R010_ueqv_R010YNN_partials_04_0400_0499 : List Poly :=
[
  rs_R010_ueqv_R010YNN_partial_04_0400,
  rs_R010_ueqv_R010YNN_partial_04_0401,
  rs_R010_ueqv_R010YNN_partial_04_0402,
  rs_R010_ueqv_R010YNN_partial_04_0403,
  rs_R010_ueqv_R010YNN_partial_04_0404,
  rs_R010_ueqv_R010YNN_partial_04_0405,
  rs_R010_ueqv_R010YNN_partial_04_0406,
  rs_R010_ueqv_R010YNN_partial_04_0407,
  rs_R010_ueqv_R010YNN_partial_04_0408,
  rs_R010_ueqv_R010YNN_partial_04_0409,
  rs_R010_ueqv_R010YNN_partial_04_0410,
  rs_R010_ueqv_R010YNN_partial_04_0411,
  rs_R010_ueqv_R010YNN_partial_04_0412,
  rs_R010_ueqv_R010YNN_partial_04_0413,
  rs_R010_ueqv_R010YNN_partial_04_0414,
  rs_R010_ueqv_R010YNN_partial_04_0415,
  rs_R010_ueqv_R010YNN_partial_04_0416,
  rs_R010_ueqv_R010YNN_partial_04_0417,
  rs_R010_ueqv_R010YNN_partial_04_0418,
  rs_R010_ueqv_R010YNN_partial_04_0419,
  rs_R010_ueqv_R010YNN_partial_04_0420,
  rs_R010_ueqv_R010YNN_partial_04_0421,
  rs_R010_ueqv_R010YNN_partial_04_0422,
  rs_R010_ueqv_R010YNN_partial_04_0423,
  rs_R010_ueqv_R010YNN_partial_04_0424,
  rs_R010_ueqv_R010YNN_partial_04_0425,
  rs_R010_ueqv_R010YNN_partial_04_0426,
  rs_R010_ueqv_R010YNN_partial_04_0427,
  rs_R010_ueqv_R010YNN_partial_04_0428,
  rs_R010_ueqv_R010YNN_partial_04_0429,
  rs_R010_ueqv_R010YNN_partial_04_0430,
  rs_R010_ueqv_R010YNN_partial_04_0431,
  rs_R010_ueqv_R010YNN_partial_04_0432,
  rs_R010_ueqv_R010YNN_partial_04_0433,
  rs_R010_ueqv_R010YNN_partial_04_0434,
  rs_R010_ueqv_R010YNN_partial_04_0435,
  rs_R010_ueqv_R010YNN_partial_04_0436,
  rs_R010_ueqv_R010YNN_partial_04_0437,
  rs_R010_ueqv_R010YNN_partial_04_0438,
  rs_R010_ueqv_R010YNN_partial_04_0439,
  rs_R010_ueqv_R010YNN_partial_04_0440,
  rs_R010_ueqv_R010YNN_partial_04_0441,
  rs_R010_ueqv_R010YNN_partial_04_0442,
  rs_R010_ueqv_R010YNN_partial_04_0443,
  rs_R010_ueqv_R010YNN_partial_04_0444,
  rs_R010_ueqv_R010YNN_partial_04_0445,
  rs_R010_ueqv_R010YNN_partial_04_0446,
  rs_R010_ueqv_R010YNN_partial_04_0447,
  rs_R010_ueqv_R010YNN_partial_04_0448,
  rs_R010_ueqv_R010YNN_partial_04_0449,
  rs_R010_ueqv_R010YNN_partial_04_0450,
  rs_R010_ueqv_R010YNN_partial_04_0451,
  rs_R010_ueqv_R010YNN_partial_04_0452,
  rs_R010_ueqv_R010YNN_partial_04_0453,
  rs_R010_ueqv_R010YNN_partial_04_0454,
  rs_R010_ueqv_R010YNN_partial_04_0455,
  rs_R010_ueqv_R010YNN_partial_04_0456,
  rs_R010_ueqv_R010YNN_partial_04_0457,
  rs_R010_ueqv_R010YNN_partial_04_0458,
  rs_R010_ueqv_R010YNN_partial_04_0459,
  rs_R010_ueqv_R010YNN_partial_04_0460,
  rs_R010_ueqv_R010YNN_partial_04_0461,
  rs_R010_ueqv_R010YNN_partial_04_0462,
  rs_R010_ueqv_R010YNN_partial_04_0463,
  rs_R010_ueqv_R010YNN_partial_04_0464,
  rs_R010_ueqv_R010YNN_partial_04_0465,
  rs_R010_ueqv_R010YNN_partial_04_0466,
  rs_R010_ueqv_R010YNN_partial_04_0467,
  rs_R010_ueqv_R010YNN_partial_04_0468,
  rs_R010_ueqv_R010YNN_partial_04_0469,
  rs_R010_ueqv_R010YNN_partial_04_0470,
  rs_R010_ueqv_R010YNN_partial_04_0471,
  rs_R010_ueqv_R010YNN_partial_04_0472,
  rs_R010_ueqv_R010YNN_partial_04_0473,
  rs_R010_ueqv_R010YNN_partial_04_0474,
  rs_R010_ueqv_R010YNN_partial_04_0475,
  rs_R010_ueqv_R010YNN_partial_04_0476,
  rs_R010_ueqv_R010YNN_partial_04_0477,
  rs_R010_ueqv_R010YNN_partial_04_0478,
  rs_R010_ueqv_R010YNN_partial_04_0479,
  rs_R010_ueqv_R010YNN_partial_04_0480,
  rs_R010_ueqv_R010YNN_partial_04_0481,
  rs_R010_ueqv_R010YNN_partial_04_0482,
  rs_R010_ueqv_R010YNN_partial_04_0483,
  rs_R010_ueqv_R010YNN_partial_04_0484,
  rs_R010_ueqv_R010YNN_partial_04_0485,
  rs_R010_ueqv_R010YNN_partial_04_0486,
  rs_R010_ueqv_R010YNN_partial_04_0487,
  rs_R010_ueqv_R010YNN_partial_04_0488,
  rs_R010_ueqv_R010YNN_partial_04_0489,
  rs_R010_ueqv_R010YNN_partial_04_0490,
  rs_R010_ueqv_R010YNN_partial_04_0491,
  rs_R010_ueqv_R010YNN_partial_04_0492,
  rs_R010_ueqv_R010YNN_partial_04_0493,
  rs_R010_ueqv_R010YNN_partial_04_0494,
  rs_R010_ueqv_R010YNN_partial_04_0495,
  rs_R010_ueqv_R010YNN_partial_04_0496,
  rs_R010_ueqv_R010YNN_partial_04_0497,
  rs_R010_ueqv_R010YNN_partial_04_0498,
  rs_R010_ueqv_R010YNN_partial_04_0499
]

/-- Sum of partial products in this block. -/
def rs_R010_ueqv_R010YNN_block_04_0400_0499 : Poly :=
[
  term ((-41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (8, 1), (16, 1)],
  term ((3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (10, 1), (16, 1)],
  term ((-951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 1), (9, 2), (15, 2), (16, 1)],
  term ((37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (9, 2), (16, 1)],
  term ((-545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (6, 1), (9, 3), (15, 1), (16, 1)],
  term ((-7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 1), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (6, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (8, 1), (16, 1)],
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (9, 2), (10, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (6, 2), (9, 2), (15, 2), (16, 1)],
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (9, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (6, 2), (9, 3), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (6, 2), (16, 1)],
  term ((41612091580709377024 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (8, 1), (16, 1)],
  term ((-1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((-27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (9, 2), (10, 1), (16, 1)],
  term ((475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (7, 2), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (7, 2), (9, 2), (15, 2), (16, 1)],
  term ((-18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (9, 2), (16, 1)],
  term ((272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (7, 2), (9, 3), (15, 1), (16, 1)],
  term ((3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (7, 2), (16, 1)],
  term ((20806045790354688512 : Rat) / 29943480525392195) [(3, 1), (5, 3), (7, 3), (9, 2), (15, 1), (16, 1)],
  term ((72877330185324988928 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-36438665092662494464 : Rat) / 269491324728529755) [(3, 1), (5, 3), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((453263699805130717184 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-226631849902565358592 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((23071091705914013696 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((-11535545852957006848 : Rat) / 89830441576176585) [(3, 1), (5, 3), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-8221608130482072320 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 1), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (12, 2), (16, 1)],
  term ((4110804065241036160 : Rat) / 53898264945705951) [(3, 1), (5, 3), (8, 1), (13, 2), (16, 1)],
  term ((-3999270483386247168 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((1999635241693123584 : Rat) / 29943480525392195) [(3, 1), (5, 3), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-847286364886279029056 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((423643182443139514528 : Rat) / 269491324728529755) [(3, 1), (5, 3), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-55821242315950988800 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 1), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (12, 2), (16, 1)],
  term ((27910621157975494400 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (10, 1), (13, 2), (16, 1)],
  term ((951443666475008000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-475721833237504000 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-37878717490069609472 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (12, 2), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 3), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((18939358745034804736 : Rat) / 53898264945705951) [(3, 1), (5, 3), (9, 2), (13, 2), (16, 1)],
  term ((545168305078149951488 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((-272584152539074975744 : Rat) / 89830441576176585) [(3, 1), (5, 3), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((7588117570459953920 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 1), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (12, 2), (16, 1)],
  term ((-3794058785229976960 : Rat) / 53898264945705951) [(3, 1), (5, 3), (13, 2), (16, 1)],
  term ((18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-18825076031346534400 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((9412538015673267200 : Rat) / 17966088315235317) [(3, 1), (5, 4), (9, 2), (13, 2), (15, 1), (16, 1)],
  term (8 : Rat) [(3, 1), (6, 1), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (6, 2), (15, 1), (16, 1)],
  term (-4 : Rat) [(3, 1), (7, 2), (15, 1), (16, 1)],
  term (-8 : Rat) [(3, 1), (12, 1), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (12, 2), (15, 1), (16, 1)],
  term (4 : Rat) [(3, 1), (13, 2), (15, 1), (16, 1)],
  term ((86031302831488000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((107610601457623040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((108178885286362368908 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (7, 1), (8, 1), (16, 1)],
  term ((-40281548246553600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((550648821372147098248 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((32809238030284800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((-1579005019493350400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((205709475715932160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 2), (16, 1)],
  term ((1050741408711393280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 1), (10, 1), (16, 1)],
  term ((-51500840302832738036 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 1), (7, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (9, 3), (16, 1)],
  term ((501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (7, 2), (11, 1), (16, 1)],
  term ((-7202795609474160640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((28216596230681600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((-868452760721342720 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((-639507676356321920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 1), (16, 1)],
  term ((-1094512650554408960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((-5206481319421921280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((4146946454607973244 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (8, 1), (11, 1), (16, 1)],
  term ((-527253835876593590744 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 1), (8, 1), (15, 1), (16, 1)],
  term ((4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((117071074683241343324 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (9, 1), (10, 1), (16, 1)],
  term ((315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((6448371121561600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((6342272947038542080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((69626683816345600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((53428896465459200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((-398801979114380800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (11, 2), (16, 1)],
  term ((-395005826415140048 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 1), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (12, 2), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (13, 2), (16, 1)],
  term ((1685478196714672507472 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 1), (9, 1), (14, 1), (16, 1)],
  term ((2289557278265358080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 1), (15, 2), (16, 1)],
  term ((3823922968166103352 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (9, 1), (16, 1)],
  term ((-54383689375769600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((-924542676245493760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((-191473380494950400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-1076261730530560000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((90680197362191360 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (11, 1), (16, 1)],
  term ((-315801003898670080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((4750053127536640 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 1), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((3702641550847708952992 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (9, 2), (15, 1), (16, 1)],
  term ((401204141444341760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 3), (10, 1), (16, 1)],
  term ((-127103842707251200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((557013470530764800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (12, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (12, 2), (16, 1)],
  term ((2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (9, 3), (13, 2), (16, 1)],
  term ((684723763646218240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 3), (14, 1), (16, 1)],
  term ((-521146146567925760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 3), (16, 1)],
  term ((1435727629753876480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 1), (9, 4), (15, 1), (16, 1)],
  term ((80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (10, 1), (13, 1), (16, 1)],
  term ((100621572016788789928 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (10, 1), (15, 1), (16, 1)],
  term ((1003729741692938948 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 1), (16, 1)],
  term ((-501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (12, 2), (16, 1)],
  term ((25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((-501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 1), (11, 1), (13, 2), (16, 1)],
  term ((-49343490187415346076 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 1), (11, 1), (14, 1), (16, 1)],
  term ((80046816113687258756 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 1), (11, 1), (16, 1)],
  term ((20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (13, 1), (14, 1), (16, 1)],
  term (-4 : Rat) [(4, 1), (5, 1), (6, 1), (13, 1), (16, 1)],
  term ((50948254326944698432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 1), (14, 1), (15, 1), (16, 1)],
  term ((115796023708945215488 : Rat) / 89830441576176585) [(4, 1), (5, 1), (6, 1), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (7, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (8, 1), (9, 2), (16, 1)],
  term ((-54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (7, 1), (8, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 1), (11, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 2), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (7, 1), (9, 3), (15, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (7, 1), (10, 1), (16, 1)],
  term ((25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 2), (7, 1), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 1), (16, 1)],
  term ((547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (8, 1), (11, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (6, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (9, 1), (10, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-1162312492472647040 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((129774305740844800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (11, 2), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (6, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 1), (15, 2), (16, 1)],
  term ((2654394725431816508 : Rat) / 449152207880882925) [(4, 1), (5, 1), (6, 2), (9, 1), (16, 1)],
  term ((27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((55453084451663360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 2), (11, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (6, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1843425750326387724496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (9, 2), (15, 1), (16, 1)],
  term ((-200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 3), (10, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 3), (14, 1), (16, 1)],
  term ((224705749321123840 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 2), (9, 3), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 2), (9, 4), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (10, 1), (13, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (10, 1), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (6, 2), (11, 1), (14, 1), (16, 1)],
  term ((-145163467712854361834 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (11, 1), (16, 1)],
  term ((-10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (6, 2), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (6, 2), (14, 1), (15, 1), (16, 1)],
  term ((-57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (6, 2), (15, 1), (16, 1)],
  term ((157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((34813341908172800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 1), (11, 2), (16, 1)],
  term ((-197502913207570024 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 1), (16, 1)],
  term ((-95736690247475200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (6, 3), (9, 2), (11, 1), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 2), (15, 1), (16, 1)],
  term ((278506735265382400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (9, 3), (16, 1)],
  term ((501864870846469474 : Rat) / 53898264945705951) [(4, 1), (5, 1), (6, 3), (11, 1), (16, 1)],
  term ((-86031302831488000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-157900501949335040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-107610601457623040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-108178885286362368908 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 1), (16, 1)],
  term ((54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (12, 2), (16, 1)],
  term ((54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (8, 1), (13, 2), (16, 1)],
  term ((40281548246553600 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-550648821372147098248 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-32809238030284800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 1), (9, 2), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((1579005019493350400 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (15, 2), (16, 1)],
  term ((-205709475715932160 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 1), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 2), (15, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (12, 2), (16, 1)],
  term ((-789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2), (15, 2), (16, 1)],
  term ((102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (9, 2), (13, 2), (16, 1)],
  term ((-1050741408711393280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (12, 1), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (12, 2), (15, 1), (16, 1)],
  term ((525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 1), (9, 3), (13, 2), (15, 1), (16, 1)],
  term ((-1307161894653478076 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 1), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (12, 2), (16, 1)],
  term ((653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 1), (10, 1), (13, 2), (16, 1)],
  term ((51500840302832738036 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (12, 1), (16, 1)],
  term ((-25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (12, 2), (16, 1)],
  term ((-25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 1), (13, 2), (16, 1)],
  term ((3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 1), (11, 2), (16, 1)],
  term ((434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 1), (15, 2), (16, 1)],
  term ((319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 1), (16, 1)],
  term ((547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 2), (11, 1), (16, 1)],
  term ((2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (8, 1), (9, 2), (15, 1), (16, 1)],
  term ((-2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (8, 1), (11, 1), (16, 1)],
  term ((263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (7, 2), (8, 1), (15, 1), (16, 1)],
  term ((-2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (13, 1), (16, 1)],
  term ((-13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 1), (10, 1), (11, 1), (15, 1), (16, 1)],
  term ((-58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (9, 1), (10, 1), (16, 1)],
  term ((3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (13, 1), (14, 1), (16, 1)],
  term ((-3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 1), (15, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (13, 1), (15, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (14, 1), (16, 1)],
  term ((199400989557190400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (11, 2), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (9, 1), (13, 1), (15, 1), (16, 1)],
  term ((-842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (7, 2), (9, 1), (14, 1), (16, 1)],
  term ((-1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 1), (15, 2), (16, 1)],
  term ((-1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (9, 1), (16, 1)],
  term ((27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 2), (10, 1), (11, 1), (16, 1)],
  term ((-5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 2), (10, 1), (13, 1), (16, 1)],
  term ((462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (10, 1), (15, 1), (16, 1)],
  term ((571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (14, 1), (16, 1)],
  term ((-45340098681095680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 2), (11, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 2), (13, 1), (14, 1), (16, 1)],
  term ((-2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 2), (9, 2), (14, 1), (15, 1), (16, 1)],
  term ((-1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (9, 2), (15, 1), (16, 1)],
  term ((-200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 3), (10, 1), (16, 1)],
  term ((63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 3), (11, 1), (15, 1), (16, 1)],
  term ((-1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 2), (9, 3), (13, 1), (15, 1), (16, 1)],
  term ((-342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 3), (14, 1), (16, 1)],
  term ((260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 3), (16, 1)],
  term ((-717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 2), (9, 4), (15, 1), (16, 1)],
  term ((-40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (10, 1), (13, 1), (16, 1)],
  term ((-50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (10, 1), (15, 1), (16, 1)],
  term ((-12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (7, 2), (11, 1), (14, 1), (16, 1)],
  term ((-40023408056843629378 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 2), (11, 1), (16, 1)],
  term ((-10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (13, 1), (14, 1), (16, 1)],
  term (2 : Rat) [(4, 1), (5, 1), (7, 2), (13, 1), (16, 1)],
  term ((-25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 2), (14, 1), (15, 1), (16, 1)],
  term ((-57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (7, 2), (15, 1), (16, 1)],
  term ((-43015651415744000 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 3), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-78950250974667520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-53805300728811520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (8, 1), (9, 2), (16, 1)],
  term ((-54089442643181184454 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 3), (8, 1), (16, 1)],
  term ((20140774123276800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 3), (9, 1), (11, 1), (16, 1)],
  term ((-275324410686073549124 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (7, 3), (9, 1), (15, 1), (16, 1)],
  term ((-16404619015142400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (7, 3), (9, 2), (11, 1), (15, 1), (16, 1)],
  term ((789502509746675200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 3), (9, 2), (15, 2), (16, 1)],
  term ((-102854737857966080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (9, 2), (16, 1)],
  term ((-525370704355696640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (7, 3), (9, 3), (15, 1), (16, 1)],
  term ((-653580947326739038 : Rat) / 53898264945705951) [(4, 1), (5, 1), (7, 3), (10, 1), (16, 1)],
  term ((25750420151416369018 : Rat) / 449152207880882925) [(4, 1), (5, 1), (7, 3), (16, 1)],
  term ((7202795609474160640 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-3601397804737080320 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-28216596230681600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((14108298115340800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((868452760721342720 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((639507676356321920 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((-319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-434226380360671360 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((-319753838178160960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((1094512650554408960 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-547256325277204480 : Rat) / 53898264945705951) [(4, 1), (5, 1), (8, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((5206481319421921280 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-2603240659710960640 : Rat) / 17966088315235317) [(4, 1), (5, 1), (8, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-4146946454607973244 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 1), (16, 1)],
  term ((2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (12, 2), (16, 1)],
  term ((2073473227303986622 : Rat) / 269491324728529755) [(4, 1), (5, 1), (8, 1), (11, 1), (13, 2), (16, 1)],
  term ((527253835876593590744 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (12, 1), (15, 1), (16, 1)],
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (12, 2), (15, 1), (16, 1)],
  term ((-263626917938296795372 : Rat) / 149717402626960975) [(4, 1), (5, 1), (8, 1), (13, 2), (15, 1), (16, 1)],
  term ((-4228645478400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (13, 1), (16, 1)],
  term ((-26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (13, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((13357224116364800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((2114322739200 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (10, 1), (11, 1), (13, 3), (16, 1)],
  term ((-117071074683241343324 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((58535537341620671662 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((6777911812940800 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-6448371121561600 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-6342272947038542080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((3224185560780800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((3171136473519271040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-3388955906470400 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 1), (11, 1), (13, 3), (14, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-53428896465459200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (14, 1), (16, 1)],
  term ((398801979114380800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (14, 1), (16, 1)],
  term ((-199400989557190400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (12, 2), (16, 1)],
  term ((26714448232729600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 2), (14, 1), (16, 1)],
  term ((-199400989557190400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 2), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (11, 2), (13, 3), (15, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-1685478196714672507472 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (12, 1), (14, 1), (16, 1)],
  term ((-2289557278265358080 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (12, 1), (15, 2), (16, 1)],
  term ((-3823922968166103352 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (12, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (12, 2), (14, 1), (16, 1)],
  term ((1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (12, 2), (15, 2), (16, 1)],
  term ((1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (12, 2), (16, 1)],
  term ((842739098357336253736 : Rat) / 4042369870927946325) [(4, 1), (5, 1), (9, 1), (13, 2), (14, 1), (16, 1)],
  term ((1144778639132679040 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 1), (13, 2), (15, 2), (16, 1)],
  term ((1911961484083051676 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 1), (13, 2), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 1), (9, 1), (13, 3), (15, 1), (16, 1)],
  term ((54383689375769600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-27191844687884800 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 2), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((-10018138818652160 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((924542676245493760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-462271338122746880 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((5009069409326080 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (10, 1), (13, 3), (16, 1)],
  term ((1143047210942443520 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((1076261730530560000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-90680197362191360 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 1), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((45340098681095680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (12, 2), (16, 1)],
  term ((-538130865265280000 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((45340098681095680 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 2), (16, 1)],
  term ((-571523605471221760 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((-4750053127536640 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-3702641550847708952992 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((2375026563768320 : Rat) / 5988696105078439) [(4, 1), (5, 1), (9, 2), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((1851320775423854476496 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 2), (13, 3), (14, 1), (16, 1)],
  term ((-401204141444341760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (10, 1), (12, 1), (16, 1)],
  term ((200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (10, 1), (12, 2), (16, 1)],
  term ((200602070722170880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (10, 1), (13, 2), (16, 1)],
  term ((127103842707251200 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (12, 1), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (12, 2), (15, 1), (16, 1)],
  term ((-63551921353625600 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (11, 1), (13, 2), (15, 1), (16, 1)],
  term ((-2160186941291724800 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((-684723763646218240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 1), (14, 1), (16, 1)],
  term ((521146146567925760 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 1), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 2), (14, 1), (16, 1)],
  term ((-260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (12, 2), (16, 1)],
  term ((342361881823109120 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (13, 2), (14, 1), (16, 1)],
  term ((-260573073283962880 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 3), (13, 2), (16, 1)],
  term ((1080093470645862400 : Rat) / 53898264945705951) [(4, 1), (5, 1), (9, 3), (13, 3), (15, 1), (16, 1)],
  term ((-1435727629753876480 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (12, 1), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (12, 2), (15, 1), (16, 1)],
  term ((717863814876938240 : Rat) / 17966088315235317) [(4, 1), (5, 1), (9, 4), (13, 2), (15, 1), (16, 1)],
  term ((-80630722033113527776 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((-100621572016788789928 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((50310786008394394964 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((40315361016556763888 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (10, 1), (13, 3), (16, 1)],
  term ((-25808665688080488016 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((49343490187415346076 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-80046816113687258756 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 1), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((40023408056843629378 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (12, 2), (16, 1)],
  term ((-24671745093707673038 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((40023408056843629378 : Rat) / 449152207880882925) [(4, 1), (5, 1), (11, 1), (13, 2), (16, 1)],
  term ((12904332844040244008 : Rat) / 269491324728529755) [(4, 1), (5, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((-20773009113788164444 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term (4 : Rat) [(4, 1), (5, 1), (12, 1), (13, 1), (16, 1)],
  term ((-50948254326944698432 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-115796023708945215488 : Rat) / 89830441576176585) [(4, 1), (5, 1), (12, 1), (15, 1), (16, 1)],
  term ((10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (12, 2), (13, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (12, 2), (15, 1), (16, 1)],
  term ((25474127163472349216 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((57898011854472607744 : Rat) / 89830441576176585) [(4, 1), (5, 1), (13, 2), (15, 1), (16, 1)],
  term ((10386504556894082222 : Rat) / 1347456623642648775) [(4, 1), (5, 1), (13, 3), (14, 1), (16, 1)],
  term (-2 : Rat) [(4, 1), (5, 1), (13, 3), (16, 1)],
  term ((-4084947824446715776 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 1), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((-176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((10955545468596454528 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 1), (16, 1)],
  term ((-10403022895177344256 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 1), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (7, 2), (9, 2), (16, 1)],
  term ((158648048355215488 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((-572860073961025345792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (8, 1), (9, 2), (16, 1)],
  term ((483182297728022828392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 1), (8, 1), (16, 1)],
  term ((-86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((-824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((-8472359734483698944 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-658929702405729920 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((-2544656041672678784 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((1347123967348210304 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 1), (16, 1)],
  term ((-25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((-125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (13, 1), (16, 1)],
  term ((-9802639664947982336 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 1), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((38668458998334513808 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 1), (15, 1), (16, 1)],
  term ((-37122800135534080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (12, 1), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (12, 2), (16, 1)],
  term ((18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 1), (9, 2), (13, 2), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 2), (7, 1), (8, 1), (9, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (7, 1), (9, 1), (10, 1), (16, 1)],
  term ((-5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 2), (7, 1), (9, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (6, 2), (7, 1), (9, 2), (15, 1), (16, 1)],
  term ((-79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (8, 1), (9, 2), (16, 1)],
  term ((-241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (6, 2), (8, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (6, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-2767409341038296768 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (6, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 1), (15, 1), (16, 1)],
  term ((37122800135534080 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 2), (9, 2), (16, 1)],
  term ((-329464851202864960 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 3), (9, 1), (11, 1), (16, 1)],
  term ((-18561400067767040 : Rat) / 53898264945705951) [(4, 1), (5, 2), (6, 3), (9, 2), (16, 1)],
  term ((4084947824446715776 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 1), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (12, 2), (16, 1)],
  term ((-2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (8, 1), (9, 1), (13, 2), (16, 1)],
  term ((176333300643786880 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (12, 1), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (12, 2), (16, 1)],
  term ((-88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 1), (9, 1), (10, 1), (13, 2), (16, 1)],
  term ((-10955545468596454528 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (12, 1), (16, 1)],
  term ((5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (12, 2), (16, 1)],
  term ((5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 1), (9, 1), (13, 2), (16, 1)],
  term ((10403022895177344256 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (12, 1), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (12, 2), (15, 1), (16, 1)],
  term ((-5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 1), (9, 2), (13, 2), (15, 1), (16, 1)],
  term ((-79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (8, 1), (9, 1), (11, 1), (16, 1)],
  term ((286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (8, 1), (9, 1), (15, 1), (16, 1)],
  term ((-29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (8, 1), (9, 2), (16, 1)],
  term ((-241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (7, 2), (8, 1), (16, 1)],
  term ((43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (10, 1), (11, 1), (16, 1)],
  term ((412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 2), (9, 1), (10, 1), (13, 1), (16, 1)],
  term ((4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (10, 1), (15, 1), (16, 1)],
  term ((-1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (13, 1), (15, 1), (16, 1)],
  term ((1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (14, 1), (16, 1)],
  term ((-673561983674105152 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 1), (16, 1)],
  term ((12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (11, 2), (13, 1), (16, 1)],
  term ((-1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (13, 1), (14, 1), (16, 1)],
  term ((62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (13, 1), (16, 1)],
  term ((4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (7, 2), (9, 1), (14, 1), (15, 1), (16, 1)],
  term ((-19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (7, 2), (9, 1), (15, 1), (16, 1)],
  term ((2042473912223357888 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 3), (8, 1), (9, 1), (16, 1)],
  term ((88166650321893440 : Rat) / 17966088315235317) [(4, 1), (5, 2), (7, 3), (9, 1), (10, 1), (16, 1)],
  term ((-5477772734298227264 : Rat) / 89830441576176585) [(4, 1), (5, 2), (7, 3), (9, 1), (16, 1)],
  term ((5201511447588672128 : Rat) / 29943480525392195) [(4, 1), (5, 2), (7, 3), (9, 2), (15, 1), (16, 1)],
  term ((-158648048355215488 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((79324024177607744 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((572860073961025345792 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((-286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-286430036980512672896 : Rat) / 269491324728529755) [(4, 1), (5, 2), (8, 1), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((-59678560403660800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (12, 1), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (12, 2), (16, 1)],
  term ((29839280201830400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (8, 1), (9, 2), (13, 2), (16, 1)],
  term ((-483182297728022828392 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (12, 1), (16, 1)],
  term ((241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (12, 2), (16, 1)],
  term ((241591148864011414196 : Rat) / 1347456623642648775) [(4, 1), (5, 2), (8, 1), (13, 2), (16, 1)],
  term ((86490228328268800 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (12, 1), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (12, 2), (16, 1)],
  term ((-43245114164134400 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (10, 1), (11, 1), (13, 2), (16, 1)],
  term ((824473105066198016 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (13, 1), (16, 1)],
  term ((8472359734483698944 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 1), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4236179867241849472 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 2), (15, 1), (16, 1)],
  term ((-412236552533099008 : Rat) / 89830441576176585) [(4, 1), (5, 2), (9, 1), (10, 1), (13, 3), (16, 1)],
  term ((-2944774794302674432 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (13, 1), (15, 1), (16, 1)],
  term ((2544656041672678784 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (14, 1), (16, 1)],
  term ((-1347123967348210304 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 1), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (13, 1), (15, 1), (16, 1)],
  term ((-1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (14, 1), (16, 1)],
  term ((673561983674105152 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (12, 2), (16, 1)],
  term ((-1272328020836339392 : Rat) / 17966088315235317) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 2), (14, 1), (16, 1)],
  term ((673561983674105152 : Rat) / 29943480525392195) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 2), (16, 1)],
  term ((1472387397151337216 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 1), (13, 3), (15, 1), (16, 1)],
  term ((25387534520320000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 1), (13, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (12, 2), (13, 1), (16, 1)],
  term ((-12693767260160000 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (11, 2), (13, 3), (16, 1)],
  term ((-3386657545635599488 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (14, 1), (16, 1)],
  term ((125384932858721492512 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (13, 1), (16, 1)],
  term ((9802639664947982336 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 1), (14, 1), (15, 1), (16, 1)],
  term ((-38668458998334513808 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (12, 1), (15, 1), (16, 1)],
  term ((1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (13, 1), (14, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (13, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (12, 2), (14, 1), (15, 1), (16, 1)],
  term ((19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (12, 2), (15, 1), (16, 1)],
  term ((-4901319832473991168 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 2), (14, 1), (15, 1), (16, 1)],
  term ((19334229499167256904 : Rat) / 53898264945705951) [(4, 1), (5, 2), (9, 1), (13, 2), (15, 1), (16, 1)],
  term ((1693328772817799744 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 3), (14, 1), (16, 1)],
  term ((-62692466429360746256 : Rat) / 269491324728529755) [(4, 1), (5, 2), (9, 1), (13, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 4, terms 400 through 499. -/
theorem rs_R010_ueqv_R010YNN_block_04_0400_0499_valid :
    checkProductSumEq rs_R010_ueqv_R010YNN_partials_04_0400_0499
      rs_R010_ueqv_R010YNN_block_04_0400_0499 = true := by
  native_decide

end R010UeqvR010YNNTermShards

end RelaxedSplit

end SurplusCertificate

end Problem97
