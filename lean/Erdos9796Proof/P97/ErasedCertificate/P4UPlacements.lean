/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.ErasedClassifierSound

/-!
# Native P4-U placement certificates

One native certificate covers all 47 containment-compatible support masks and
all surplus-interior deleted labels that occur on each support.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierFacts
open Census554.CapSelectedNativeClassifierSound

/-- Closed Boolean certificate over the complete P4-U domain. -/
def p4uPlacementsAll : Bool :=
  p4uSupports.all fun support =>
    intSNats.all fun deleted =>
      if has support deleted then
        erasedP4UPlacementCheck support deleted
      else
        true

set_option maxHeartbeats 0 in
-- Native evaluation traverses the complete 47-support placement domain.
set_option maxRecDepth 100000 in
set_option linter.style.nativeDecide false in
theorem p4uPlacementsAll_eq_true : p4uPlacementsAll = true := by
  native_decide

/-- The local native specification and Moser-pair closure place a mask in the
complete P4-U support list. -/
theorem mem_p4uSupports_of_localCandidateOK
    {support deleted : Nat} (hlt : support < 2048)
    (hlocal : localCandidateOK 0 deleted support = true)
    (hpair : (has support 1 == has support 2) = true) :
    support ∈ p4uSupports := by
  simp only [localCandidateOK, Bool.and_eq_true] at hlocal
  rcases hlocal with
    ⟨⟨⟨⟨⟨hcard, hself⟩, hmoser⟩, _hnonMoser⟩, _hcap⟩, _hdeleted⟩
  refine List.mem_filter.mpr ⟨?_, ?_⟩
  · exact List.mem_filter.mpr ⟨List.mem_range.mpr hlt, hcard⟩
  · simpa only [Bool.and_eq_true] using
      (show (((!has support 0) = true ∧ moserOneHitOK 0 support = true) ∧
          (has support 1 == has support 2) = true) from
        ⟨⟨hself, hmoser⟩, hpair⟩)

/-- The P4-U shell's Moser-pair proposition is the Boolean pair condition used
by `p4uSupports`. -/
  theorem p4u_moserPairBool
    {P : PatternCode} {blocker : Label → Label} {pin deleted : Label}
    (hshell : P4UErasedShellOK P blocker pin deleted) :
    (has (rowMaskOf P 0) 1 == has (rowMaskOf P 0) 2) = true := by
  have hpair := hshell.2.2.2
  have hhas1 : has (rowMaskOf P 0) 1 = P 0 (1 : Label) := by
    simpa using has_rowMaskOf P 0 (1 : Label)
  have hhas2 : has (rowMaskOf P 0) 2 = P 0 (2 : Label) := by
    simpa using has_rowMaskOf P 0 (2 : Label)
  rw [hhas1, hhas2]
  cases h₁ : P 0 1 <;> cases h₂ : P 0 2 <;>
    simp_all [mem_row_iff]

/-- Every semantic P4-U shell row is covered by the closed native placement
certificate. -/
theorem erasedP4UPlacementCheck_rowMaskOf
    {P : PatternCode} {blocker : Label → Label} {pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : P4UErasedShellOK P blocker pin deleted) :
    erasedP4UPlacementCheck (rowMaskOf P 0) deleted.val = true := by
  have hspec :=
    localCandidateSpec_of_incidenceOK_erasedSeedShellOK hinc hshell.1 0
  have hlocal :
      localCandidateOK 0 deleted.val (rowMaskOf P 0) = true :=
    (localCandidateOK_maskOfFinset_iff 0 deleted (row P 0)).2 hspec
  have hsupport : rowMaskOf P 0 ∈ p4uSupports :=
    mem_p4uSupports_of_localCandidateOK
      (maskOfFinset_lt_2048 (row P 0)) hlocal (p4u_moserPairBool hshell)
  have hdeletedNat : deleted.val ∈ intSNats :=
    val_mem_intSNats_of_mem_intS hshell.1.2.2.2.2.1
  have hdeletedRow : deleted ∈ row P 0 := hshell.1.2.2.2.2.2.1
  have hhas : has (rowMaskOf P 0) deleted.val = true := by
    rw [has_rowMaskOf]
    exact (mem_row_iff P 0 deleted).1 hdeletedRow
  have hallSupports := List.all_eq_true.mp p4uPlacementsAll_eq_true
    (rowMaskOf P 0) hsupport
  have hallDeleted := List.all_eq_true.mp hallSupports deleted.val hdeletedNat
  simpa [hhas] using hallDeleted

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
