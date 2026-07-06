/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusCOMPGBank

/-!
# Seeded one-sided surplus shadows

This module isolates the finite incidence search used for the erased one-sided
surplus residual.  Unlike the pinned surplus COMP-G bank, the seed here fixes
the two non-surplus exact-cap masks and then adds one private-centered
one-sided class.
-/

namespace Problem97
namespace SurplusCOMPGBank

/-- Which Moser-pair branch the private-centered one-sided seed represents. -/
inductive OneSidedSeedKind where
  | own
  | oppositeU
  | oppositeW
  deriving DecidableEq, BEq, Repr

/-- A finite seed for the one-sided erased residual. -/
structure OneSidedSeed where
  sstar : Label
  privateCenter : Label
  kind : OneSidedSeedKind
  privateMask : Nat
  deriving DecidableEq, BEq, Repr

/-- Exact-cap mask for the first non-surplus apex in right-oriented labels. -/
def firstOppExactCapMask : Nat :=
  maskOfLabels [.u, .w, .Pw, .Pu]

/-- Exact-cap mask for the second non-surplus apex in right-oriented labels. -/
def secondOppExactCapMask : Nat :=
  maskOfLabels [.u, .v, .Q1, .Q2]

/-- Local candidate predicate for seeded one-sided shadows.

This is the pinned-bank local predicate with the `.v` pinned-class requirement
removed; the seeded search fixes `.v` separately to `firstOppExactCapMask`.
-/
def oneSidedSeedCandidateMaskOK (sstar center : Label) (mask : Nat) : Bool :=
  maskNormalized mask &&
    maskCard mask == 4 &&
    !maskHas mask center &&
    (if center == .w then
      maskHas mask .Q1 && maskHas mask .Q2 &&
        (maskInterCard mask cuNoWMask == 1) &&
        (maskInterCard mask cvNoWMask == 1)
     else
      true) &&
    (if center == .u then
      decide (maskInterCard mask cvNoUMask <= 1) &&
        decide (maskInterCard mask cwNoUMask <= 1)
     else
      true) &&
    (if center == .w then
      decide (maskInterCard mask cvNoWMask <= 1) &&
        decide (maskInterCard mask cuNoWMask <= 1)
     else
      true) &&
    (if isMoserLabel center then
      true
     else
      !(maskHas mask .u && maskHas mask .v && maskHas mask .w)) &&
    localTriggerOKAt sstar center mask

/-- Filter-generated local candidates for the seeded one-sided search. -/
def oneSidedSeedCandidateMasksByFilter (sstar center : Label) : List Nat :=
  allNormalizedMasks.filter (oneSidedSeedCandidateMaskOK sstar center ·)

/-- Fixed masks supplied by a one-sided seed. -/
def OneSidedSeed.fixedMask (seed : OneSidedSeed) (center : Label) :
    Option Nat :=
  if center == .v then
    some firstOppExactCapMask
  else if center == .w then
    some secondOppExactCapMask
  else if center == seed.privateCenter then
    some seed.privateMask
  else
    none

/-- Candidate masks for one center under a fixed seed. -/
def OneSidedSeed.candidateMasks (seed : OneSidedSeed) (center : Label) :
    List Nat :=
  match seed.fixedMask center with
  | some mask =>
      if oneSidedSeedCandidateMaskOK seed.sstar center mask then [mask] else []
  | none => oneSidedSeedCandidateMasksByFilter seed.sstar center

/-- Search order used by the seeded one-sided DFS. -/
def OneSidedSeed.searchOrder (_seed : OneSidedSeed) : List Label :=
  fragmentSearchOrder

/-- Search plan for one seed. -/
def OneSidedSeed.searchPlan (seed : OneSidedSeed) :
    List (Label × List Nat) :=
  seed.searchOrder.map (fun center => (center, seed.candidateMasks center))

/-- The global Boolean validity predicate for seeded one-sided shadows. -/
def isValidOneSidedSeedShadow (seed : OneSidedSeed) (shadow : Shadow) :
    Bool :=
  isSurplusStar seed.sstar &&
    shadow.hasTenMasks &&
    shadow.classesShapeOK &&
    (shadow.centerMask .v == firstOppExactCapMask) &&
    (shadow.centerMask .w == secondOppExactCapMask) &&
    (shadow.centerMask seed.privateCenter == seed.privateMask) &&
    wSqueezeOK shadow &&
    oneHitOK shadow &&
    circumcenterOK shadow &&
    noThreeOK shadow &&
    searchPairCountsOK shadow &&
    separationOK shadow &&
    searchSeparationOK shadow &&
    fragmentTriggersOK seed.sstar shadow

/-- DFS over candidate masks for one fixed seed. -/
def oneSidedSeedSearchAux
    (seed : OneSidedSeed) (assigned : List Label) (masks pairCounts : List Nat)
    (plan : List (Label × List Nat)) : List (List Nat) :=
  match plan with
  | [] =>
      if isValidOneSidedSeedShadow seed { masks := masks } then
        [masks]
      else
        []
  | (center, candidates) :: rest =>
      candidates.flatMap
        (fun mask =>
          let masks' := setCenterMask masks center mask
          let pairCounts' := incrementPairCounts center mask pairCounts
          if assignedSeparationOK center mask assigned masks &&
              pairCountsOK pairCounts' then
            oneSidedSeedSearchAux seed (center :: assigned) masks' pairCounts'
              rest
          else
            [])
termination_by plan.length
decreasing_by
  simp_wf

/-- Results for one seed. -/
def oneSidedSeedSearchEntriesFor (seed : OneSidedSeed) :
    List (OneSidedSeed × List Nat) :=
  (oneSidedSeedSearchAux seed [] emptyShadowMasks emptyPairCounts
    seed.searchPlan).map (fun masks => (seed, masks))

/-- The 18 right-oriented one-sided seeds. -/
def oneSidedSeeds : List OneSidedSeed :=
  [{ sstar := .s1, privateCenter := .Pw, kind := .own,
      privateMask := maskOfLabels [.u, .w, .s1, .Pu] },
    { sstar := .s1, privateCenter := .Pu, kind := .own,
      privateMask := maskOfLabels [.u, .w, .s1, .Pw] },
    { sstar := .s1, privateCenter := .Pw, kind := .oppositeU,
      privateMask := maskOfLabels [.u, .v, .s1, .Pu] },
    { sstar := .s1, privateCenter := .Pu, kind := .oppositeU,
      privateMask := maskOfLabels [.u, .v, .s1, .Pw] },
    { sstar := .s1, privateCenter := .Pw, kind := .oppositeW,
      privateMask := maskOfLabels [.v, .w, .s1, .Pu] },
    { sstar := .s1, privateCenter := .Pu, kind := .oppositeW,
      privateMask := maskOfLabels [.v, .w, .s1, .Pw] },
    { sstar := .s2, privateCenter := .Pw, kind := .own,
      privateMask := maskOfLabels [.u, .w, .s2, .Pu] },
    { sstar := .s2, privateCenter := .Pu, kind := .own,
      privateMask := maskOfLabels [.u, .w, .s2, .Pw] },
    { sstar := .s2, privateCenter := .Pw, kind := .oppositeU,
      privateMask := maskOfLabels [.u, .v, .s2, .Pu] },
    { sstar := .s2, privateCenter := .Pu, kind := .oppositeU,
      privateMask := maskOfLabels [.u, .v, .s2, .Pw] },
    { sstar := .s2, privateCenter := .Pw, kind := .oppositeW,
      privateMask := maskOfLabels [.v, .w, .s2, .Pu] },
    { sstar := .s2, privateCenter := .Pu, kind := .oppositeW,
      privateMask := maskOfLabels [.v, .w, .s2, .Pw] },
    { sstar := .s3, privateCenter := .Pw, kind := .own,
      privateMask := maskOfLabels [.u, .w, .s3, .Pu] },
    { sstar := .s3, privateCenter := .Pu, kind := .own,
      privateMask := maskOfLabels [.u, .w, .s3, .Pw] },
    { sstar := .s3, privateCenter := .Pw, kind := .oppositeU,
      privateMask := maskOfLabels [.u, .v, .s3, .Pu] },
    { sstar := .s3, privateCenter := .Pu, kind := .oppositeU,
      privateMask := maskOfLabels [.u, .v, .s3, .Pw] },
    { sstar := .s3, privateCenter := .Pw, kind := .oppositeW,
      privateMask := maskOfLabels [.v, .w, .s3, .Pu] },
    { sstar := .s3, privateCenter := .Pu, kind := .oppositeW,
      privateMask := maskOfLabels [.v, .w, .s3, .Pw] }]

/-- The `.Pw` own-endpoint seed is one of the finite one-sided seeds. -/
theorem ownPwSeed_mem_oneSidedSeeds {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    { sstar := sstar, privateCenter := .Pw, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pu] } ∈
      oneSidedSeeds := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals simp [oneSidedSeeds]

/-- The `.Pu` own-endpoint seed is one of the finite one-sided seeds. -/
theorem ownPuSeed_mem_oneSidedSeeds {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    { sstar := sstar, privateCenter := .Pu, kind := .own,
      privateMask := maskOfLabels [.u, .w, sstar, .Pw] } ∈
      oneSidedSeeds := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals simp [oneSidedSeeds]

/-- The `.Pw` opposite-`u` seed is one of the finite one-sided seeds. -/
theorem oppositeUPwSeed_mem_oneSidedSeeds {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    { sstar := sstar, privateCenter := .Pw, kind := .oppositeU,
      privateMask := maskOfLabels [.u, .v, sstar, .Pu] } ∈
      oneSidedSeeds := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals simp [oneSidedSeeds]

/-- The `.Pu` opposite-`u` seed is one of the finite one-sided seeds. -/
theorem oppositeUPuSeed_mem_oneSidedSeeds {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    { sstar := sstar, privateCenter := .Pu, kind := .oppositeU,
      privateMask := maskOfLabels [.u, .v, sstar, .Pw] } ∈
      oneSidedSeeds := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals simp [oneSidedSeeds]

/-- The `.Pw` opposite-`w` seed is one of the finite one-sided seeds. -/
theorem oppositeWPwSeed_mem_oneSidedSeeds {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    { sstar := sstar, privateCenter := .Pw, kind := .oppositeW,
      privateMask := maskOfLabels [.v, .w, sstar, .Pu] } ∈
      oneSidedSeeds := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals simp [oneSidedSeeds]

/-- The `.Pu` opposite-`w` seed is one of the finite one-sided seeds. -/
theorem oppositeWPuSeed_mem_oneSidedSeeds {sstar : Label}
    (hs : isSurplusStar sstar = true) :
    { sstar := sstar, privateCenter := .Pu, kind := .oppositeW,
      privateMask := maskOfLabels [.v, .w, sstar, .Pw] } ∈
      oneSidedSeeds := by
  cases sstar <;> simp [isSurplusStar] at hs
  all_goals simp [oneSidedSeeds]

/-- All seeded one-sided DFS entries. -/
def oneSidedSeedSearchEntries : List (OneSidedSeed × List Nat) :=
  oneSidedSeeds.flatMap oneSidedSeedSearchEntriesFor

/-- Per-seed result counts, kept as a compact audit datum. -/
def oneSidedSeedSearchCounts : List Nat :=
  oneSidedSeeds.map (fun seed => (oneSidedSeedSearchEntriesFor seed).length)

/-- The seeded validity predicate contains the generated search-separation
check. -/
theorem searchSeparationOK_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow}
    (h : isValidOneSidedSeedShadow seed shadow = true) :
    searchSeparationOK shadow = true := by
  cases seed with
  | mk sstar privateCenter kind privateMask =>
      cases sstar <;>
        simp [isValidOneSidedSeedShadow, isSurplusStar] at h ⊢ <;>
        simp_all

/-- The seeded validity predicate contains the generated prefix pair-count
check. -/
theorem searchPairCountsOK_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow}
    (h : isValidOneSidedSeedShadow seed shadow = true) :
    searchPairCountsOK shadow = true := by
  cases seed with
  | mk sstar privateCenter kind privateMask =>
      cases sstar <;>
        simp [isValidOneSidedSeedShadow, isSurplusStar] at h ⊢ <;>
        simp_all

/-- The seeded validity predicate contains the ten-mask shape check. -/
theorem hasTenMasks_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow}
    (h : isValidOneSidedSeedShadow seed shadow = true) :
    shadow.hasTenMasks = true := by
  cases seed with
  | mk sstar privateCenter kind privateMask =>
      cases sstar <;>
        simp [isValidOneSidedSeedShadow, isSurplusStar] at h ⊢ <;>
        simp_all

/-- The seeded validity predicate implies the seeded local candidate predicate
for each center. -/
theorem oneSidedSeedCandidateMaskOK_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow} {center : Label}
    (h : isValidOneSidedSeedShadow seed shadow = true) :
    oneSidedSeedCandidateMaskOK seed.sstar center
      (shadow.centerMask center) = true := by
  cases seed with
  | mk sstar privateCenter kind privateMask =>
      cases sstar <;> cases center <;>
        simp [isValidOneSidedSeedShadow, oneSidedSeedCandidateMaskOK,
          Shadow.classesShapeOK, Shadow.classShapeOKAt, Shadow.classHas,
          allLabels, wSqueezeOK, oneHitOK, circumcenterOK,
          circumcenterOKAt, fragmentTriggersOK, triggerPrivateOKAt,
          previousSstarCenters, localTriggerOKAt, isSurplusStar,
          isMoserLabel] at h ⊢ <;>
        simp_all <;>
        native_decide

/-- A seeded local candidate mask is normalized. -/
theorem maskNormalized_of_oneSidedSeedCandidateMaskOK
    {sstar center : Label} {mask : Nat}
    (h : oneSidedSeedCandidateMaskOK sstar center mask = true) :
    maskNormalized mask = true := by
  by_cases hnorm : maskNormalized mask = true
  · exact hnorm
  · simp [oneSidedSeedCandidateMaskOK, hnorm] at h

/-- Filter-generated seeded candidates contain every mask satisfying the
seeded local predicate. -/
theorem mem_oneSidedSeedCandidateMasksByFilter_of_candidate
    {sstar center : Label} {mask : Nat}
    (h : oneSidedSeedCandidateMaskOK sstar center mask = true) :
    mask ∈ oneSidedSeedCandidateMasksByFilter sstar center := by
  rw [oneSidedSeedCandidateMasksByFilter]
  exact List.mem_filter.mpr
    ⟨mem_allNormalizedMasks_of_maskNormalized
      (maskNormalized_of_oneSidedSeedCandidateMaskOK h), h⟩

/-- A valid seeded shadow supplies a candidate mask at every search center. -/
theorem mem_seed_candidateMasks_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow} {center : Label}
    (h : isValidOneSidedSeedShadow seed shadow = true) :
    shadow.centerMask center ∈ seed.candidateMasks center := by
  have hcandidate :=
    oneSidedSeedCandidateMaskOK_of_isValidOneSidedSeedShadow
      (seed := seed) (shadow := shadow) (center := center) h
  cases seed with
  | mk sstar privateCenter kind privateMask =>
      cases center <;> cases privateCenter <;>
        simp [OneSidedSeed.candidateMasks, OneSidedSeed.fixedMask,
          isValidOneSidedSeedShadow] at h hcandidate ⊢
      all_goals
        first
        | exact mem_oneSidedSeedCandidateMasksByFilter_of_candidate hcandidate
        | simp_all

/-- The generated separation checker supplies the assigned-prefix guard used
by the seeded DFS. -/
theorem assignedSeparationOK_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow} {center : Label}
    {assigned : List Label} {masks : List Nat}
    (hvalid : isValidOneSidedSeedShadow seed shadow = true)
    (hmask : ∀ other, other ∈ assigned ->
      centerMaskOf masks other = shadow.centerMask other)
    (hne : ∀ other, other ∈ assigned -> center ≠ other) :
    assignedSeparationOK center (shadow.centerMask center) assigned masks =
      true := by
  exact assignedSeparationOK_of_searchSeparationOK
    (searchSeparationOK_of_isValidOneSidedSeedShadow hvalid) hmask hne

/-- The generated prefix pair-count checker supplies the pair-count guard used
by the seeded DFS. -/
theorem pairCountsOK_shadowPairCountsForAssigned_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow} {assigned : List Label}
    (hvalid : isValidOneSidedSeedShadow seed shadow = true)
    (hprefix : assigned ∈ fragmentSearchAssignedPrefixes) :
    pairCountsOK (shadowPairCountsForAssigned shadow assigned) = true := by
  exact pairCountsOK_shadowPairCountsForAssigned_of_searchPairCountsOK
    (searchPairCountsOK_of_isValidOneSidedSeedShadow hvalid) hprefix

/-- One step of the seeded DFS contains the valid shadow whenever the tail
search does. -/
theorem mem_oneSidedSeedSearchAux_cons
    {target masks pairCounts : List Nat} {seed : OneSidedSeed}
    {center : Label} {assigned : List Label} {candidates : List Nat}
    {rest : List (Label × List Nat)} {mask : Nat}
    (hmem : mask ∈ candidates)
    (hsep : assignedSeparationOK center mask assigned masks = true)
    (hcounts : pairCountsOK (incrementPairCounts center mask pairCounts) = true)
    (htail : target ∈ oneSidedSeedSearchAux seed (center :: assigned)
      (setCenterMask masks center mask)
      (incrementPairCounts center mask pairCounts) rest) :
    target ∈ oneSidedSeedSearchAux seed assigned masks pairCounts
      ((center, candidates) :: rest) := by
  unfold oneSidedSeedSearchAux
  exact List.mem_flatMap.mpr ⟨mask, hmem, by
    simpa [hsep, hcounts] using htail⟩

/-- The terminal seeded DFS step contains a valid shadow. -/
theorem mem_oneSidedSeedSearchAux_nil_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow} {assigned : List Label}
    {masks pairCounts : List Nat}
    (hvalid : isValidOneSidedSeedShadow seed shadow = true)
    (hmasks : masks = shadow.masks) :
    shadow.masks ∈ oneSidedSeedSearchAux seed assigned masks pairCounts [] := by
  subst masks
  unfold oneSidedSeedSearchAux
  simpa using hvalid

/-- Search-step membership for valid seeded shadows in the standard generated
search order. -/
theorem mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow} {center : Label}
    {assigned : List Label} {rest : List (Label × List Nat)}
    (hvalid : isValidOneSidedSeedShadow seed shadow = true)
    (hprefix : assigned ∈ fragmentSearchAssignedPrefixes)
    (hnext : center :: assigned ∈ fragmentSearchAssignedPrefixes)
    (hne : ∀ other, other ∈ assigned -> center ≠ other)
    (htail : shadow.masks ∈ oneSidedSeedSearchAux seed (center :: assigned)
      (shadowMasksForAssigned shadow (center :: assigned))
      (shadowPairCountsForAssigned shadow (center :: assigned)) rest) :
    shadow.masks ∈ oneSidedSeedSearchAux seed assigned
      (shadowMasksForAssigned shadow assigned)
      (shadowPairCountsForAssigned shadow assigned)
      ((center, seed.candidateMasks center) :: rest) := by
  apply mem_oneSidedSeedSearchAux_cons
  · exact mem_seed_candidateMasks_of_isValidOneSidedSeedShadow
      (center := center) hvalid
  · exact assignedSeparationOK_of_isValidOneSidedSeedShadow hvalid
      (fun other hmem => centerMaskOf_shadowMasksForAssigned_of_mem hprefix hmem)
      hne
  · simpa [shadowPairCountsForAssigned] using
      pairCountsOK_shadowPairCountsForAssigned_of_isValidOneSidedSeedShadow
        hvalid hnext
  · simpa [shadowMasksForAssigned, shadowPairCountsForAssigned] using htail

/-- Every valid seeded shadow appears in the seeded DFS for that seed. -/
theorem shadow_mem_oneSidedSeedSearchAux_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow}
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    shadow.masks ∈ oneSidedSeedSearchAux seed [] emptyShadowMasks
      emptyPairCounts seed.searchPlan := by
  have h10 : shadow.masks ∈ oneSidedSeedSearchAux seed fullFragmentSearchAssigned
      (shadowMasksForAssigned shadow fullFragmentSearchAssigned)
      (shadowPairCountsForAssigned shadow fullFragmentSearchAssigned) [] := by
    exact mem_oneSidedSeedSearchAux_nil_of_isValidOneSidedSeedShadow hvalid
      (shadowMasksForFullFragmentSearchAssigned_eq_of_hasTenMasks
        (hasTenMasks_of_isValidOneSidedSeedShadow hvalid))
  have h9 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .s3)
    (assigned := [.s2, .s1, .Q2, .Q1, .Pu, .Pw, .u, .w, .v])
    (rest := []) hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h10
  have h8 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .s2)
    (assigned := [.s1, .Q2, .Q1, .Pu, .Pw, .u, .w, .v])
    (rest := [(.s3, seed.candidateMasks .s3)]) hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h9
  have h7 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .s1)
    (assigned := [.Q2, .Q1, .Pu, .Pw, .u, .w, .v])
    (rest := [(.s2, seed.candidateMasks .s2), (.s3, seed.candidateMasks .s3)])
    hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h8
  have h6 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .Q2)
    (assigned := [.Q1, .Pu, .Pw, .u, .w, .v])
    (rest := [(.s1, seed.candidateMasks .s1), (.s2, seed.candidateMasks .s2),
      (.s3, seed.candidateMasks .s3)]) hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h7
  have h5 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .Q1)
    (assigned := [.Pu, .Pw, .u, .w, .v])
    (rest := [(.Q2, seed.candidateMasks .Q2), (.s1, seed.candidateMasks .s1),
      (.s2, seed.candidateMasks .s2), (.s3, seed.candidateMasks .s3)]) hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h6
  have h4 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .Pu)
    (assigned := [.Pw, .u, .w, .v])
    (rest := [(.Q1, seed.candidateMasks .Q1), (.Q2, seed.candidateMasks .Q2),
      (.s1, seed.candidateMasks .s1), (.s2, seed.candidateMasks .s2),
      (.s3, seed.candidateMasks .s3)]) hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h5
  have h3 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .Pw)
    (assigned := [.u, .w, .v])
    (rest := [(.Pu, seed.candidateMasks .Pu), (.Q1, seed.candidateMasks .Q1),
      (.Q2, seed.candidateMasks .Q2), (.s1, seed.candidateMasks .s1),
      (.s2, seed.candidateMasks .s2), (.s3, seed.candidateMasks .s3)])
    hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h4
  have h2 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .u)
    (assigned := [.w, .v])
    (rest := [(.Pw, seed.candidateMasks .Pw), (.Pu, seed.candidateMasks .Pu),
      (.Q1, seed.candidateMasks .Q1), (.Q2, seed.candidateMasks .Q2),
      (.s1, seed.candidateMasks .s1), (.s2, seed.candidateMasks .s2),
      (.s3, seed.candidateMasks .s3)]) hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h3
  have h1 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .w)
    (assigned := [.v])
    (rest := [(.u, seed.candidateMasks .u), (.Pw, seed.candidateMasks .Pw),
      (.Pu, seed.candidateMasks .Pu), (.Q1, seed.candidateMasks .Q1),
      (.Q2, seed.candidateMasks .Q2), (.s1, seed.candidateMasks .s1),
      (.s2, seed.candidateMasks .s2), (.s3, seed.candidateMasks .s3)]) hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h2
  have h0 := mem_oneSidedSeedSearchAux_shadow_step_of_isValidOneSidedSeedShadow
    (seed := seed) (shadow := shadow) (center := .v)
    (assigned := [])
    (rest := [(.w, seed.candidateMasks .w), (.u, seed.candidateMasks .u),
      (.Pw, seed.candidateMasks .Pw), (.Pu, seed.candidateMasks .Pu),
      (.Q1, seed.candidateMasks .Q1), (.Q2, seed.candidateMasks .Q2),
      (.s1, seed.candidateMasks .s1), (.s2, seed.candidateMasks .s2),
      (.s3, seed.candidateMasks .s3)]) hvalid
    (by simp [fragmentSearchAssignedPrefixes])
    (by simp [fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h1
  simpa [OneSidedSeed.searchPlan, OneSidedSeed.searchOrder,
    fragmentSearchOrder, shadowMasksForAssigned,
    shadowPairCountsForAssigned, emptyShadowMasks] using h0

/-- Every valid seeded shadow appears in the entry list for its seed. -/
theorem mem_oneSidedSeedSearchEntriesFor_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow}
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    (seed, shadow.masks) ∈ oneSidedSeedSearchEntriesFor seed := by
  unfold oneSidedSeedSearchEntriesFor
  exact List.mem_map.mpr
    ⟨shadow.masks,
      shadow_mem_oneSidedSeedSearchAux_of_isValidOneSidedSeedShadow hvalid,
      rfl⟩

/-- Every valid seeded shadow for a listed seed appears in the combined seeded
entry list. -/
theorem mem_oneSidedSeedSearchEntries_of_isValidOneSidedSeedShadow
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ oneSidedSeeds)
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    (seed, shadow.masks) ∈ oneSidedSeedSearchEntries := by
  unfold oneSidedSeedSearchEntries
  exact List.mem_flatMap.mpr
    ⟨seed, hseed,
      mem_oneSidedSeedSearchEntriesFor_of_isValidOneSidedSeedShadow hvalid⟩

/-- The seeded one-sided incidence search has no surviving shadows. -/
theorem oneSidedSeedSearchEntries_eq_nil :
    oneSidedSeedSearchEntries = [] := by
  native_decide

/-- No listed seed admits a valid seeded shadow. -/
theorem false_of_isValidOneSidedSeedShadow_of_mem_seed
    {seed : OneSidedSeed} {shadow : Shadow}
    (hseed : seed ∈ oneSidedSeeds)
    (hvalid : isValidOneSidedSeedShadow seed shadow = true) :
    False := by
  have hmem :=
    mem_oneSidedSeedSearchEntries_of_isValidOneSidedSeedShadow hseed hvalid
  simp [oneSidedSeedSearchEntries_eq_nil] at hmem

/-- The per-seed census is zero for all 18 seed variants. -/
theorem oneSidedSeedSearchCounts_eq :
    oneSidedSeedSearchCounts =
      [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] := by
  native_decide

end SurplusCOMPGBank
end Problem97
