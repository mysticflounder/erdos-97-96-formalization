/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.BiApexBlockerMultiplicity
import ThirdSourceFiniteBoundary

/-!
# Exact finite boundary for the bi-apex multiplicity output

This file applies the production finite-map theorem to the existing exact
fourteen-label full-parent incidence boundary.  The model has an exact
six-point physical cap, a selected four-point row at every center, equal
blocker support locking, and no nonempty proper selected-row-closed subset.

The production theorem selects its second-fiber arm.  That second fiber does
not contain the old equal-blocker pair, while a third source at the old
blocker is absent.  This is an exact incidence/minimal-row-closure boundary,
not a Euclidean `CounterexampleData` realization.
-/

namespace Problem97
namespace ATailExactSixMutualEqualBlockerBisectorScratch

open ATailBiApexBlockerMultiplicity
open ATailGlobalMutualThirdSourceFiniteBoundary

set_option maxRecDepth 100000
set_option maxHeartbeats 2000000

/-- In the checked boundary, the production multiplicity theorem cannot use
its larger-old-fiber output and therefore returns a second blocker fiber. -/
theorem production_multiplicity_selects_secondFiber_checked :
    ∃ a b : Label,
      a ≠ b ∧
      blocker a = blocker b ∧
      blocker a ≠ blocker unusedSource := by
  rcases second_fiber_or_larger_first_fiber_of_two_omissions
      blocker
      (omitted₁ := firstApex)
      (omitted₂ := secondApex)
      (source₁ := unusedSource)
      (source₂ := partner)
      (by decide +revert)
      (by decide +revert)
      (by decide) with hsecond | hlarger
  · exact hsecond
  · have hno :
        ¬ ∃ source : Label,
          source ≠ unusedSource ∧
          source ≠ partner ∧
          blocker source = blocker unusedSource := by
      decide
    exact False.elim (hno hlarger)

/-- Every genuinely different blocker fiber in this boundary misses at least
one member of the old equal-blocker pair.  Thus the second-fiber output is
not the distinct-center-through-the-old-pair terminal. -/
theorem every_secondFiber_misses_oldPair_checked :
    ∀ a b : Label,
      a ≠ b →
      blocker a = blocker b →
      blocker a ≠ blocker unusedSource →
      ¬ (unusedSource ∈ criticalSupport a ∧
        partner ∈ criticalSupport a) := by
  decide +revert

/-- Exact combined boundary: all-center four-point rows and the selected-row
minimality consequence coexist with exact cap six and the production second
fiber, but no distinct actual blocker row contains the old pair. -/
theorem exactSix_allCenter_minimality_multiplicity_boundary_checked :
    physicalSecondCap.card = 6 ∧
    (∀ center : Label, (globalRow center).card = 4) ∧
    (∀ source : Label, source ∈ criticalSupport source) ∧
    (∀ U : Finset Label, U.Nonempty → rowClosed U → U = Finset.univ) ∧
    blocker unusedSource = commonBlocker ∧
    blocker partner = commonBlocker ∧
    (∃ a b : Label,
      a ≠ b ∧
      blocker a = blocker b ∧
      blocker a ≠ blocker unusedSource) ∧
    ¬ ∃ J : Label,
      blocker J ≠ commonBlocker ∧
      unusedSource ∈ criticalSupport J ∧
      partner ∈ criticalSupport J := by
  have hcaps := largeCap_parentSurface_checked
  have htotal := total_sourceFaithful_criticalSystem_checked
  have hequal := exactFive_mutualEqualBlockerSurface_checked
  exact ⟨hcaps.2.2.1, htotal.1, htotal.2.2.1,
    minimal_rowClosureSurface_checked,
    hequal.2.2.2.2.2.2.2.2.2.2.1,
    hequal.2.2.2.2.2.2.2.2.2.2.2.1,
    production_multiplicity_selects_secondFiber_checked,
    no_distinctBlocker_row_contains_equalBlockerPair_checked⟩

#print axioms production_multiplicity_selects_secondFiber_checked
#print axioms every_secondFiber_misses_oldPair_checked
#print axioms exactSix_allCenter_minimality_multiplicity_boundary_checked

end ATailExactSixMutualEqualBlockerBisectorScratch
end Problem97
