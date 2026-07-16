/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import ActualBlockerMinimalCycle

/-!
# Metric rigidity along an actual-blocker cycle

Deletion criticality makes the exact source shell at a chosen blocker center
the unique positive radius carrying four ambient points at that center.  This
module records the resulting metric content of two consecutive blocker edges.

If `q -> b -> c` are consecutive edges, then the two edge lengths are equal
exactly when `c` belongs to the exact shell sourced at `q`.  If they are not
equal, the `c`-radius class at `b` has cardinality at most three.  Thus an
extremal edge comparison alone gives a two-step shell incidence or a small
radius class; it does not produce a strict rank, a cap endpoint, or a
contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

/-- At a deletion-critical blocker center, the exact source-shell radius is
the unique positive ambient radius carrying at least four points. -/
theorem blockerCenter_unique_positive_four_radius
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : CriticalShellSystem.CarrierVertex A)
    (radius : ℝ) (hradius : 0 < radius)
    (hfour : 4 ≤
      (SelectedClass A (H.centerAt q.1 q.2) radius).card) :
    radius = (H.selectedAt q.1 q.2).toCriticalFourShell.radius := by
  have hqClass :
      q.1 ∈ SelectedClass A (H.centerAt q.1 q.2) radius := by
    by_contra hqNot
    apply H.no_qfree_at q.1 q.2
    refine ⟨radius, hradius, ?_⟩
    have hsame := selectedClass_erase_card_eq_of_not_mem
      (A := A) (x := q.1) (s := H.centerAt q.1 q.2)
      (d := radius) hqNot
    simpa [SelectedClass] using hfour.trans_eq hsame.symm
  calc
    radius = dist (H.centerAt q.1 q.2) q.1 :=
      (mem_selectedClass.mp hqClass).2.symm
    _ = (H.selectedAt q.1 q.2).toCriticalFourShell.radius :=
      (H.selectedAt q.1 q.2).toCriticalFourShell.support_eq_radius
        q.1 (H.selectedAt q.1 q.2).toCriticalFourShell.q_mem_support

/-- Every ambient point distinct from a source's blocker either belongs to
that source's exact shell or lies in a radius class of cardinality at most
three at the blocker center. -/
theorem mem_sourceShell_or_radiusClass_card_le_three
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : CriticalShellSystem.CarrierVertex A)
    {z : ℝ²} (hzA : z ∈ A)
    (hz_ne_center : z ≠ H.centerAt q.1 q.2) :
    z ∈ (H.selectedAt q.1 q.2).toCriticalFourShell.support ∨
      (SelectedClass A (H.centerAt q.1 q.2)
        (dist (H.centerAt q.1 q.2) z)).card ≤ 3 := by
  by_cases hzShell :
      z ∈ (H.selectedAt q.1 q.2).toCriticalFourShell.support
  · exact Or.inl hzShell
  · right
    by_contra hcard
    have hfour : 4 ≤
        (SelectedClass A (H.centerAt q.1 q.2)
          (dist (H.centerAt q.1 q.2) z)).card := by
      omega
    have hpositive : 0 < dist (H.centerAt q.1 q.2) z :=
      dist_pos.mpr hz_ne_center.symm
    have hradius := blockerCenter_unique_positive_four_radius H q
      (dist (H.centerAt q.1 q.2) z) hpositive hfour
    exact hzShell
      ((H.selectedAt q.1 q.2).toCriticalFourShell.off_row_named_label_forbidden
        hzA hradius)

/-- For two consecutive blocker edges `q -> b -> c`, equality of their
lengths is exactly the two-step incidence `c ∈ shell(q)`. -/
theorem secondBlocker_mem_sourceShell_iff_edgeLengths_eq
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : CriticalShellSystem.CarrierVertex A) :
    let b := H.blockerVertex q
    let c := H.blockerVertex b
    c.1 ∈ (H.selectedAt q.1 q.2).toCriticalFourShell.support ↔
      dist b.1 c.1 = dist b.1 q.1 := by
  dsimp only
  constructor
  · intro hc
    exact
      ((H.selectedAt q.1 q.2).toCriticalFourShell.support_eq_radius
        (H.blockerVertex (H.blockerVertex q)).1 hc).trans
      ((H.selectedAt q.1 q.2).toCriticalFourShell.support_eq_radius
        q.1 (H.selectedAt q.1 q.2).toCriticalFourShell.q_mem_support).symm
  · intro hdist
    apply
      (H.selectedAt q.1 q.2).toCriticalFourShell.off_row_named_label_forbidden
        (H.blockerVertex (H.blockerVertex q)).2
    exact hdist.trans
      ((H.selectedAt q.1 q.2).toCriticalFourShell.support_eq_radius
        q.1 (H.selectedAt q.1 q.2).toCriticalFourShell.q_mem_support)

/-- The exact metric alternative on two consecutive blocker edges: either
the second blocker hits the first exact shell, or its radius class at the
intermediate blocker has cardinality at most three. -/
theorem actualBlocker_secondBlocker_mem_sourceShell_or_radiusClass_card_le_three
    {A : Finset ℝ²} (H : CriticalShellSystem A)
    (q : CriticalShellSystem.CarrierVertex A) :
    let b := H.blockerVertex q
    let c := H.blockerVertex b
    c.1 ∈ (H.selectedAt q.1 q.2).toCriticalFourShell.support ∨
      (SelectedClass A b.1 (dist b.1 c.1)).card ≤ 3 := by
  let b := H.blockerVertex q
  let c := H.blockerVertex b
  have hc_ne_b : c.1 ≠ b.1 := by
    intro hcb
    apply H.blockerVertex_ne b
    exact Subtype.ext hcb
  have h := mem_sourceShell_or_radiusClass_card_le_three H q c.2
    (by simpa [b, c, CriticalShellSystem.blockerVertex] using hc_ne_b)
  simpa [b, c, CriticalShellSystem.blockerVertex] using h

namespace SourceExactMinimalActualBlockerCycle

/-- The preceding two-step metric alternative applies at every canonical
source of a source-exact minimal actual-blocker cycle. -/
theorem secondBlocker_mem_sourceShell_or_radiusClass_card_le_three
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : ATailSubcarrierTerminalInvariantScratch.AmbientRobustHistoryPair
      D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) (i : Fin K.period) :
    let q := K.source i
    let b := H.blockerVertex q
    let c := H.blockerVertex b
    c.1 ∈ (H.selectedAt q.1 q.2).toCriticalFourShell.support ∨
      (SelectedClass D.A b.1 (dist b.1 c.1)).card ≤ 3 := by
  exact actualBlocker_secondBlocker_mem_sourceShell_or_radiusClass_card_le_three
    H (K.source i)

#print axioms secondBlocker_mem_sourceShell_or_radiusClass_card_le_three

end SourceExactMinimalActualBlockerCycle

#print axioms blockerCenter_unique_positive_four_radius
#print axioms mem_sourceShell_or_radiusClass_card_le_three
#print axioms secondBlocker_mem_sourceShell_iff_edgeLengths_eq
#print axioms actualBlocker_secondBlocker_mem_sourceShell_or_radiusClass_card_le_three

end ATailRActualBlockerTransitionScratch
end Problem97
