/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.ErasedNativeClassifier
import Erdos9796Proof.P97.Census554.CapSelectedNativeClassifierSound

/-!
# ERASE classifier soundness

Semantic-to-executable row transport shared by all ERASE card-eleven
families.  This layer proves that every row of an admissible finite shell is
enumerated by the native candidate generator and identifies the two fixed
P4-U short-cap rows.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierFacts
open Census554.CapSelectedNativeClassifierSound

/-- Incidence plus the common ERASE shell contract supplies every local
condition used by `candidateRows`. -/
theorem localCandidateSpec_of_incidenceOK_erasedSeedShellOK
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket : Finset Label} {c₀ pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : ErasedSeedShellOK P blocker centerBucket c₀ pin deleted)
    (center : Label) :
    LocalCandidateSpec center deleted (row P center) := by
  rcases hinc with ⟨hlocal, _hintersections, _hpairCount,
    _hseparation, _hq3, hcapCounts⟩
  rcases hlocal with ⟨hrows, hmoser, hnonMoser⟩
  rcases hshell with
    ⟨_hcenter, _hpin, _hpinRow, _hne, _hdeletedInterior, hdeleted,
      _hblocker, _hseedBlocker⟩
  refine ⟨(hrows center).1, (hrows center).2, ?_, ?_, ?_, ?_, ?_, ?_⟩
  · intro hcenter
    subst center
    simpa [capO1, capO2] using hmoser.1
  · intro hcenter
    subst center
    simpa [capS, capO2] using hmoser.2.1
  · intro hcenter
    subst center
    simpa [capS, capO1] using hmoser.2.2
  · exact hnonMoser center
  · exact hcapCounts center
  · intro hcenter
    subst center
    exact hdeleted

/-- Every row of an ERASE shell occurs in the native candidate list. -/
theorem rowOfPattern_mem_candidateRows_erased
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket : Finset Label} {c₀ pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : ErasedSeedShellOK P blocker centerBucket c₀ pin deleted)
    (center : Label) :
    rowOfPattern P center ∈ candidateRows center.val deleted.val :=
  rowOfPattern_mem_candidateRows_of_localCandidateSpec
    (localCandidateSpec_of_incidenceOK_erasedSeedShellOK hinc hshell center)

/-- Count-row shells expose the common seed shell to the candidate proof. -/
theorem rowOfPattern_mem_candidateRows_erasedRow
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket sameBucket leftBucket rightBucket : Finset Label}
    {c₀ pin deleted : Label} {m s l r : Nat}
    (hinc : IncidenceOK P)
    (hshell : ErasedRowShellOK P blocker centerBucket sameBucket
      leftBucket rightBucket c₀ pin deleted m s l r)
    (center : Label) :
    rowOfPattern P center ∈ candidateRows center.val deleted.val :=
  rowOfPattern_mem_candidateRows_erased hinc hshell.1 center

/-- Native values of surplus-interior labels occur in `intSNats`. -/
theorem val_mem_intSNats_of_mem_intS {label : Label} (hlabel : label ∈ intS) :
    label.val ∈ intSNats := by
  fin_cases label <;> simp_all [intS, intSNats]

set_option maxHeartbeats 1000000 in
-- Native reduction establishes the fixed first short-cap row mask.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem maskOfFinset_capO1 :
    maskOfFinset capO1 = firstOppExactCapRow.support := by
  native_decide

set_option maxHeartbeats 1000000 in
-- Native reduction establishes the fixed second short-cap row mask.
set_option maxRecDepth 10000 in
set_option linter.style.nativeDecide false in
theorem maskOfFinset_capO2 :
    maskOfFinset capO2 = secondOppExactCapRow.support := by
  native_decide

/-- The semantic first short-cap row is the first fixed P4-U native row. -/
theorem rowOfPattern_eq_firstOppExactCapRow
    {P : PatternCode} {blocker : Label → Label} {pin deleted : Label}
    (hshell : P4UErasedShellOK P blocker pin deleted) :
    rowOfPattern P 1 = firstOppExactCapRow := by
  simp only [rowOfPattern, rowMaskOf]
  rw [hshell.2.1, maskOfFinset_capO1]
  rfl

/-- The semantic second short-cap row is the second fixed P4-U native row. -/
theorem rowOfPattern_eq_secondOppExactCapRow
    {P : PatternCode} {blocker : Label → Label} {pin deleted : Label}
    (hshell : P4UErasedShellOK P blocker pin deleted) :
    rowOfPattern P 2 = secondOppExactCapRow := by
  simp only [rowOfPattern, rowMaskOf]
  rw [hshell.2.2.1, maskOfFinset_capO2]
  rfl

/-- Every row of a P4-U shell occurs in the native candidate list. -/
theorem rowOfPattern_mem_candidateRows_p4u
    {P : PatternCode} {blocker : Label → Label} {pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : P4UErasedShellOK P blocker pin deleted)
    (center : Label) :
    rowOfPattern P center ∈ candidateRows center.val deleted.val :=
  rowOfPattern_mem_candidateRows_erased hinc hshell.1 center

/-- Every row of a P4-S shell occurs in the native candidate list. -/
theorem rowOfPattern_mem_candidateRows_p4s
    {P : PatternCode} {blocker : Label → Label}
    {c₀ pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : P4SErasedShellOK P blocker c₀ pin deleted)
    (center : Label) :
    rowOfPattern P center ∈ candidateRows center.val deleted.val :=
  rowOfPattern_mem_candidateRows_erased hinc hshell center

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
