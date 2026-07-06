/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_008, term block 3:700-703

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_008`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2008TermShards

/-- Generator polynomial 3 for endpoint certificate `ep_Q2_008`. -/
def ep_Q2_008_generator_03_0700_0703 : Poly :=
[
  term (1 : Rat) [(2, 2)],
  term (1 : Rat) [(3, 2)],
  term (-1 : Rat) [(8, 2)],
  term (-1 : Rat) [(9, 2)]
]

/-- Coefficient term 700 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0700 : Poly :=
[
  term ((-36502107551145007653 : Rat) / 11087303257826821744) [(13, 2), (16, 1)]
]

/-- Partial product 700 for generator 3. -/
def ep_Q2_008_partial_03_0700 : Poly :=
[
  term ((-36502107551145007653 : Rat) / 11087303257826821744) [(2, 2), (13, 2), (16, 1)],
  term ((-36502107551145007653 : Rat) / 11087303257826821744) [(3, 2), (13, 2), (16, 1)],
  term ((36502107551145007653 : Rat) / 11087303257826821744) [(8, 2), (13, 2), (16, 1)],
  term ((36502107551145007653 : Rat) / 11087303257826821744) [(9, 2), (13, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 3. -/
theorem ep_Q2_008_partial_03_0700_valid :
    mulPoly ep_Q2_008_coefficient_03_0700
        ep_Q2_008_generator_03_0700_0703 =
      ep_Q2_008_partial_03_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0701 : Poly :=
[
  term ((30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(13, 3), (15, 1), (16, 1)]
]

/-- Partial product 701 for generator 3. -/
def ep_Q2_008_partial_03_0701 : Poly :=
[
  term ((30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 3), (15, 1), (16, 1)],
  term ((30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term ((-30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 3), (15, 1), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 3. -/
theorem ep_Q2_008_partial_03_0701_valid :
    mulPoly ep_Q2_008_coefficient_03_0701
        ep_Q2_008_generator_03_0700_0703 =
      ep_Q2_008_partial_03_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0702 : Poly :=
[
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(15, 2), (16, 1)]
]

/-- Partial product 702 for generator 3. -/
def ep_Q2_008_partial_03_0702 : Poly :=
[
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (15, 2), (16, 1)],
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 2), (16, 1)],
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (15, 2), (16, 1)],
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 3. -/
theorem ep_Q2_008_partial_03_0702_valid :
    mulPoly ep_Q2_008_coefficient_03_0702
        ep_Q2_008_generator_03_0700_0703 =
      ep_Q2_008_partial_03_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 3. -/
def ep_Q2_008_coefficient_03_0703 : Poly :=
[
  term ((-23310360903095457219 : Rat) / 11087303257826821744) [(16, 1)]
]

/-- Partial product 703 for generator 3. -/
def ep_Q2_008_partial_03_0703 : Poly :=
[
  term ((-23310360903095457219 : Rat) / 11087303257826821744) [(2, 2), (16, 1)],
  term ((-23310360903095457219 : Rat) / 11087303257826821744) [(3, 2), (16, 1)],
  term ((23310360903095457219 : Rat) / 11087303257826821744) [(8, 2), (16, 1)],
  term ((23310360903095457219 : Rat) / 11087303257826821744) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 3. -/
theorem ep_Q2_008_partial_03_0703_valid :
    mulPoly ep_Q2_008_coefficient_03_0703
        ep_Q2_008_generator_03_0700_0703 =
      ep_Q2_008_partial_03_0703 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_008_partials_03_0700_0703 : List Poly :=
[
  ep_Q2_008_partial_03_0700,
  ep_Q2_008_partial_03_0701,
  ep_Q2_008_partial_03_0702,
  ep_Q2_008_partial_03_0703
]

/-- Sum of partial products in this block. -/
def ep_Q2_008_block_03_0700_0703 : Poly :=
[
  term ((-36502107551145007653 : Rat) / 11087303257826821744) [(2, 2), (13, 2), (16, 1)],
  term ((30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (13, 3), (15, 1), (16, 1)],
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(2, 2), (15, 2), (16, 1)],
  term ((-23310360903095457219 : Rat) / 11087303257826821744) [(2, 2), (16, 1)],
  term ((-36502107551145007653 : Rat) / 11087303257826821744) [(3, 2), (13, 2), (16, 1)],
  term ((30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (13, 3), (15, 1), (16, 1)],
  term ((3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(3, 2), (15, 2), (16, 1)],
  term ((-23310360903095457219 : Rat) / 11087303257826821744) [(3, 2), (16, 1)],
  term ((36502107551145007653 : Rat) / 11087303257826821744) [(8, 2), (13, 2), (16, 1)],
  term ((-30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(8, 2), (15, 2), (16, 1)],
  term ((23310360903095457219 : Rat) / 11087303257826821744) [(8, 2), (16, 1)],
  term ((36502107551145007653 : Rat) / 11087303257826821744) [(9, 2), (13, 2), (16, 1)],
  term ((-30816588811504396217755983031329393600000 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (13, 3), (15, 1), (16, 1)],
  term ((-3605795437533926822915581815010008351300 : Rat) / 84353800925664757687870414129491527348999) [(9, 2), (15, 2), (16, 1)],
  term ((23310360903095457219 : Rat) / 11087303257826821744) [(9, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 3, terms 700 through 703. -/
theorem ep_Q2_008_block_03_0700_0703_valid :
    checkProductSumEq ep_Q2_008_partials_03_0700_0703
      ep_Q2_008_block_03_0700_0703 = true := by
  native_decide

end EpQ2008TermShards

end Patterns

end EndpointCertificate

end Problem97
