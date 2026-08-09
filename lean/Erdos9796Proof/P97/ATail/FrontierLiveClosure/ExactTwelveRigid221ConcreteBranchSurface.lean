/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ExactTwelveRigid221SafeCandidate

/-!
# Source-forced exact-twelve Rigid221 branch cuts

This module records finite consequences of the concrete physical-apex row
which are justified by the source-safe ingress.  These cuts are intended for
new, explicitly versioned branch encodings; they do not strengthen the frozen
source-safe v1 schema retroactively.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace ExactTwelveRigid221Ingress

open Census554.EqualityCore
open ExactTwelveCarrierIngress

/-- Two distinct points in the physical-apex row cannot both lie in the
surplus closed cap.  This is the finite form of the source-proved one-hit cut
at the second apex. -/
theorem FrozenSafeCubeOK.secondApex_row_pair_not_both_surplusCap
    {row : RowPattern Label} (hsafe : FrozenSafeCubeOK row)
    {left right : Label}
    (hleftRow : left ∈ row 1) (hrightRow : right ∈ row 1)
    (hne : left ≠ right) :
    ¬ (left ∈ surplusCapLabels ∧ right ∈ surplusCapLabels) := by
  intro hboth
  have hcandidate :=
    (mem_frozenSafeCandidateClasses.mp (hsafe.candidate_mem 1))
  have hone : FrozenSafeOneHitAt 1 (row 1) := hcandidate.2.2.1
  have hle : (row 1 ∩ surplusCapLabels).card ≤ 1 := (hone.2.1 rfl).1
  have hsubset : ({left, right} : Finset Label) ⊆
      row 1 ∩ surplusCapLabels := by
    simp only [Finset.insert_subset_iff, Finset.singleton_subset_iff,
      Finset.mem_inter]
    exact ⟨⟨hleftRow, hboth.1⟩, ⟨hrightRow, hboth.2⟩⟩
  have htwo : 2 ≤ (row 1 ∩ surplusCapLabels).card := by
    simpa [hne] using Finset.card_le_card hsubset
  omega

/-- Two distinct points in the physical-apex row cannot both lie in the first
opposite closed cap. -/
theorem FrozenSafeCubeOK.secondApex_row_pair_not_both_firstOppositeCap
    {row : RowPattern Label} (hsafe : FrozenSafeCubeOK row)
    {left right : Label}
    (hleftRow : left ∈ row 1) (hrightRow : right ∈ row 1)
    (hne : left ≠ right) :
    ¬ (left ∈ firstOppositeCapLabels ∧
      right ∈ firstOppositeCapLabels) := by
  intro hboth
  have hcandidate :=
    (mem_frozenSafeCandidateClasses.mp (hsafe.candidate_mem 1))
  have hone : FrozenSafeOneHitAt 1 (row 1) := hcandidate.2.2.1
  have hle : (row 1 ∩ firstOppositeCapLabels).card ≤ 1 :=
    (hone.2.1 rfl).2
  have hsubset : ({left, right} : Finset Label) ⊆
      row 1 ∩ firstOppositeCapLabels := by
    simp only [Finset.insert_subset_iff, Finset.singleton_subset_iff,
      Finset.mem_inter]
    exact ⟨⟨hleftRow, hboth.1⟩, ⟨hrightRow, hboth.2⟩⟩
  have htwo : 2 ≤ (row 1 ∩ firstOppositeCapLabels).card := by
    simpa [hne] using Finset.card_le_card hsubset
  omega

/-- The paired finite restriction used by the concrete-row exact-twelve
search: the joint-deletion label and the `v` label cannot occupy the same
closed cap adjacent to the physical second apex. -/
theorem FrozenSafeCubeOK.secondApex_row_pair_adjacentCaps_separate
    {row : RowPattern Label} (hsafe : FrozenSafeCubeOK row)
    {deletedLabel vLabel : Label}
    (hdeletedRow : deletedLabel ∈ row 1) (hvRow : vLabel ∈ row 1)
    (hne : deletedLabel ≠ vLabel) :
    ¬ (deletedLabel ∈ surplusCapLabels ∧
        vLabel ∈ surplusCapLabels) ∧
      ¬ (deletedLabel ∈ firstOppositeCapLabels ∧
        vLabel ∈ firstOppositeCapLabels) := by
  exact ⟨
    hsafe.secondApex_row_pair_not_both_surplusCap
      hdeletedRow hvRow hne,
    hsafe.secondApex_row_pair_not_both_firstOppositeCap
      hdeletedRow hvRow hne⟩

end ExactTwelveRigid221Ingress
end ATailFrontierLiveClosure
end Problem97
