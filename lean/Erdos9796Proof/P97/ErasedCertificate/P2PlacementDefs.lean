/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ErasedCertificate.ErasedClassifierSound

/-!
# P2 placement certificate definitions

The 3,056-cell P2 domain is split by non-surplus seed center, deleted label,
and eight support-mask bins.  Lightweight pair aggregators reconstruct the
original predicate from the fine-grained native certificate units.
-/

namespace Problem97
namespace ErasedCertificate
namespace ErasedNativeClassifier

open Census554.CapSelectedNativeClassifier

/-- Native values of all first- and second-opposite interior centers. -/
def p2Centers : List Nat := [7, 8, 9, 10]

/-- Balanced eight-way partition key for the P2 support masks.  Folding the
three low bit groups keeps every active P2 shard between 21 and 25 searches;
the previous high-bit partition ranged from 0 to 65. -/
def p2SupportChunkIndex (support : Nat) : Nat :=
  (support % 8 + 7 * ((support / 8) % 8) +
    2 * ((support / 64) % 8)) % 8

/-- One of eight disjoint balanced bins covering all 11-bit support masks. -/
def p2SupportChunk (chunk : Nat) : List Nat :=
  fourPointMasks.filter fun support => p2SupportChunkIndex support == chunk

/-- Candidate-row domains independent of the fixed P2 support. -/
def p2BaseDomains (center deleted : Nat) : List Domain :=
  (variableCentersAt center).map fun variableCenter =>
    { center := variableCenter, rows := candidateRows variableCenter deleted }

/-- P2 placement check with the support-independent candidate domains supplied
by the caller.  A shard can therefore construct them once and share them
across all of its support masks. -/
def erasedPlacementCheckAtWithBaseDomains
    (center support deleted : Nat) (baseDomains : List Domain) : Bool :=
  let fixed : Row := { center := center, support := support }
  if !localCandidateOK fixed.center deleted fixed.support then
    false
  else
    let assigned := [fixed]
    let domains := baseDomains.map (restrictDomain assigned)
    if domains.any fun domain => domain.rows.isEmpty then
      true
    else
      allKilledAt center (variableCentersAt center).length assigned domains

/-- Hoisting the P2 base domains does not change the placement verdict. -/
theorem erasedPlacementCheckAtWithBaseDomains_p2BaseDomains
    (center support deleted : Nat) :
    erasedPlacementCheckAtWithBaseDomains center support deleted
        (p2BaseDomains center deleted) =
      erasedPlacementCheckAt center support deleted := by
  simp only [erasedPlacementCheckAtWithBaseDomains, p2BaseDomains,
    erasedPlacementCheckAt, List.map_map]
  rfl

/-- P2 placement predicate for one deleted label and support-mask bin. -/
def p2PlacementsAtDeletedChunkWithBaseDomains
    (center deleted chunk : Nat) (baseDomains : List Domain) : Bool :=
  (p2SupportChunk chunk).all fun support =>
    if intSNats.any fun pin => has support pin then
      if localCandidateOK center deleted support then
        erasedPlacementCheckAtWithBaseDomains center support deleted baseDomains
      else
        true
    else
      true

/-- P2 placement predicate for one deleted label and support-mask bin. -/
def p2PlacementsAtDeletedChunk
    (center deleted chunk : Nat) : Bool :=
  p2PlacementsAtDeletedChunkWithBaseDomains center deleted chunk
    (p2BaseDomains center deleted)

/-- Pair two deleted-label certificates on one support-mask bin. -/
def p2PlacementsAtDeletedPairChunk
    (center deleted₁ deleted₂ chunk : Nat) : Bool :=
  p2PlacementsAtDeletedChunk center deleted₁ chunk &&
    p2PlacementsAtDeletedChunk center deleted₂ chunk

/-- All eight support-mask bins are certified for one center/deleted pair. -/
def p2PlacementsAtDeletedPairChunks
    (center deleted₁ deleted₂ : Nat) : Bool :=
  (List.range 8).all fun chunk =>
    p2PlacementsAtDeletedPairChunk center deleted₁ deleted₂ chunk

/-- A selected set of support-mask bins for one center/deleted-label pair. -/
def p2PlacementsAtDeletedPairChunkSet
    (center deleted₁ deleted₂ : Nat) (chunks : List Nat) : Bool :=
  chunks.all fun chunk =>
    p2PlacementsAtDeletedPairChunk center deleted₁ deleted₂ chunk

/-- Evaluation-equivalent chunk-set predicate that constructs each deleted
label's support-independent domains once for the full chunk set. -/
def p2PlacementsAtDeletedPairChunkSetHoisted
    (center deleted₁ deleted₂ : Nat) (chunks : List Nat) : Bool :=
  let baseDomains₁ := p2BaseDomains center deleted₁
  let baseDomains₂ := p2BaseDomains center deleted₂
  chunks.all fun chunk =>
    p2PlacementsAtDeletedChunkWithBaseDomains center deleted₁ chunk
        baseDomains₁ &&
      p2PlacementsAtDeletedChunkWithBaseDomains center deleted₂ chunk
        baseDomains₂

/-- Hoisting the two P2 domain lists across a chunk set does not change its
Boolean certificate. -/
theorem p2PlacementsAtDeletedPairChunkSetHoisted_eq
    (center deleted₁ deleted₂ : Nat) (chunks : List Nat) :
    p2PlacementsAtDeletedPairChunkSetHoisted
        center deleted₁ deleted₂ chunks =
      p2PlacementsAtDeletedPairChunkSet
        center deleted₁ deleted₂ chunks := by
  rfl

/-- Two proved P2 chunk sets concatenate without re-running the classifier. -/
theorem p2PlacementsAtDeletedPairChunkSet_append_eq_true
    {center deleted₁ deleted₂ : Nat} {first second : List Nat}
    (hfirst :
      p2PlacementsAtDeletedPairChunkSet
        center deleted₁ deleted₂ first = true)
    (hsecond :
      p2PlacementsAtDeletedPairChunkSet
        center deleted₁ deleted₂ second = true) :
    p2PlacementsAtDeletedPairChunkSet
      center deleted₁ deleted₂ (first ++ second) = true := by
  simpa only [p2PlacementsAtDeletedPairChunkSet, List.all_append,
    Bool.and_eq_true] using And.intro hfirst hsecond

/-- All eight P2 support chunks, with each deleted-label domain list built
once for the whole pair certificate. -/
def p2PlacementsAtDeletedPairChunksHoisted
    (center deleted₁ deleted₂ : Nat) : Bool :=
  p2PlacementsAtDeletedPairChunkSetHoisted
    center deleted₁ deleted₂ (List.range 8)

/-- The hoisted full P2 evaluator computes the existing pair certificate. -/
theorem p2PlacementsAtDeletedPairChunksHoisted_eq
    (center deleted₁ deleted₂ : Nat) :
    p2PlacementsAtDeletedPairChunksHoisted center deleted₁ deleted₂ =
      p2PlacementsAtDeletedPairChunks center deleted₁ deleted₂ := by
  rfl

/-- The two four-bin halves reassemble the eight-bin pair certificate. -/
theorem p2PlacementsAtDeletedPairChunks_eq_true_of_halves
    {center deleted₁ deleted₂ : Nat}
    (hfirst :
      p2PlacementsAtDeletedPairChunkSet center deleted₁ deleted₂
        [0, 1, 5, 6] = true)
    (hsecond :
      p2PlacementsAtDeletedPairChunkSet center deleted₁ deleted₂
        [2, 3, 4, 7] = true) :
    p2PlacementsAtDeletedPairChunks center deleted₁ deleted₂ = true := by
  simp only [p2PlacementsAtDeletedPairChunkSet] at hfirst hsecond
  apply List.all_eq_true.mpr
  intro chunk hchunk
  have hchunkLt : chunk < 8 := List.mem_range.mp hchunk
  interval_cases chunk
  · exact List.all_eq_true.mp hfirst 0 (by simp)
  · exact List.all_eq_true.mp hfirst 1 (by simp)
  · exact List.all_eq_true.mp hsecond 2 (by simp)
  · exact List.all_eq_true.mp hsecond 3 (by simp)
  · exact List.all_eq_true.mp hsecond 4 (by simp)
  · exact List.all_eq_true.mp hfirst 5 (by simp)
  · exact List.all_eq_true.mp hfirst 6 (by simp)
  · exact List.all_eq_true.mp hsecond 7 (by simp)

/-- A pair-wide certificate projects to either deleted-label certificate in
each of its eight support-mask bins. -/
theorem p2PlacementsAtDeletedChunks_eq_true_of_pairChunks
    {center deleted₁ deleted₂ chunk : Nat}
    (hchunks :
      p2PlacementsAtDeletedPairChunks center deleted₁ deleted₂ = true)
    (hchunk : chunk < 8) :
    p2PlacementsAtDeletedChunk center deleted₁ chunk = true ∧
      p2PlacementsAtDeletedChunk center deleted₂ chunk = true := by
  have hpair := List.all_eq_true.mp hchunks chunk (List.mem_range.mpr hchunk)
  simpa only [p2PlacementsAtDeletedPairChunk, Bool.and_eq_true] using hpair

/-- P2 placement predicate at one center for two deleted labels. -/
def p2PlacementsAtDeletedPair (center deleted₁ deleted₂ : Nat) : Bool :=
  fourPointMasks.all fun support =>
    if intSNats.any fun pin => has support pin then
      [deleted₁, deleted₂].all fun deleted =>
        if localCandidateOK center deleted support then
          erasedPlacementCheckAt center support deleted
        else
          true
    else
      true

/-- The eight balanced support bins reassemble the full center/deleted-pair
predicate. -/
theorem p2PlacementsAtDeletedPair_eq_true_of_chunks
    {center deleted₁ deleted₂ : Nat}
    (hchunks :
      p2PlacementsAtDeletedPairChunks center deleted₁ deleted₂ = true) :
    p2PlacementsAtDeletedPair center deleted₁ deleted₂ = true := by
  apply List.all_eq_true.mpr
  intro support hsupport
  have hchunkLt : p2SupportChunkIndex support < 8 := by
    exact Nat.mod_lt _ (by norm_num)
  have hchunk := List.all_eq_true.mp hchunks (p2SupportChunkIndex support)
    (List.mem_range.mpr hchunkLt)
  have hsupportChunk :
      support ∈ p2SupportChunk (p2SupportChunkIndex support) := by
    exact List.mem_filter.mpr ⟨hsupport, by simp⟩
  simp only [p2PlacementsAtDeletedPairChunk, Bool.and_eq_true] at hchunk
  rcases hchunk with ⟨hchunk₁, hchunk₂⟩
  have hdeleted₁ := List.all_eq_true.mp hchunk₁ support hsupportChunk
  have hdeleted₂ := List.all_eq_true.mp hchunk₂ support hsupportChunk
  rw [erasedPlacementCheckAtWithBaseDomains_p2BaseDomains] at hdeleted₁
  rw [erasedPlacementCheckAtWithBaseDomains_p2BaseDomains] at hdeleted₂
  by_cases hpin : intSNats.any (fun pin => has support pin) = true
  · simp only [hpin, if_true] at hdeleted₁ hdeleted₂ ⊢
    simp only [List.all_cons, List.all_nil, Bool.and_true]
    simp [hdeleted₁, hdeleted₂]
  · have hpinFalse : intSNats.any (fun pin => has support pin) = false :=
      Bool.eq_false_iff.mpr hpin
    simp [hpinFalse]

/-- Complete P2 placement predicate at one non-surplus center. -/
def p2PlacementsAt (center : Nat) : Bool :=
  p2PlacementsAtDeletedPair center 3 4 &&
    p2PlacementsAtDeletedPair center 5 6

end ErasedNativeClassifier
end ErasedCertificate
end Problem97
