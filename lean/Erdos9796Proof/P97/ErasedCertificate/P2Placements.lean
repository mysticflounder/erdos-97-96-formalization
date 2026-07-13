/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.P2Placement7A
import Erdos9796Proof.P97.ErasedCertificate.P2Placement7B
import Erdos9796Proof.P97.ErasedCertificate.P2Placement8A
import Erdos9796Proof.P97.ErasedCertificate.P2Placement8B
import Erdos9796Proof.P97.ErasedCertificate.P2Placement9A
import Erdos9796Proof.P97.ErasedCertificate.P2Placement9B
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10A
import Erdos9796Proof.P97.ErasedCertificate.P2Placement10B

/-!
# Native P2 placement certificates

Eight native shards cover all four non-surplus seed centers and all four
surplus-interior deleted labels.  The dispatcher transports the closed domain
to right- and left-oriented semantic count-row shells.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.CapSelectedFiniteCode
open Census554.CapSelectedNativeClassifier
open Census554.CapSelectedNativeClassifierFacts
open Census554.CapSelectedNativeClassifierSound

/-- Every native P2 center has a complete pair of certificate shards. -/
theorem p2PlacementsAt_eq_true_of_mem {center : Nat}
    (hcenter : center ∈ p2Centers) : p2PlacementsAt center = true := by
  simp [p2Centers] at hcenter
  rcases hcenter with rfl | rfl | rfl | rfl
  · simp [p2PlacementsAt, p2PlacementsAt_seven_a_eq_true,
      p2PlacementsAt_seven_b_eq_true]
  · simp [p2PlacementsAt, p2PlacementsAt_eight_a_eq_true,
      p2PlacementsAt_eight_b_eq_true]
  · simp [p2PlacementsAt, p2PlacementsAt_nine_a_eq_true,
      p2PlacementsAt_nine_b_eq_true]
  · simp [p2PlacementsAt, p2PlacementsAt_ten_a_eq_true,
      p2PlacementsAt_ten_b_eq_true]

/-- Extract one covered P2 placement check from a center certificate. -/
theorem erasedPlacementCheckAt_of_p2PlacementsAt
    {center support deleted : Nat}
    (hcenter : center ∈ p2Centers)
    (hsupport : support ∈ fourPointMasks)
    (hpinAny : intSNats.any (fun q => has support q) = true)
    (hdeleted : deleted ∈ intSNats)
    (hlocal : localCandidateOK center deleted support = true) :
    erasedPlacementCheckAt center support deleted = true := by
  have hcert := p2PlacementsAt_eq_true_of_mem hcenter
  simp only [p2PlacementsAt, Bool.and_eq_true] at hcert
  rcases hcert with ⟨hpairA, hpairB⟩
  have hsupportsA := List.all_eq_true.mp
    (show (fourPointMasks.all fun support =>
      if intSNats.any (fun pin => has support pin) then
        [3, 4].all fun deleted =>
          if localCandidateOK center deleted support then
            erasedPlacementCheckAt center support deleted
          else true
      else true) = true by
        simpa [p2PlacementsAtDeletedPair] using hpairA)
      support hsupport
  have hsupportsB := List.all_eq_true.mp
    (show (fourPointMasks.all fun support =>
      if intSNats.any (fun pin => has support pin) then
        [5, 6].all fun deleted =>
          if localCandidateOK center deleted support then
            erasedPlacementCheckAt center support deleted
          else true
      else true) = true by
        simpa [p2PlacementsAtDeletedPair] using hpairB)
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

/-- A semantic count-row shell whose center lies in the P2 center domain is
covered by the native placement certificates. -/
theorem erasedPlacementCheckAt_rowMaskOf_p2
    {P : PatternCode} {blocker : Label → Label}
    {centerBucket sameBucket leftBucket rightBucket : Finset Label}
    {c₀ pin deleted : Label} {m s l r : Nat}
    (hinc : IncidenceOK P)
    (hshell : ErasedRowShellOK P blocker centerBucket sameBucket
      leftBucket rightBucket c₀ pin deleted m s l r)
    (hcenterNat : c₀.val ∈ p2Centers) :
    erasedPlacementCheckAt c₀.val (rowMaskOf P c₀) deleted.val = true := by
  have hspec :=
    localCandidateSpec_of_incidenceOK_erasedSeedShellOK hinc hshell.1 c₀
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
  have hpinNat : pin.val ∈ intSNats :=
    val_mem_intSNats_of_mem_intS hshell.1.2.1
  have hhas : has (rowMaskOf P c₀) pin.val = true := by
    rw [has_rowMaskOf]
    exact (mem_row_iff P c₀ pin).1 hshell.1.2.2.1
  have hpinAny :
      intSNats.any (fun q => has (rowMaskOf P c₀) q) = true := by
    rw [List.any_eq_true]
    exact ⟨pin.val, hpinNat, hhas⟩
  have hdeletedNat : deleted.val ∈ intSNats :=
    val_mem_intSNats_of_mem_intS hshell.1.2.2.2.2.1
  exact erasedPlacementCheckAt_of_p2PlacementsAt hcenterNat hsupport
    hpinAny hdeletedNat hlocal

/-- Right-oriented count-row shells lie in the P2 certificate domain. -/
theorem erasedPlacementCheckAt_rowMaskOf_right
    {P : PatternCode} {blocker : Label → Label}
    {c₀ pin deleted : Label} {m s l r : Nat}
    (hinc : IncidenceOK P)
    (hshell : RightErasedRowShellOK P blocker c₀ pin deleted m s l r) :
    erasedPlacementCheckAt c₀.val (rowMaskOf P c₀) deleted.val = true := by
  apply erasedPlacementCheckAt_rowMaskOf_p2 hinc hshell
  have hcenter : c₀ = 7 ∨ c₀ = 8 := by
    simpa [intO1] using hshell.1.1
  rcases hcenter with rfl | rfl <;> simp [p2Centers]

/-- Left-oriented count-row shells lie in the P2 certificate domain. -/
theorem erasedPlacementCheckAt_rowMaskOf_left
    {P : PatternCode} {blocker : Label → Label}
    {c₀ pin deleted : Label} {m s l r : Nat}
    (hinc : IncidenceOK P)
    (hshell : LeftErasedRowShellOK P blocker c₀ pin deleted m s l r) :
    erasedPlacementCheckAt c₀.val (rowMaskOf P c₀) deleted.val = true := by
  apply erasedPlacementCheckAt_rowMaskOf_p2 hinc hshell
  have hcenter : c₀ = 9 ∨ c₀ = 10 := by
    simpa [intO2] using hshell.1.1
  rcases hcenter with rfl | rfl <;> simp [p2Centers]

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
