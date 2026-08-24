/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.MinimalUniqueFourCover
import Erdos9796Proof.P97.PinnedMultiplicity

/-!
# Pinned-multiplicity ingress and projections

The source-clean local content of the B1 collision arm: a unique-four centre has
pinned multiplicity exactly four, and at that multiplicity a selected four-class
is the whole physical radius class at its selected radius.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailDeletionRobustness
open ATailMinimalUniqueFourCover

attribute [local instance] Classical.propDecidable

/- The following source-clean helpers isolate the proved local content of the
B1 collision arm.  They are deliberately kept separate from the terminal
collision theorem below: the missing global producer is the existence of a
third carrier point on the same perpendicular bisector. -/

/-- A unique-four centre has pinned multiplicity exactly four.  The defining
uniqueness condition controls every radius class of cardinality at least four;
the selected four-class supplies the matching lower bound. -/
theorem pinnedMultiplicity_eq_four_of_isUniqueFourCenter
    {A : Finset ℝ²} {p : ℝ²}
    (hp : IsUniqueFourCenter A p) :
    pinnedMultiplicity A p = 4 := by
  obtain ⟨_, r, hr, hcard, huniq⟩ := hp
  have hupper : pinnedMultiplicity A p ≤ 4 := by
    by_contra hnot
    have hfive : 5 ≤ pinnedMultiplicity A p := by omega
    obtain ⟨ρ, hρ, hρcard⟩ :=
      (hasNEquidistantPointsAt_iff_le_pinnedMultiplicity (n := 5) (by norm_num)).mpr hfive
    have hfourRaw : 4 ≤ (A.filter (fun q => dist p q = ρ)).card := by
      omega
    have hfourρ : 4 ≤ (SelectedClass A p ρ).card := by
      simpa [SelectedClass, dist_comm] using hfourRaw
    have hρr : ρ = r := huniq ρ hρ hfourρ
    have hfiveAtR : 5 ≤ (SelectedClass A p r).card := by
      simpa [SelectedClass, dist_comm, hρr] using hρcard
    omega
  have hlower : 4 ≤ pinnedMultiplicity A p := by
    have hclass := selectedClass_card_le_pinnedMultiplicity (A := A) (p := p) hr
    omega
  exact Nat.le_antisymm hupper hlower

/-- A selected four-class at a centre of pinned multiplicity exactly four is
the whole physical radius class at its selected radius.  This is the exact-
four arm of the B1 producer route; it does not assert the missing transport
from the escaped blocker to a third bisector. -/
theorem selectedClass_eq_support_of_pinnedMultiplicity_eq_four
    {A : Finset ℝ²} {p : ℝ²}
    (K : SelectedFourClass A p)
    (hμ : pinnedMultiplicity A p = 4) :
    SelectedClass A p K.radius = K.support := by
  have hsubset : K.support ⊆ SelectedClass A p K.radius := by
    intro x hx
    exact mem_selectedClass.mpr ⟨K.support_subset_A hx, K.support_eq_radius x hx⟩
  have hcard : (SelectedClass A p K.radius).card ≤ K.support.card := by
    calc
      (SelectedClass A p K.radius).card ≤ pinnedMultiplicity A p :=
        selectedClass_card_le_pinnedMultiplicity K.radius_pos
      _ = 4 := hμ
      _ = K.support.card := K.support_card.symm
  exact (Finset.eq_of_subset_of_card_le hsubset hcard).symm

end ATailFrontierLiveClosure
end Problem97
