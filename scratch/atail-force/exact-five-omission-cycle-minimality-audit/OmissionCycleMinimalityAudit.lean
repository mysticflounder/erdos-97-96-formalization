/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.GlobalMinimalDeletion
import Erdos9796Proof.P97.U1CarrierInjection

/-!
# Minimality audit for a source-exact omission cycle

This file deliberately assumes that a finite source-exact omission cycle has
already been constructed.  It audits only whether its one-deletion survival
facts compose into a smaller global K4 carrier or a proper selected-row-closed
subset.

They do not.  Deleting the whole source set removes each source from its own
critical shell, so K4 is blocked at every source's actual blocker.  If such a
blocker remains, it directly witnesses failure of global K4 on the cumulative
carrier.  If every such blocker was also deleted, global minimality supplies a
fresh blocker outside the source set and the existing minimal-deletion-core
alternative.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailOmissionCycleMinimalityAudit

open ATAILStageOneMinimalDeletionCore
open ATailGlobalMinimalDeletion

attribute [local instance] Classical.propDecidable

private theorem equidistant_mono
    {n : ℕ} {A B : Finset ℝ²} {center : ℝ²}
    (hAB : A ⊆ B)
    (h : HasNEquidistantPointsAt n A center) :
    HasNEquidistantPointsAt n B center := by
  rcases h with ⟨radius, hradius, hcard⟩
  refine ⟨radius, hradius, hcard.trans (Finset.card_le_card ?_)⟩
  intro z hz
  rcases Finset.mem_filter.mp hz with ⟨hzA, hzdist⟩
  exact Finset.mem_filter.mpr ⟨hAB hzA, hzdist⟩

/-- Once a cumulative deletion contains a source, K4 is blocked at that
source's actual blocker.  Extra deletions cannot reverse the defining
single-source criticality. -/
theorem cumulativeDeletion_blocked_of_source_mem
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {U : Finset ℝ²} {source : ℝ²}
    (hsourceA : source ∈ D.A)
    (hsourceU : source ∈ U) :
    ¬ HasNEquidistantPointsAt 4 (D.A \ U)
      (H.centerAt source hsourceA) := by
  intro hsurvives
  apply H.no_qfree_at source hsourceA
  apply equidistant_mono (h := hsurvives)
  intro z hz
  rcases Finset.mem_sdiff.mp hz with ⟨hzA, hzU⟩
  exact Finset.mem_erase.mpr
    ⟨by
      intro hzsource
      subst z
      exact hzU hsourceU,
      hzA⟩

/-- A cycle edge may preserve K4 after deleting its omitted successor, but
that witness never extends to the cumulative deletion of all cycle sources.
The latter also deletes the current source and is blocked at its actual
blocker. -/
theorem oneDeletionSurvival_and_cumulativeBlockage
    {D : CounterexampleData}
    (H : CriticalShellSystem D.A)
    {ι : Type*} [Fintype ι]
    (source : ι → CriticalShellSystem.CarrierVertex D.A)
    (successor : ι → ℝ²)
    (U : Finset ℝ²)
    (hsourceU : ∀ i, (source i).1 ∈ U)
    (hsurvives : ∀ i,
      HasNEquidistantPointsAt 4 (D.A.erase (successor i))
        (H.centerAt (source i).1 (source i).2)) :
    ∀ i,
      HasNEquidistantPointsAt 4 (D.A.erase (successor i))
          (H.centerAt (source i).1 (source i).2) ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ U)
          (H.centerAt (source i).1 (source i).2) := by
  intro i
  exact ⟨hsurvives i,
    cumulativeDeletion_blocked_of_source_mem H (source i).2 (hsourceU i)⟩

private theorem complement_ne_carrier
    {D : CounterexampleData} {U : Finset ℝ²}
    (hUsub : U ⊆ D.A) (hUne : U.Nonempty) :
    D.A \ U ≠ D.A := by
  rcases hUne with ⟨source, hsourceU⟩
  intro heq
  have hsourceRemaining : source ∈ D.A \ U := by
    rw [heq]
    exact hUsub hsourceU
  exact (Finset.mem_sdiff.mp hsourceRemaining).2 hsourceU

/-- The exact cumulative-survival field which a descent proof would need is
already contradiction-strength under minimality: a nonempty proper cumulative
carrier cannot retain global K4. -/
theorem false_of_globalK4_on_cumulativeDeletion
    {D : CounterexampleData}
    (hmin : D.Minimal)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hremaining : (D.A \ U).Nonempty)
    (hglobal : HasNEquidistantProperty 4 (D.A \ U)) :
    False := by
  exact
    (not_hasNEquidistantProperty_of_nonempty_proper_subset
      hmin hremaining Finset.sdiff_subset
        (complement_ne_carrier hUsub hUne)) hglobal

/-- A cumulative complement is not a hidden witness-closed subcarrier.
For every faithful row selection, minimality produces a remaining center whose
selected support exits the complement. -/
theorem exists_selectedRow_escape_from_cumulativeDeletion
    {D : CounterexampleData}
    (hmin : D.Minimal)
    (P : FaithfulCarrierPattern D.A)
    {U : Finset ℝ²}
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hremaining : (D.A \ U).Nonempty) :
    ∃ center : ℝ², ∃ hcenter : center ∈ D.A \ U, ∃ z : ℝ²,
      z ∈ (P.classAt center
        ((Finset.mem_sdiff.mp hcenter).1)).support ∧
      z ∉ D.A \ U := by
  exact P.exists_row_escape_of_proper_subset
    hmin hremaining Finset.sdiff_subset
      (complement_ne_carrier hUsub hUne)

/-- The strongest generic minimality split for a cumulative source set.

If one source blocker remains outside the deletion set, it is an explicit
blocked center of the cumulative carrier.  Otherwise every source blocker was
deleted, and global minimality produces a genuinely fresh blocker, distinct
from every blocker named by the cycle, together with the existing
shared-radius/minimal-core alternative.
-/
theorem remainingCycleBlocker_or_freshMinimalDeletionCore
    {D : CounterexampleData}
    (hmin : D.Minimal)
    (H : CriticalShellSystem D.A)
    {ι : Type*} [Fintype ι]
    (source : ι → CriticalShellSystem.CarrierVertex D.A)
    (U : Finset ℝ²)
    (hsourceU : ∀ i, (source i).1 ∈ U)
    (hUsub : U ⊆ D.A)
    (hUne : U.Nonempty)
    (hremaining : (D.A \ U).Nonempty) :
    (∃ i : ι,
        H.centerAt (source i).1 (source i).2 ∈ D.A \ U ∧
        ¬ HasNEquidistantPointsAt 4 (D.A \ U)
          (H.centerAt (source i).1 (source i).2)) ∨
      ∃ center ∈ D.A \ U,
        (∀ i : ι,
          center ≠ H.centerAt (source i).1 (source i).2) ∧
        ∃ V : Finset ℝ²,
          V.Nonempty ∧
          V ⊆ U ∧
          ¬ HasNEquidistantPointsAt 4 (D.A \ V) center ∧
          ((∃ s ∈ V, ∃ t ∈ V,
              s ≠ t ∧ dist center s = dist center t) ∨
            Nonempty (MinimalDeletionCore D.A V center)) := by
  classical
  by_cases houtside :
      ∃ i : ι, H.centerAt (source i).1 (source i).2 ∉ U
  · left
    rcases houtside with ⟨i, hblockerU⟩
    let blocker := H.centerAt (source i).1 (source i).2
    have hblockerA : blocker ∈ D.A := by
      exact (Finset.mem_erase.mp
        (H.selectedAt (source i).1
          (source i).2).toCriticalFourShell.center_mem).2
    exact ⟨i, Finset.mem_sdiff.mpr ⟨hblockerA, hblockerU⟩,
      cumulativeDeletion_blocked_of_source_mem H
        (source i).2 (hsourceU i)⟩
  · right
    have hblockerU :
        ∀ i : ι, H.centerAt (source i).1 (source i).2 ∈ U := by
      intro i
      by_contra hi
      exact houtside ⟨i, hi⟩
    rcases exists_fresh_sharedRadiusPair_or_minimalDeletionCore
        hmin hUsub hUne hremaining with
      ⟨center, hcenterRemaining, V, hVne, hVsub,
        hVblocked, halternative⟩
    refine ⟨center, hcenterRemaining, ?_, V, hVne, hVsub,
      hVblocked, halternative⟩
    intro i hcenter
    exact (Finset.mem_sdiff.mp hcenterRemaining).2
      (hcenter ▸ hblockerU i)

#print axioms cumulativeDeletion_blocked_of_source_mem
#print axioms oneDeletionSurvival_and_cumulativeBlockage
#print axioms false_of_globalK4_on_cumulativeDeletion
#print axioms exists_selectedRow_escape_from_cumulativeDeletion
#print axioms remainingCycleBlocker_or_freshMinimalDeletionCore

end ATailOmissionCycleMinimalityAudit
end Problem97
