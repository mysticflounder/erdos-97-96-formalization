/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

set_option linter.style.longLine false

/-!
# Endpoint certificate ep_Q2_019, term block 21:700-703

This generated module checks partial products for one block of the internally
sharded endpoint certificate row `ep_Q2_019`.
-/

namespace Problem97

namespace EndpointCertificate

namespace Patterns

namespace EpQ2019TermShards

/-- Generator polynomial 21 for endpoint certificate `ep_Q2_019`. -/
def ep_Q2_019_generator_21_0700_0703 : Poly :=
[
  term (-1 : Rat) [],
  term (2 : Rat) [(10, 1)]
]

/-- Coefficient term 700 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0700 : Poly :=
[
  term ((-41206687423237371229065656492254854853261 : Rat) / 1577442251014181878978812488952122784180) [(14, 2), (16, 1)]
]

/-- Partial product 700 for generator 21. -/
def ep_Q2_019_partial_21_0700 : Poly :=
[
  term ((-41206687423237371229065656492254854853261 : Rat) / 788721125507090939489406244476061392090) [(10, 1), (14, 2), (16, 1)],
  term ((41206687423237371229065656492254854853261 : Rat) / 1577442251014181878978812488952122784180) [(14, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 700 for generator 21. -/
theorem ep_Q2_019_partial_21_0700_valid :
    mulPoly ep_Q2_019_coefficient_21_0700
        ep_Q2_019_generator_21_0700_0703 =
      ep_Q2_019_partial_21_0700 := by
  native_decide

/-- Coefficient term 701 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0701 : Poly :=
[
  term ((-2491401973902871120724387674760877824 : Rat) / 368217145428147030573952495086863395) [(14, 3), (16, 1)]
]

/-- Partial product 701 for generator 21. -/
def ep_Q2_019_partial_21_0701 : Poly :=
[
  term ((-4982803947805742241448775349521755648 : Rat) / 368217145428147030573952495086863395) [(10, 1), (14, 3), (16, 1)],
  term ((2491401973902871120724387674760877824 : Rat) / 368217145428147030573952495086863395) [(14, 3), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 701 for generator 21. -/
theorem ep_Q2_019_partial_21_0701_valid :
    mulPoly ep_Q2_019_coefficient_21_0701
        ep_Q2_019_generator_21_0700_0703 =
      ep_Q2_019_partial_21_0701 := by
  native_decide

/-- Coefficient term 702 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0702 : Poly :=
[
  term ((6753982682143288795908410850367219279616 : Rat) / 1025337463159218221336228117818879809717) [(15, 2), (16, 1)]
]

/-- Partial product 702 for generator 21. -/
def ep_Q2_019_partial_21_0702 : Poly :=
[
  term ((13507965364286577591816821700734438559232 : Rat) / 1025337463159218221336228117818879809717) [(10, 1), (15, 2), (16, 1)],
  term ((-6753982682143288795908410850367219279616 : Rat) / 1025337463159218221336228117818879809717) [(15, 2), (16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 702 for generator 21. -/
theorem ep_Q2_019_partial_21_0702_valid :
    mulPoly ep_Q2_019_coefficient_21_0702
        ep_Q2_019_generator_21_0700_0703 =
      ep_Q2_019_partial_21_0702 := by
  native_decide

/-- Coefficient term 703 from coefficient polynomial 21. -/
def ep_Q2_019_coefficient_21_0703 : Poly :=
[
  term ((-1197495599996687778454842843677840508625 : Rat) / 1682605067748460670910733321548930969792) [(16, 1)]
]

/-- Partial product 703 for generator 21. -/
def ep_Q2_019_partial_21_0703 : Poly :=
[
  term ((-1197495599996687778454842843677840508625 : Rat) / 841302533874230335455366660774465484896) [(10, 1), (16, 1)],
  term ((1197495599996687778454842843677840508625 : Rat) / 1682605067748460670910733321548930969792) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked partial-product identity 703 for generator 21. -/
theorem ep_Q2_019_partial_21_0703_valid :
    mulPoly ep_Q2_019_coefficient_21_0703
        ep_Q2_019_generator_21_0700_0703 =
      ep_Q2_019_partial_21_0703 := by
  native_decide

/-- Partial products in this block. -/
def ep_Q2_019_partials_21_0700_0703 : List Poly :=
[
  ep_Q2_019_partial_21_0700,
  ep_Q2_019_partial_21_0701,
  ep_Q2_019_partial_21_0702,
  ep_Q2_019_partial_21_0703
]

/-- Sum of partial products in this block. -/
def ep_Q2_019_block_21_0700_0703 : Poly :=
[
  term ((-41206687423237371229065656492254854853261 : Rat) / 788721125507090939489406244476061392090) [(10, 1), (14, 2), (16, 1)],
  term ((-4982803947805742241448775349521755648 : Rat) / 368217145428147030573952495086863395) [(10, 1), (14, 3), (16, 1)],
  term ((13507965364286577591816821700734438559232 : Rat) / 1025337463159218221336228117818879809717) [(10, 1), (15, 2), (16, 1)],
  term ((-1197495599996687778454842843677840508625 : Rat) / 841302533874230335455366660774465484896) [(10, 1), (16, 1)],
  term ((41206687423237371229065656492254854853261 : Rat) / 1577442251014181878978812488952122784180) [(14, 2), (16, 1)],
  term ((2491401973902871120724387674760877824 : Rat) / 368217145428147030573952495086863395) [(14, 3), (16, 1)],
  term ((-6753982682143288795908410850367219279616 : Rat) / 1025337463159218221336228117818879809717) [(15, 2), (16, 1)],
  term ((1197495599996687778454842843677840508625 : Rat) / 1682605067748460670910733321548930969792) [(16, 1)]
]

set_option linter.style.nativeDecide false in
/-- Checked block-sum identity for generator 21, terms 700 through 703. -/
theorem ep_Q2_019_block_21_0700_0703_valid :
    checkProductSumEq ep_Q2_019_partials_21_0700_0703
      ep_Q2_019_block_21_0700_0703 = true := by
  native_decide

end EpQ2019TermShards

end Patterns

end EndpointCertificate

end Problem97
