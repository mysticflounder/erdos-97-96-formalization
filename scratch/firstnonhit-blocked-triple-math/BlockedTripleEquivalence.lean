/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.CriticalPairFrontier

/-!
# The blocked-triple contract is exactly the three-overlap target

This scratch theorem isolates the logical content of the proposed
FirstNonHit producer.  It is intentionally generic in the target row: three
singleton deletions blocked at an actual source center are equivalent to a
three-point intersection of the corresponding exact selected supports.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace TwoSourceExactCollisionRowsTerminal

open scoped EuclideanGeometry
open ATailCriticalPairFrontier

attribute [local instance] Classical.propDecidable

theorem blockedTriple_iff_threeOverlap
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    (target : CriticalShellSystem.CarrierVertex D.A) :
    (∃ source : CriticalShellSystem.CarrierVertex D.A,
        H.centerAt source.1 source.2 ≠ H.centerAt target.1 target.2 ∧
        ∃ W : Finset ℝ²,
          W ⊆ (H.selectedAt target.1 target.2).toCriticalFourShell.support ∧
          W.card = 3 ∧
          ∀ w ∈ W,
            ¬ HasNEquidistantPointsAt 4 (D.A.erase w)
              (H.centerAt source.1 source.2)) ↔
      ∃ source : CriticalShellSystem.CarrierVertex D.A,
        H.centerAt source.1 source.2 ≠ H.centerAt target.1 target.2 ∧
        3 ≤
          ((H.selectedAt source.1 source.2).toCriticalFourShell.support ∩
            (H.selectedAt target.1 target.2).toCriticalFourShell.support).card := by
  constructor
  · rintro ⟨source, hcenters, W, hWsub, hWcard, hblocked⟩
    refine ⟨source, hcenters, ?_⟩
    have hcard : 3 ≤ W.card := by omega
    apply hcard.trans
    apply Finset.card_le_card
    intro w hw
    exact Finset.mem_inter.mpr
      ⟨_root_.Problem97.ATAILStageOnePrescribedApexDichotomy
          .source_mem_critical_support_of_no_qfree
          (H.selectedAt source.1 source.2) (hblocked w hw),
        hWsub hw⟩
  · rintro ⟨source, hcenters, hthree⟩
    obtain ⟨W, hWsub, hWcard⟩ := Finset.exists_subset_card_eq hthree
    refine ⟨source, hcenters, W, ?_, hWcard, ?_⟩
    · intro w hw
      exact (Finset.mem_inter.mp (hWsub hw)).2
    · intro w hw hsurvives
      have hnotmem :=
        (cross_deletion_survives_iff_not_mem_selected_support
          H source.2).mp hsurvives
      exact hnotmem (Finset.mem_inter.mp (hWsub hw)).1

end TwoSourceExactCollisionRowsTerminal
end ATailFrontierLiveClosure
end Problem97
