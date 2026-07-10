/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_002, term block 28:700-701

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_002`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2002TermShards

/-- Generator polynomial 28 for endpoint certificate `ep_Q2_002`. -/
def ep_Q2_002_generator_28_0700_0701 : Poly :=
[
  term (-2 : Rat) [(0, 1), (14, 1)],
  term (1 : Rat) [(0, 2)],
  term (-2 : Rat) [(1, 1), (15, 1)],
  term (1 : Rat) [(1, 2)],
  term (2 : Rat) [(2, 1), (14, 1)],
  term (-1 : Rat) [(2, 2)],
  term (2 : Rat) [(3, 1), (15, 1)],
  term (-1 : Rat) [(3, 2)]
]

/-- Coefficient term 700 from coefficient polynomial 28. -/
def ep_Q2_002_coefficient_28_0700 : Poly :=
[
  term ((1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(15, 2)]
]

/-- Partial product 700 for generator 28. -/
def ep_Q2_002_partial_28_0700 : Poly :=
[
  term ((-1180733181787293988186298867831841739306467 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (14, 1), (15, 2)],
  term ((1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(0, 2), (15, 2)],
  term ((-1180733181787293988186298867831841739306467 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)],
  term ((1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(1, 2), (15, 2)],
  term ((1180733181787293988186298867831841739306467 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (14, 1), (15, 2)],
  term ((-1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(2, 2), (15, 2)],
  term ((1180733181787293988186298867831841739306467 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 3)],
  term ((-1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(3, 2), (15, 2)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 28. -/
theorem ep_Q2_002_partial_28_0700_valid :
    mulPoly ep_Q2_002_coefficient_28_0700
        ep_Q2_002_generator_28_0700_0701 =
      ep_Q2_002_partial_28_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 28. -/
def ep_Q2_002_coefficient_28_0701 : Poly :=
[
  term ((1929223333367 : Rat) / 177631613880) [(15, 2), (16, 1)]
]

/-- Partial product 701 for generator 28. -/
def ep_Q2_002_partial_28_0701 : Poly :=
[
  term ((-1929223333367 : Rat) / 88815806940) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((1929223333367 : Rat) / 177631613880) [(0, 2), (15, 2), (16, 1)],
  term ((-1929223333367 : Rat) / 88815806940) [(1, 1), (15, 3), (16, 1)],
  term ((1929223333367 : Rat) / 177631613880) [(1, 2), (15, 2), (16, 1)],
  term ((1929223333367 : Rat) / 88815806940) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1929223333367 : Rat) / 177631613880) [(2, 2), (15, 2), (16, 1)],
  term ((1929223333367 : Rat) / 88815806940) [(3, 1), (15, 3), (16, 1)],
  term ((-1929223333367 : Rat) / 177631613880) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 28. -/
theorem ep_Q2_002_partial_28_0701_valid :
    mulPoly ep_Q2_002_coefficient_28_0701
        ep_Q2_002_generator_28_0700_0701 =
      ep_Q2_002_partial_28_0701 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_002_partials_28_0700_0701 : List Poly :=
[
  ep_Q2_002_partial_28_0700,
  ep_Q2_002_partial_28_0701
]

/-- Sum of partial products in this block. -/
def ep_Q2_002_block_28_0700_0701 : Poly :=
[
  term ((-1180733181787293988186298867831841739306467 : Rat) / 1346818217520322526586147269553926167495) [(0, 1), (14, 1), (15, 2)],
  term ((-1929223333367 : Rat) / 88815806940) [(0, 1), (14, 1), (15, 2), (16, 1)],
  term ((1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(0, 2), (15, 2)],
  term ((1929223333367 : Rat) / 177631613880) [(0, 2), (15, 2), (16, 1)],
  term ((-1180733181787293988186298867831841739306467 : Rat) / 1346818217520322526586147269553926167495) [(1, 1), (15, 3)],
  term ((-1929223333367 : Rat) / 88815806940) [(1, 1), (15, 3), (16, 1)],
  term ((1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(1, 2), (15, 2)],
  term ((1929223333367 : Rat) / 177631613880) [(1, 2), (15, 2), (16, 1)],
  term ((1180733181787293988186298867831841739306467 : Rat) / 1346818217520322526586147269553926167495) [(2, 1), (14, 1), (15, 2)],
  term ((1929223333367 : Rat) / 88815806940) [(2, 1), (14, 1), (15, 2), (16, 1)],
  term ((-1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(2, 2), (15, 2)],
  term ((-1929223333367 : Rat) / 177631613880) [(2, 2), (15, 2), (16, 1)],
  term ((1180733181787293988186298867831841739306467 : Rat) / 1346818217520322526586147269553926167495) [(3, 1), (15, 3)],
  term ((1929223333367 : Rat) / 88815806940) [(3, 1), (15, 3), (16, 1)],
  term ((-1180733181787293988186298867831841739306467 : Rat) / 2693636435040645053172294539107852334990) [(3, 2), (15, 2)],
  term ((-1929223333367 : Rat) / 177631613880) [(3, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 28, terms 700 through 701. -/
theorem ep_Q2_002_block_28_0700_0701_valid :
    checkProductSumEq ep_Q2_002_partials_28_0700_0701
      ep_Q2_002_block_28_0700_0701 = true := by
  native_decide

end EpQ2002TermShards

end Patterns

end EndpointCertificate

end Problem97
