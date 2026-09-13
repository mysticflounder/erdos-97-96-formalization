/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
SPDX-License-Identifier: Apache-2.0
Author: Adam McKenna
-/

import Definitions.Def_Problem97_IsWitnessSystem

open scoped EuclideanGeometry
open Finset
open Erdos9796Mission
open Problem97

/-!
# Nine-point witness incidence

Every point in a nine-point configuration has positive incidence in any
witness system. The proof uses the deletion lemma in the solution module and
the already published nine-point counting lower bound.

The formalization follows the witness-system deletion argument in the source
development. The point-set counting method is attributed there to Dumitrescu;
this theorem is the project's Lean formalization of the incidence corollary.
-/

-- PROVE2ME_FORMAL_STATEMENT
theorem Problem97.exists_witness_mem_of_card_eq_nine {A : Finset Plane} (hne : A.Nonempty)
    (hconv : ConvexIndep A) (hK4 : HasNEquidistantProperty 4 A)
    (hcard : A.card = 9) {S : Plane → Finset Plane} (hS : IsWitnessSystem A S)
    {x : Plane} (hxA : x ∈ A) : ∃ y ∈ A, x ∈ S y := by
  sorry
