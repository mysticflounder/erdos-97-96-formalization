/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import SecondCapPairCountCountermodel

/-!
# Finite incidence boundary for the original unique exact-four arm

This is not a Euclidean realization and not a `CounterexampleData`. It combines
the strongest discrete consequences currently available on the exact-four arm:

* one exact four-point first-apex row with a three-point off-surplus marginal;
* a retained pair whose simultaneous deletion preserves a second-apex row;
* one four-point row at every represented carrier center;
* the no-proper-row-closed-set consequence of global minimality;
* a fixed-point-free exact-support blocker map with fibers of size at most four;
* the ordered-cap outside-pair ledger and the abstract cap profile `(6,4,5)`;
* no non-first-apex row containing both retained sources.

The checked survivor shows that these incidence/cardinality consequences do not
by themselves produce the common-pair terminal. A direct contradiction must use
their joint Euclidean realization or another stronger source-level consequence.
-/

namespace Problem97
namespace ATailUniqueFourDirectFalseScratch

open ATailGenericMarginalPairCountCountermodel
open ATailSecondCapPairCountCountermodel

abbrev Label := ATailGenericMarginalPairCountCountermodel.Label

def firstApex : Label := 0

def secondApex : Label := 5

def retainedQ : Label := 7

def retainedW : Label := 8

/-- The two retained points occupy the strict part of the first opposite cap
in the finite role projection. -/
def firstOppositeInterior : Finset Label := {retainedQ, retainedW}

/-- Abstract physical cap cardinalities. Their sum is `12 + 3`, and no choice
of a cap of cardinality greater than four leaves two four-point opposite caps. -/
def capProfile : Fin 3 → Nat := ![6, 4, 5]

def IsM44Profile (profile : Fin 3 → Nat) : Prop :=
  ∃ surplus : Fin 3, 4 < profile surplus ∧
    ∀ other : Fin 3, other ≠ surplus → profile other = 4

/-- A source-indexed blocker map. The first-apex row is a legitimate common
critical support for the retained pair, matching the selector override that
is possible on the real exact-four surface. -/
def blocker : Label → Label :=
  ![1, 2, 1, 2, 3, 0, 0, 0, 0, 1, 2, 10]

def blockerFiber (center : Label) : Finset Label :=
  Finset.univ.filter fun source ↦ blocker source = center

/-- Abstract second-apex radius labels. The retained points have distinct
labels, while the stored second-apex row is one common class avoiding both. -/
def secondRadiusLabel : Label → Fin 4 :=
  ![0, 3, 3, 3, 3, 3, 0, 1, 2, 0, 0, 3]

def RowClosed (U : Finset Label) : Prop :=
  ∀ center ∈ U, globalRowFour center ⊆ U

instance instDecidableRowClosed (U : Finset Label) : Decidable (RowClosed U) := by
  unfold RowClosed
  infer_instance

/-- The displayed row graph has no nonempty proper row-closed set. The proof
uses an explicit reachability tree, avoiding a brute-force powerset check. -/
private theorem no_proper_rowClosed_checked
    (U : Finset Label) (hU : U.Nonempty) (hclosed : RowClosed U) :
    U = Finset.univ := by
  have follow {center point : Label} (hcenter : center ∈ U)
      (hpoint : point ∈ globalRowFour center) : point ∈ U :=
    hclosed center hcenter hpoint
  have h0 : (0 : Label) ∈ U := by
    rcases hU with ⟨x, hx⟩
    fin_cases x
    · exact hx
    · exact follow hx (by decide)
    · have h1 : (1 : Label) ∈ U := follow hx (by decide)
      exact follow h1 (by decide)
    · have h2 : (2 : Label) ∈ U := follow hx (by decide)
      have h1 : (1 : Label) ∈ U := follow h2 (by decide)
      exact follow h1 (by decide)
    · have h3 : (3 : Label) ∈ U := follow hx (by decide)
      have h2 : (2 : Label) ∈ U := follow h3 (by decide)
      have h1 : (1 : Label) ∈ U := follow h2 (by decide)
      exact follow h1 (by decide)
    · exact follow hx (by decide)
    · exact follow hx (by decide)
    · exact follow hx (by decide)
    · exact follow hx (by decide)
    · exact follow hx (by decide)
    · exact follow hx (by decide)
    · exact follow hx (by decide)
  have h5 : (5 : Label) ∈ U := follow h0 (by decide)
  have h6 : (6 : Label) ∈ U := follow h0 (by decide)
  have h7 : (7 : Label) ∈ U := follow h0 (by decide)
  have h8 : (8 : Label) ∈ U := follow h0 (by decide)
  have h9 : (9 : Label) ∈ U := follow h5 (by decide)
  have h10 : (10 : Label) ∈ U := follow h5 (by decide)
  have h1 : (1 : Label) ∈ U := follow h6 (by decide)
  have h2 : (2 : Label) ∈ U := follow h6 (by decide)
  have h3 : (3 : Label) ∈ U := follow h6 (by decide)
  have h4 : (4 : Label) ∈ U := follow h3 (by decide)
  have h11 : (11 : Label) ∈ U := follow h10 (by decide)
  ext z
  simp only [Finset.mem_univ, iff_true]
  fin_cases z <;> assumption

/-- The full exact-four finite boundary. The named fields keep the abstraction
boundary explicit instead of hiding it in one large conjunction. -/
structure UniqueFourIncidenceBoundary : Prop where
  twoEndpointSurface :
    TwoEndpointSurface
      firstClassFour marginalFour secondClassFour secondMarginalFour
      oldPairFour freshPairFour rowFour globalRowFour
  firstClass_card_four : firstClassFour.card = 4
  firstRow_eq_class : globalRowFour firstApex = firstClassFour
  q_mem_interior : retainedQ ∈ firstOppositeInterior
  w_mem_interior : retainedW ∈ firstOppositeInterior
  q_ne_w : retainedQ ≠ retainedW
  q_mem_marginal : retainedQ ∈ marginalFour
  w_mem_marginal : retainedW ∈ marginalFour
  q_deletion_blocks_firstRow :
    ((globalRowFour firstApex).erase retainedQ).card = 3
  w_deletion_blocks_firstRow :
    ((globalRowFour firstApex).erase retainedW).card = 3
  pair_deletion_preserves_secondRow :
    (globalRowFour secondApex \ {retainedQ, retainedW}).card = 4
  pair_secondRadius_distinct :
    secondRadiusLabel retainedQ ≠ secondRadiusLabel retainedW
  secondRow_sameRadius :
    ∀ x ∈ globalRowFour secondApex, secondRadiusLabel x = 0
  blocker_fixedPointFree : ∀ source : Label, blocker source ≠ source
  source_mem_blockerRow :
    ∀ source : Label, source ∈ globalRowFour (blocker source)
  q_blocker_eq_firstApex : blocker retainedQ = firstApex
  w_blocker_eq_firstApex : blocker retainedW = firstApex
  q_blocker_ne_secondApex : blocker retainedQ ≠ secondApex
  w_blocker_ne_secondApex : blocker retainedW ≠ secondApex
  blockerFiber_card_le_four :
    ∀ center : Label, (blockerFiber center).card ≤ 4
  commonPairRow_unique : ∀ center : Label,
    retainedQ ∈ globalRowFour center →
    retainedW ∈ globalRowFour center → center = firstApex
  no_proper_rowClosed :
    ∀ U : Finset Label, U.Nonempty → RowClosed U → U = Finset.univ
  no_strict_marginal_pair :
    ¬ ∃ i : CapIndex, i ∈ strictCenters ∧
      2 ≤ (rowFour i ∩ marginalFour).card
  capProfile_sum : (∑ i : Fin 3, capProfile i) = 15
  capProfile_not_m44 : ¬ IsM44Profile capProfile

/-- The full finite boundary is inhabited. Each field is reduced separately,
keeping kernel reduction shallow enough for routine replay. -/
theorem uniqueFour_incidence_boundary_checked :
    UniqueFourIncidenceBoundary where
  twoEndpointSurface := cardFourTwoEndpointSurface
  firstClass_card_four := by decide
  firstRow_eq_class := by decide
  q_mem_interior := by decide
  w_mem_interior := by decide
  q_ne_w := by decide
  q_mem_marginal := by decide
  w_mem_marginal := by decide
  q_deletion_blocks_firstRow := by decide
  w_deletion_blocks_firstRow := by decide
  pair_deletion_preserves_secondRow := by decide
  pair_secondRadius_distinct := by decide
  secondRow_sameRadius := by decide
  blocker_fixedPointFree := by decide
  source_mem_blockerRow := by decide
  q_blocker_eq_firstApex := by decide
  w_blocker_eq_firstApex := by decide
  q_blocker_ne_secondApex := by decide
  w_blocker_ne_secondApex := by decide
  blockerFiber_card_le_four := by decide
  commonPairRow_unique := by decide
  no_proper_rowClosed := no_proper_rowClosed_checked
  no_strict_marginal_pair := cardFour_no_strict_pair_from_either_marginal.1
  capProfile_sum := by decide
  capProfile_not_m44 := by
    rintro ⟨surplus, hlarge, hothers⟩
    fin_cases surplus
    · have hfive := hothers (2 : Fin 3) (by decide)
      have hvalue : capProfile (2 : Fin 3) = 5 := by decide
      omega
    · have hvalue : capProfile (1 : Fin 3) = 4 := by decide
      have hlarge' : 4 < capProfile (1 : Fin 3) := by simpa using hlarge
      rw [hvalue] at hlarge'
      omega
    · have hsix := hothers (0 : Fin 3) (by decide)
      have hvalue : capProfile (0 : Fin 3) = 6 := by decide
      omega

#print axioms uniqueFour_incidence_boundary_checked

end ATailUniqueFourDirectFalseScratch
end Problem97
