/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Scratch: second-apex joint-fiber normal form

The first-apex pair sought by the symmetric continuation packet is already in
one off-surplus first-apex radius fiber.  The two-apex escape theorem says that
distance to the second apex is injective on every such fiber.  Consequently a
distinct selected pair has a strict second-apex distance ordering; equality is
itself a terminal contradiction.

This packages the exact consumer boundary.  It does not produce the forbidden
equality or prove the remaining global-row coupling.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailSecondApexJointFiberScratch

/-- On a fixed off-surplus first-apex radius fiber, distance to the second
apex is injective.  This is the pairwise joint-fiber form of the existing
two-apex escape theorem. -/
theorem secondApex_distance_injective_on_firstApex_offSurplus_fiber
    (D : CounterexampleData) (S : SurplusCapPacket D.A) (r : ℝ) :
    Set.InjOn (fun x : ℝ² => dist x S.oppApex2)
      {x | x ∈ D.A ∧ x ∉ S.surplusCap ∧ dist x S.oppApex1 = r} := by
  intro x hx w hw hdist
  by_contra hxw
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    D S hx.1 hw.1 hx.2.1 hw.2.1 hxw
    hx.2.2 hw.2.2 rfl hdist.symm

/-- A distinct pair from a selected first-apex row, lying on the strict
first-opposite side, has unequal second-apex distances. -/
theorem firstApex_strict_pair_secondApex_distance_ne
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex1)
    {a b : ℝ²}
    (haParent : a ∈ K.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b) :
    dist a D.packet.oppApex2 ≠ dist b D.packet.oppApex2 := by
  intro hdist
  apply hab
  apply secondApex_distance_injective_on_firstApex_offSurplus_fiber
    D D.packet K.radius
  · exact ⟨K.support_subset_A (Finset.mem_inter.mp haParent).1,
      fun haSurplus =>
        (Finset.mem_sdiff.mp (Finset.mem_inter.mp haParent).2).2
          (Finset.mem_union.mpr (Or.inl haSurplus)),
      by simpa [dist_comm] using
        K.support_eq_radius a (Finset.mem_inter.mp haParent).1⟩
  · exact ⟨K.support_subset_A (Finset.mem_inter.mp hbParent).1,
      fun hbSurplus =>
        (Finset.mem_sdiff.mp (Finset.mem_inter.mp hbParent).2).2
          (Finset.mem_union.mpr (Or.inl hbSurplus)),
      by simpa [dist_comm] using
        K.support_eq_radius b (Finset.mem_inter.mp hbParent).1⟩
  · exact hdist

/-- Order-normal form for the same pair.  A future producer may target either
the excluded equality or an incompatible orientation of this strict order. -/
theorem firstApex_strict_pair_secondApex_distance_lt_or_gt
    (D : CounterexampleData)
    (K : SelectedFourClass D.A D.packet.oppApex1)
    {a b : ℝ²}
    (haParent : a ∈ K.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hbParent : b ∈ K.support ∩
      (D.packet.oppCap1 \
        (D.packet.surplusCap ∪ D.packet.oppCap2)))
    (hab : a ≠ b) :
    dist a D.packet.oppApex2 < dist b D.packet.oppApex2 ∨
      dist b D.packet.oppApex2 < dist a D.packet.oppApex2 := by
  exact lt_or_gt_of_ne
    (firstApex_strict_pair_secondApex_distance_ne
      D K haParent hbParent hab)

#print axioms secondApex_distance_injective_on_firstApex_offSurplus_fiber
#print axioms firstApex_strict_pair_secondApex_distance_ne
#print axioms firstApex_strict_pair_secondApex_distance_lt_or_gt

end ATailSecondApexJointFiberScratch
end Problem97
