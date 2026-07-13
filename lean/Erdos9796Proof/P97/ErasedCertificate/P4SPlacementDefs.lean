/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.ErasedClassifierSound

/-!
# P4-S placement certificate definitions

The 1,440-cell P4-S domain is split by surplus-interior seed center, deleted
label pair, and eight support-mask bins.  Keeping each native theorem small
avoids excessive generated-code size while preserving an exact partition of
the original domain.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.CapSelectedNativeClassifier

/-- One of eight disjoint numeric bins covering all 11-bit support masks. -/
def p4sSupportChunk (chunk : Nat) : List Nat :=
  fourPointMasks.filter fun support => support / 256 == chunk

/-- P4-S placement predicate for one deleted label and support-mask bin. -/
def p4sPlacementsAtDeletedChunk
    (center deleted chunk : Nat) : Bool :=
  (p4sSupportChunk chunk).all fun support =>
    if intSNats.any fun pin => pin != center && has support pin then
      if localCandidateOK center deleted support then
        erasedPlacementCheckAt center support deleted
      else
        true
    else
      true

/-- Pair two deleted-label certificates on one support-mask bin. -/
def p4sPlacementsAtDeletedPairChunk
    (center deleted₁ deleted₂ chunk : Nat) : Bool :=
  p4sPlacementsAtDeletedChunk center deleted₁ chunk &&
    p4sPlacementsAtDeletedChunk center deleted₂ chunk

/-- All eight support-mask bins are certified for one center/deleted pair. -/
def p4sPlacementsAtDeletedPairChunks
    (center deleted₁ deleted₂ : Nat) : Bool :=
  (List.range 8).all fun chunk =>
    p4sPlacementsAtDeletedPairChunk center deleted₁ deleted₂ chunk

/-- P4-S placement predicate at one seed center for two deleted labels. -/
def p4sPlacementsAtDeletedPair (center deleted₁ deleted₂ : Nat) : Bool :=
  fourPointMasks.all fun support =>
    if intSNats.any fun pin => pin != center && has support pin then
      [deleted₁, deleted₂].all fun deleted =>
        if localCandidateOK center deleted support then
          erasedPlacementCheckAt center support deleted
        else
          true
    else
      true

/-- The eight numeric support bins reassemble the full center/deleted-pair
predicate. -/
theorem p4sPlacementsAtDeletedPair_eq_true_of_chunks
    {center deleted₁ deleted₂ : Nat}
    (hchunks :
      p4sPlacementsAtDeletedPairChunks center deleted₁ deleted₂ = true) :
    p4sPlacementsAtDeletedPair center deleted₁ deleted₂ = true := by
  apply List.all_eq_true.mpr
  intro support hsupport
  have hsupportLt : support < 2048 :=
    List.mem_range.mp (List.mem_filter.mp hsupport).1
  have hchunkLt : support / 256 < 8 := by
    simpa using
      ((Nat.div_lt_iff_lt_mul (by norm_num : 0 < 256)).2 hsupportLt)
  have hchunk := List.all_eq_true.mp hchunks (support / 256)
    (List.mem_range.mpr hchunkLt)
  have hsupportChunk : support ∈ p4sSupportChunk (support / 256) := by
    exact List.mem_filter.mpr ⟨hsupport, by simp⟩
  simp only [p4sPlacementsAtDeletedPairChunk, Bool.and_eq_true] at hchunk
  rcases hchunk with ⟨hchunk₁, hchunk₂⟩
  have hdeleted₁ := List.all_eq_true.mp hchunk₁ support hsupportChunk
  have hdeleted₂ := List.all_eq_true.mp hchunk₂ support hsupportChunk
  by_cases hpin :
      intSNats.any (fun pin => pin != center && has support pin) = true
  · simp only [hpin, if_true] at hdeleted₁ hdeleted₂ ⊢
    simp only [List.all_cons, List.all_nil, Bool.and_true]
    simp [hdeleted₁, hdeleted₂]
  · have hpinFalse :
        intSNats.any (fun pin => pin != center && has support pin) = false :=
      Bool.eq_false_iff.mpr hpin
    simp [hpinFalse]

/-- Complete P4-S placement predicate at one seed center. -/
def p4sPlacementsAt (center : Nat) : Bool :=
  p4sPlacementsAtDeletedPair center 3 4 &&
    p4sPlacementsAtDeletedPair center 5 6

/-- Complete P4-S predicate over the four surplus-interior seed centers. -/
def p4sPlacementsAll : Bool :=
  intSNats.all p4sPlacementsAt

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
