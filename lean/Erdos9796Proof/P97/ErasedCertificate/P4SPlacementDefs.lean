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

/-- Candidate-row domains independent of the fixed P4-S support. -/
def p4sBaseDomains (center deleted : Nat) : List Domain :=
  (variableCentersAt center).map fun variableCenter =>
    { center := variableCenter, rows := candidateRows variableCenter deleted }

/-- P4-S placement check with support-independent candidate domains supplied
by the caller. -/
def p4sPlacementCheckAtWithBaseDomains
    (center support deleted : Nat) (baseDomains : List Domain) : Bool :=
  if !localCandidateOK center deleted support then
    false
  else
    erasedPlacementSearchAtWithBaseDomains center support deleted baseDomains

/-- Hoisting the P4-S base domains does not change the placement verdict. -/
theorem p4sPlacementCheckAtWithBaseDomains_p4sBaseDomains
    (center support deleted : Nat) :
    p4sPlacementCheckAtWithBaseDomains center support deleted
        (p4sBaseDomains center deleted) =
      erasedPlacementCheckAt center support deleted := by
  simp only [p4sPlacementCheckAtWithBaseDomains, p4sBaseDomains,
    erasedPlacementCheckAt]

/-- P4-S placement predicate for one deleted label and support-mask bin, with
the support-independent domains supplied by the caller. -/
def p4sPlacementsAtDeletedChunkWithBaseDomains
    (center deleted chunk : Nat) (baseDomains : List Domain) : Bool :=
  (p4sSupportChunk chunk).all fun support =>
    if intSNats.any fun pin => pin != center && has support pin then
      if localCandidateOK center deleted support then
        erasedPlacementSearchAtWithBaseDomains center support deleted baseDomains
      else
        true
    else
      true

/-- P4-S placement predicate for one deleted label and support-mask bin. -/
def p4sPlacementsAtDeletedChunk
    (center deleted chunk : Nat) : Bool :=
  p4sPlacementsAtDeletedChunkWithBaseDomains center deleted chunk
    (p4sBaseDomains center deleted)

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

/-- A selected set of support-mask bins for one center/deleted-label pair. -/
def p4sPlacementsAtDeletedPairChunkSet
    (center deleted₁ deleted₂ : Nat) (chunks : List Nat) : Bool :=
  chunks.all fun chunk =>
    p4sPlacementsAtDeletedPairChunk center deleted₁ deleted₂ chunk

/-- Evaluation-equivalent chunk-set predicate that constructs each deleted
label's support-independent domains once for the full chunk set. -/
def p4sPlacementsAtDeletedPairChunkSetHoisted
    (center deleted₁ deleted₂ : Nat) (chunks : List Nat) : Bool :=
  let baseDomains₁ := p4sBaseDomains center deleted₁
  let baseDomains₂ := p4sBaseDomains center deleted₂
  chunks.all fun chunk =>
    p4sPlacementsAtDeletedChunkWithBaseDomains center deleted₁ chunk
        baseDomains₁ &&
      p4sPlacementsAtDeletedChunkWithBaseDomains center deleted₂ chunk
        baseDomains₂

/-- Hoisting the two P4-S domain lists across a chunk set does not change its
Boolean certificate. -/
theorem p4sPlacementsAtDeletedPairChunkSetHoisted_eq
    (center deleted₁ deleted₂ : Nat) (chunks : List Nat) :
    p4sPlacementsAtDeletedPairChunkSetHoisted
        center deleted₁ deleted₂ chunks =
      p4sPlacementsAtDeletedPairChunkSet
        center deleted₁ deleted₂ chunks := by
  rfl

/-- Two proved P4-S chunk sets concatenate without re-running the classifier. -/
theorem p4sPlacementsAtDeletedPairChunkSet_append_eq_true
    {center deleted₁ deleted₂ : Nat} {first second : List Nat}
    (hfirst :
      p4sPlacementsAtDeletedPairChunkSet
        center deleted₁ deleted₂ first = true)
    (hsecond :
      p4sPlacementsAtDeletedPairChunkSet
        center deleted₁ deleted₂ second = true) :
    p4sPlacementsAtDeletedPairChunkSet
      center deleted₁ deleted₂ (first ++ second) = true := by
  simpa only [p4sPlacementsAtDeletedPairChunkSet, List.all_append,
    Bool.and_eq_true] using And.intro hfirst hsecond

/-- The balanced second-half split can be reassembled in canonical chunk order.

The native leaves use `[0, 5]` and `[2, 7]` so that the two restartable units
have more comparable support-mask work.  This bridge keeps the consumer's
canonical `[0, 2, 5, 7]` order without assuming an order-invariance theorem
for the recursive evaluator itself. -/
theorem p4sPlacementsAtDeletedPairChunkSet_reordered_second_half_eq_true
    {center deleted₁ deleted₂ : Nat}
    (hfirst :
      p4sPlacementsAtDeletedPairChunkSet center deleted₁ deleted₂
        [0, 5] = true)
    (hsecond :
      p4sPlacementsAtDeletedPairChunkSet center deleted₁ deleted₂
        [2, 7] = true) :
    p4sPlacementsAtDeletedPairChunkSet center deleted₁ deleted₂
      [0, 2, 5, 7] = true := by
  simp only [p4sPlacementsAtDeletedPairChunkSet] at hfirst hsecond ⊢
  apply List.all_eq_true.mpr
  intro chunk hchunk
  have hcases : chunk = 0 ∨ chunk = 2 ∨ chunk = 5 ∨ chunk = 7 := by
    simpa [List.mem_cons] using hchunk
  rcases hcases with rfl | rfl | rfl | rfl
  · exact List.all_eq_true.mp hfirst 0 (by simp)
  · exact List.all_eq_true.mp hsecond 2 (by simp)
  · exact List.all_eq_true.mp hfirst 5 (by simp)
  · exact List.all_eq_true.mp hsecond 7 (by simp)

/-- All eight P4-S support chunks, with each deleted-label domain list built
once for the whole pair certificate. -/
def p4sPlacementsAtDeletedPairChunksHoisted
    (center deleted₁ deleted₂ : Nat) : Bool :=
  p4sPlacementsAtDeletedPairChunkSetHoisted
    center deleted₁ deleted₂ (List.range 8)

/-- The hoisted full P4-S evaluator computes the existing pair certificate. -/
theorem p4sPlacementsAtDeletedPairChunksHoisted_eq
    (center deleted₁ deleted₂ : Nat) :
    p4sPlacementsAtDeletedPairChunksHoisted center deleted₁ deleted₂ =
      p4sPlacementsAtDeletedPairChunks center deleted₁ deleted₂ := by
  rfl

/-- The empirically balanced `168 + 162` support-mask partition reassembles
the eight-bin pair certificate. -/
theorem p4sPlacementsAtDeletedPairChunks_eq_true_of_halves
    {center deleted₁ deleted₂ : Nat}
    (hfirst :
      p4sPlacementsAtDeletedPairChunkSet center deleted₁ deleted₂
        [1, 3, 4, 6] = true)
    (hsecond :
      p4sPlacementsAtDeletedPairChunkSet center deleted₁ deleted₂
        [0, 2, 5, 7] = true) :
    p4sPlacementsAtDeletedPairChunks center deleted₁ deleted₂ = true := by
  simp only [p4sPlacementsAtDeletedPairChunkSet] at hfirst hsecond
  apply List.all_eq_true.mpr
  intro chunk hchunk
  have hchunkLt : chunk < 8 := List.mem_range.mp hchunk
  interval_cases chunk
  · exact List.all_eq_true.mp hsecond 0 (by simp)
  · exact List.all_eq_true.mp hfirst 1 (by simp)
  · exact List.all_eq_true.mp hsecond 2 (by simp)
  · exact List.all_eq_true.mp hfirst 3 (by simp)
  · exact List.all_eq_true.mp hfirst 4 (by simp)
  · exact List.all_eq_true.mp hsecond 5 (by simp)
  · exact List.all_eq_true.mp hfirst 6 (by simp)
  · exact List.all_eq_true.mp hsecond 7 (by simp)

/-- A pair-wide certificate projects to either deleted-label certificate in
each of its eight support-mask bins. -/
theorem p4sPlacementsAtDeletedChunks_eq_true_of_pairChunks
    {center deleted₁ deleted₂ chunk : Nat}
    (hchunks :
      p4sPlacementsAtDeletedPairChunks center deleted₁ deleted₂ = true)
    (hchunk : chunk < 8) :
    p4sPlacementsAtDeletedChunk center deleted₁ chunk = true ∧
      p4sPlacementsAtDeletedChunk center deleted₂ chunk = true := by
  have hpair := List.all_eq_true.mp hchunks chunk (List.mem_range.mpr hchunk)
  simpa only [p4sPlacementsAtDeletedPairChunk, Bool.and_eq_true] using hpair

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
    Census554.CapSelectedNativeClassifier.fourPointMasks_mem_lt_2048 hsupport
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
    have hdeleted₁' :
        (if localCandidateOK center deleted₁ support then
          erasedPlacementCheckAt center support deleted₁ else true) = true := by
      by_cases hlocal : localCandidateOK center deleted₁ support = true
      · simp only [hlocal, if_true] at hdeleted₁ ⊢
        simpa [erasedPlacementCheckAt, p4sBaseDomains, hlocal] using hdeleted₁
      · simp [hlocal]
    have hdeleted₂' :
        (if localCandidateOK center deleted₂ support then
          erasedPlacementCheckAt center support deleted₂ else true) = true := by
      by_cases hlocal : localCandidateOK center deleted₂ support = true
      · simp only [hlocal, if_true] at hdeleted₂ ⊢
        simpa [erasedPlacementCheckAt, p4sBaseDomains, hlocal] using hdeleted₂
      · simp [hlocal]
    simp only [List.all_cons, List.all_nil, Bool.and_true]
    simp [hdeleted₁', hdeleted₂']
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
