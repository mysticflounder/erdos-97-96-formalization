/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ProductCertificate
import Erdos9796Proof.P97.EndpointCertificate.Soundness

/-!
# Soundness of computed endpoint-certificate product blocks

The generated certificate stores coefficients and generator indices. This
module gives their computed products a reusable semantic interpretation.
-/

namespace Problem97

namespace EndpointCertificate

/-- A computed product evaluates to zero whenever its selected generator does. -/
theorem ComputedProductBlock.evalPoly_product_eq_zero
    (nu : Nat -> Real) {generators : List Poly}
    (block : ComputedProductBlock generators)
    (hzero : ∀ generator ∈ generators, evalPoly nu generator = 0) :
    evalPoly nu block.product = 0 := by
  have hgenerator :
      evalPoly nu (generators.getD block.generatorIndex []) = 0 := by
    rcases Nat.lt_or_ge block.generatorIndex generators.length with h | h
    · rw [List.getD_eq_getElem _ _ h]
      exact hzero _ (List.getElem_mem h)
    · rw [List.getD_eq_default _ _ h]
      rfl
  rw [ComputedProductBlock.product, evalPoly_mulCanon, hgenerator, mul_zero]

/-- Every computed product evaluates to zero when all indexed generators do. -/
theorem evaluationZeros_of_computedProductBlocks
    (nu : Nat -> Real) {generators : List Poly}
    (blocks : List (ComputedProductBlock generators))
    (hzero : ∀ generator ∈ generators, evalPoly nu generator = 0) :
    ∀ product ∈ computedProductPolys blocks, evalPoly nu product = 0 := by
  intro product hproduct
  rcases List.mem_map.mp hproduct with ⟨block, hblock, rfl⟩
  exact block.evalPoly_product_eq_zero nu hzero

end EndpointCertificate

end Problem97
