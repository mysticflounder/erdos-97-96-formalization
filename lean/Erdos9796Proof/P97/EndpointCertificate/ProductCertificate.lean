/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.Checker

/-!
# Computed product blocks for endpoint certificates

Large endpoint certificates are split into bounded coefficient blocks. Each
block records a coefficient and generator index; the shared checker computes
the canonical product rather than repeating it as generated source data.
-/

namespace Problem97

namespace EndpointCertificate

/-- One bounded coefficient-generator product whose polynomial is computed by
the checker rather than repeated as generated source data. -/
structure ComputedProductBlock (generators : List Poly) where
  generatorIndex : Nat
  coefficient : Poly

/-- The canonical product represented by a computed product block. -/
def ComputedProductBlock.product {generators : List Poly}
    (block : ComputedProductBlock generators) : Poly :=
  mulCanon block.coefficient (generators.getD block.generatorIndex [])

/-- Products computed from a list of bounded coefficient blocks. -/
def computedProductPolys {generators : List Poly}
    (blocks : List (ComputedProductBlock generators)) : List Poly :=
  blocks.map ComputedProductBlock.product

end EndpointCertificate

end Problem97
