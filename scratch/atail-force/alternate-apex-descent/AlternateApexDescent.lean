/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# Alternate-apex descent boundary

This scratch file separates the equality exported by a descent step from the
extra newness needed by the current finite core bank.  Relative to one ambient
exact shell, a co-radial pair is either already a pair in that shell or lies
entirely outside it at a different radius.  Robust double-deletion survival
alone does not choose the second branch.

The finite section records the two apex rows of current survivor shard zero.
It is an exact kernel-checked incidence-interface negative: alternating the
strict-cap pair at the other apex preserves the recorded row, but both pair
equalities are already present in the two initial exact rows.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailAlternateApexDescentScratch

attribute [local instance] Classical.propDecidable

/-- Exact old-or-new alternative for a co-radial descent pair relative to an
ambient exact critical shell at the same center.  The new branch is genuinely
outside the recorded support and has a different radius. -/
theorem exactShell_coRadialPair_old_or_new
    {A : Finset ℝ²} {source center q w : ℝ²} {radius : ℝ}
    (K : CriticalFourShell A source center)
    (hq : q ∈ SelectedClass A center radius)
    (hw : w ∈ SelectedClass A center radius) :
    (radius = K.radius ∧ q ∈ K.support ∧ w ∈ K.support) ∨
      (radius ≠ K.radius ∧ q ∉ K.support ∧ w ∉ K.support ∧
        dist center q = dist center w) := by
  by_cases hradius : radius = K.radius
  · left
    refine ⟨hradius, ?_, ?_⟩
    · rw [K.support_eq]
      exact Finset.mem_filter.mpr
        ⟨(mem_selectedClass.mp hq).1,
          (mem_selectedClass.mp hq).2.trans hradius⟩
    · rw [K.support_eq]
      exact Finset.mem_filter.mpr
        ⟨(mem_selectedClass.mp hw).1,
          (mem_selectedClass.mp hw).2.trans hradius⟩
  · right
    refine ⟨hradius, ?_, ?_,
      (mem_selectedClass.mp hq).2.trans
        (mem_selectedClass.mp hw).2.symm⟩
    · intro hqK
      apply hradius
      exact (mem_selectedClass.mp hq).2.symm.trans
        (K.support_eq_radius q hqK)
    · intro hwK
      apply hradius
      exact (mem_selectedClass.mp hw).2.symm.trans
        (K.support_eq_radius w hwK)

/-- One endpoint outside the initial exact shell is precisely the additional
producer field needed to force the genuinely new branch. -/
theorem exactShell_coRadialPair_new_of_left_not_mem
    {A : Finset ℝ²} {source center q w : ℝ²} {radius : ℝ}
    (K : CriticalFourShell A source center)
    (hq : q ∈ SelectedClass A center radius)
    (hw : w ∈ SelectedClass A center radius)
    (hqNew : q ∉ K.support) :
    radius ≠ K.radius ∧ q ∉ K.support ∧ w ∉ K.support ∧
      dist center q = dist center w := by
  rcases exactShell_coRadialPair_old_or_new K hq hw with hold | hnew
  · exact False.elim (hqNew hold.2.1)
  · exact hnew

namespace CurrentShardZeroInterface

abbrev Label := Fin 12

def strictOppCap1 : Finset Label := {6, 7, 8}
def strictOppCap2 : Finset Label := {9, 10, 11}

/-- Exact rows at the two opposite-apex labels in current survivor shard zero. -/
def firstApexRow : Finset Label := {0, 2, 6, 7}
def secondApexRow : Finset Label := {0, 1, 9, 10}

/-- At the recorded-row interface, alternating the apex roles does not make
either strict pair new.  The first strict pair is already in the first row,
the second strict pair is already in the second row, and erasing either pair
leaves the other apex's recorded four-row unchanged. -/
theorem alternating_immediate_rows_only_reproduce_old_equalities :
    firstApexRow.card = 4 ∧
    secondApexRow.card = 4 ∧
    firstApexRow ∩ strictOppCap1 = {6, 7} ∧
    secondApexRow ∩ strictOppCap2 = {9, 10} ∧
    ((secondApexRow.erase 6).erase 7) = secondApexRow ∧
    ((firstApexRow.erase 9).erase 10) = firstApexRow := by
  decide

end CurrentShardZeroInterface

#print axioms exactShell_coRadialPair_old_or_new
#print axioms exactShell_coRadialPair_new_of_left_not_mem
#print axioms CurrentShardZeroInterface.alternating_immediate_rows_only_reproduce_old_equalities

end ATailAlternateApexDescentScratch
end Problem97
