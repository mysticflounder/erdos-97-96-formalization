/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement3
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement4
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement5
import Erdos9796Proof.P97.ErasedCertificate.P4SPlacement6

/-!
# Native P4-S placement certificates

One closed native certificate covers every surplus-interior seed center,
pin-compatible four-point support, and surplus-interior deleted label.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierFacts
open Census554.CapSelectedNativeClassifierSound

/-- The four center shards assemble the complete P4-S certificate. -/
theorem p4sPlacementsAll_eq_true : p4sPlacementsAll = true := by
  simp [p4sPlacementsAll, intSNats, p4sPlacementsAt_three_eq_true,
    p4sPlacementsAt_four_eq_true, p4sPlacementsAt_five_eq_true,
    p4sPlacementsAt_six_eq_true]

/-- Extract one covered P4-S placement check from a center certificate. -/
theorem erasedPlacementCheckAt_of_p4sPlacementsAt
    {center support deleted : Nat}
    (hcenter : center ∈ intSNats)
    (hsupport : support ∈ fourPointMasks)
    (hpinAny :
      intSNats.any (fun q => q != center && has support q) = true)
    (hdeleted : deleted ∈ intSNats)
    (hlocal : localCandidateOK center deleted support = true) :
    erasedPlacementCheckAt center support deleted = true := by
  have hcert := List.all_eq_true.mp p4sPlacementsAll_eq_true center hcenter
  simp only [p4sPlacementsAt, Bool.and_eq_true] at hcert
  rcases hcert with ⟨hpairA, hpairB⟩
  have hsupportsA := List.all_eq_true.mp
    (show (fourPointMasks.all fun support =>
      if intSNats.any (fun pin => pin != center && has support pin) then
        [3, 4].all fun deleted =>
          if localCandidateOK center deleted support then
            erasedPlacementCheckAt center support deleted
          else true
      else true) = true by
        simpa [p4sPlacementsAtDeletedPair] using hpairA)
      support hsupport
  have hsupportsB := List.all_eq_true.mp
    (show (fourPointMasks.all fun support =>
      if intSNats.any (fun pin => pin != center && has support pin) then
        [5, 6].all fun deleted =>
          if localCandidateOK center deleted support then
            erasedPlacementCheckAt center support deleted
          else true
      else true) = true by
        simpa [p4sPlacementsAtDeletedPair] using hpairB)
      support hsupport
  simp only [hpinAny, if_true] at hsupportsA hsupportsB
  have hdeletedCases :
      deleted = 3 ∨ deleted = 4 ∨ deleted = 5 ∨ deleted = 6 := by
    simpa [intSNats] using hdeleted
  rcases hdeletedCases with rfl | rfl | rfl | rfl
  · have h := List.all_eq_true.mp hsupportsA 3 (by simp)
    simpa [hlocal] using h
  · have h := List.all_eq_true.mp hsupportsA 4 (by simp)
    simpa [hlocal] using h
  · have h := List.all_eq_true.mp hsupportsB 5 (by simp)
    simpa [hlocal] using h
  · have h := List.all_eq_true.mp hsupportsB 6 (by simp)
    simpa [hlocal] using h

set_option maxRecDepth 100000 in
/-- Every semantic P4-S shell row is covered by the closed native placement
certificate. -/
theorem erasedPlacementCheckAt_rowMaskOf_p4s
    {P : PatternCode} {blocker : Label → Label} {c₀ pin deleted : Label}
    (hinc : IncidenceOK P)
    (hshell : P4SErasedShellOK P blocker c₀ pin deleted) :
    erasedPlacementCheckAt c₀.val (rowMaskOf P c₀) deleted.val = true := by
  have hspec :=
    localCandidateSpec_of_incidenceOK_erasedSeedShellOK hinc hshell c₀
  have hlocal :
      localCandidateOK c₀.val deleted.val (rowMaskOf P c₀) = true :=
    (localCandidateOK_maskOfFinset_iff c₀ deleted (row P c₀)).2 hspec
  have hcard : (countPoints (rowMaskOf P c₀) labels == 4) = true := by
    have hlocalParts := hlocal
    simp only [localCandidateOK, Bool.and_eq_true] at hlocalParts
    rcases hlocalParts with
      ⟨⟨⟨⟨⟨hcard, _hself⟩, _hmoser⟩, _hnonMoser⟩, _hcap⟩,
        _hdeleted⟩
    exact hcard
  have hsupport : rowMaskOf P c₀ ∈ fourPointMasks :=
    List.mem_filter.mpr
      ⟨List.mem_range.mpr (maskOfFinset_lt_2048 (row P c₀)), hcard⟩
  have hcenterNat : c₀.val ∈ intSNats :=
    val_mem_intSNats_of_mem_intS hshell.1
  have hpinNat : pin.val ∈ intSNats :=
    val_mem_intSNats_of_mem_intS hshell.2.1
  have hpinNeVal : pin.val ≠ c₀.val := by
    intro hval
    exact hshell.2.2.2.1 (Fin.ext hval)
  have hhas : has (rowMaskOf P c₀) pin.val = true := by
    rw [has_rowMaskOf]
    exact (mem_row_iff P c₀ pin).1 hshell.2.2.1
  have hpinAny :
      intSNats.any (fun q => q != c₀.val && has (rowMaskOf P c₀) q) =
        true := by
    rw [List.any_eq_true]
    exact ⟨pin.val, hpinNat, by simp [hpinNeVal, hhas]⟩
  have hdeletedNat : deleted.val ∈ intSNats :=
    val_mem_intSNats_of_mem_intS hshell.2.2.2.2.1
  exact erasedPlacementCheckAt_of_p4sPlacementsAt hcenterNat hsupport
    hpinAny hdeletedNat hlocal

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
