/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import Erdos9796Proof.P97.EndpointCertificate.ShadowBank

/-!
# Endpoint finite shadow search

This module checks the finite endpoint DFS against the 117-row endpoint shadow
bank.  The search definitions live in `ShadowBank`; the heavier coverage
certificate is isolated here so geometry imports can stay lightweight.
-/

namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

namespace Search

/-- Endpoint DFS tail after fixing the `.v` and `.w` masks. -/
def endpointDepth2RestPlan (escapee : Label) : List (Label × List Nat) :=
  [(.u, endpointCandidateMasks escapee .u),
    (.Pw, endpointCandidateMasks escapee .Pw),
    (.Pu, endpointCandidateMasks escapee .Pu),
    (.Q1, endpointCandidateMasks escapee .Q1),
    (.Q2, endpointCandidateMasks escapee .Q2),
    (.s1, endpointCandidateMasks escapee .s1),
    (.s2, endpointCandidateMasks escapee .s2),
    (.s3, endpointCandidateMasks escapee .s3)]

/-- Endpoint DFS masks after fixing `.v` and `.w`. -/
def endpointDepth2StateMasks (vmask wmask : Nat) : List Nat :=
  SurplusCOMPGBank.setCenterMask
    (SurplusCOMPGBank.setCenterMask SurplusCOMPGBank.emptyShadowMasks .v vmask)
    .w wmask

/-- Endpoint DFS pair counts after fixing `.v` and `.w`. -/
def endpointDepth2StateCounts (vmask wmask : Nat) : List Nat :=
  SurplusCOMPGBank.incrementPairCounts .w wmask
    (SurplusCOMPGBank.incrementPairCounts .v vmask
      SurplusCOMPGBank.emptyPairCounts)

/-- Endpoint DFS subtree after fixing `.v` and `.w`. -/
def endpointDepth2SubtreeResult
    (escapee : Label) (vmask wmask : Nat) : List (List Nat) :=
  endpointSearchAux escapee [.w, .v] (endpointDepth2StateMasks vmask wmask)
    (endpointDepth2StateCounts vmask wmask)
    (endpointDepth2RestPlan escapee)

/-- Boolean certificate that one depth-2 endpoint subtree is row-bank covered. -/
def endpointDepth2SubtreeAllAccepted
    (escapee : Label) (vmask wmask : Nat) : Bool :=
  (endpointDepth2SubtreeResult escapee vmask wmask).all
    (fun masks => containsEntry (escapee, masks) endpointRowEntries)

/-- Endpoint DFS tail after fixing the `.v`, `.w`, and `.u` masks. -/
def endpointDepth3RestPlan (escapee : Label) : List (Label × List Nat) :=
  [(.Pw, endpointCandidateMasks escapee .Pw),
    (.Pu, endpointCandidateMasks escapee .Pu),
    (.Q1, endpointCandidateMasks escapee .Q1),
    (.Q2, endpointCandidateMasks escapee .Q2),
    (.s1, endpointCandidateMasks escapee .s1),
    (.s2, endpointCandidateMasks escapee .s2),
    (.s3, endpointCandidateMasks escapee .s3)]

/-- Endpoint DFS masks after fixing `.v`, `.w`, and `.u`. -/
def endpointDepth3StateMasks (vmask wmask umask : Nat) : List Nat :=
  SurplusCOMPGBank.setCenterMask
    (endpointDepth2StateMasks vmask wmask) .u umask

/-- Endpoint DFS pair counts after fixing `.v`, `.w`, and `.u`. -/
def endpointDepth3StateCounts (vmask wmask umask : Nat) : List Nat :=
  SurplusCOMPGBank.incrementPairCounts .u umask
    (endpointDepth2StateCounts vmask wmask)

/-- Endpoint DFS subtree after fixing `.v`, `.w`, and `.u`. -/
def endpointDepth3SubtreeResult
    (escapee : Label) (vmask wmask umask : Nat) : List (List Nat) :=
  endpointSearchAux escapee [.u, .w, .v]
    (endpointDepth3StateMasks vmask wmask umask)
    (endpointDepth3StateCounts vmask wmask umask)
    (endpointDepth3RestPlan escapee)

/-- Boolean certificate that one depth-3 endpoint subtree is row-bank covered. -/
def endpointDepth3SubtreeAllAccepted
    (escapee : Label) (vmask wmask umask : Nat) : Bool :=
  (endpointDepth3SubtreeResult escapee vmask wmask umask).all
    (fun masks => containsEntry (escapee, masks) endpointRowEntries)

/-- Boolean certificate that every valid endpoint shadow in one fixed depth-3
subtree is row-bank covered. -/
def endpointDepth3SubtreeValidAllAccepted
    (escapee : Label) (vmask wmask umask : Nat) : Bool :=
  (endpointDepth3SubtreeResult escapee vmask wmask umask).all
    (fun masks =>
      !endpointShadowOK escapee { masks := masks } ||
        containsEntry (escapee, masks) endpointRowEntries)

/-- Boolean certificate that all `.u` branches under fixed `.v`/`.w`
are row-bank covered. -/
def endpointDepth3UBranchesAllAccepted
    (escapee : Label) (vmask wmask : Nat) : Bool :=
  (endpointCandidateMasks escapee .u).all
    (fun umask => endpointDepth3SubtreeAllAccepted escapee vmask wmask umask)

/-- Candidate `.v` masks for the `.Q1` endpoint branch. -/
def endpointQ1VMasks : List Nat :=
  [452, 456, 464, 480]

/-- Candidate `.v` masks for the `.Q2` endpoint branch. -/
def endpointQ2VMasks : List Nat :=
  [708, 712, 720, 736]

/-- Candidate `.w` masks for both endpoint branches. -/
def endpointWMasks : List Nat :=
  [771, 777, 785, 801]

/-- Candidate `.u` masks for both endpoint branches. -/
def endpointUMasks : List Nat :=
  [30, 46, 54, 58, 60, 90, 106, 114, 120, 154, 170, 178, 184, 284, 300, 308,
    312, 344, 360, 368, 408, 424, 432, 540, 556, 564, 568, 600, 616, 624,
    664, 680, 688]

/-- The `.Q1` endpoint branch has the four expected `.v` masks. -/
theorem endpointCandidateMasks_q1_v :
    endpointCandidateMasks .Q1 .v = endpointQ1VMasks := by
  native_decide

/-- The `.Q2` endpoint branch has the four expected `.v` masks. -/
theorem endpointCandidateMasks_q2_v :
    endpointCandidateMasks .Q2 .v = endpointQ2VMasks := by
  native_decide

/-- The `.Q1` endpoint branch has the four expected `.w` masks. -/
theorem endpointCandidateMasks_q1_w :
    endpointCandidateMasks .Q1 .w = endpointWMasks := by
  native_decide

/-- The `.Q2` endpoint branch has the four expected `.w` masks. -/
theorem endpointCandidateMasks_q2_w :
    endpointCandidateMasks .Q2 .w = endpointWMasks := by
  native_decide

/-- The `.Q1` endpoint branch has the expected `.u` masks. -/
theorem endpointCandidateMasks_q1_u :
    endpointCandidateMasks .Q1 .u = endpointUMasks := by
  native_decide

/-- The `.Q2` endpoint branch has the expected `.u` masks. -/
theorem endpointCandidateMasks_q2_u :
    endpointCandidateMasks .Q2 .u = endpointUMasks := by
  native_decide

private theorem list_all_eq_true_of_containsEntry
    {p : (Label × List Nat) → Bool} {entry : Label × List Nat} :
    {entries : List (Label × List Nat)} →
      entries.all p = true → containsEntry entry entries = true → p entry = true
  | [], _hall, hcontains => by
      simp [containsEntry] at hcontains
  | head :: tail, hall, hcontains => by
      simp only [List.all_cons, Bool.and_eq_true] at hall
      by_cases hhead : head = entry
      · subst head
        exact hall.1
      · simp [containsEntry, hhead] at hcontains
        exact list_all_eq_true_of_containsEntry hall.2 hcontains

theorem containsEntry_eq_true_of_mem {entry : Label × List Nat} :
    {entries : List (Label × List Nat)} →
      entry ∈ entries → containsEntry entry entries = true
  | [], h => by cases h
  | head :: tail, h => by
      cases h with
      | head => simp [containsEntry]
      | tail _ htail =>
          by_cases hhead : head = entry
          · simp [containsEntry, hhead]
          · simp [containsEntry, hhead, containsEntry_eq_true_of_mem htail]

theorem hasTenMasks_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    shadow.hasTenMasks = true := by
  cases escapee <;>
    simp [endpointShadowOK, endpointVShapeOK, escapeeOK] at h ⊢ <;>
    simp_all

theorem searchSeparationOK_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    SurplusCOMPGBank.searchSeparationOK shadow = true := by
  cases escapee <;>
    simp [endpointShadowOK, endpointVShapeOK, escapeeOK] at h ⊢ <;>
    simp_all

theorem searchPairCountsOK_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    SurplusCOMPGBank.searchPairCountsOK shadow = true := by
  cases escapee <;>
    simp [endpointShadowOK, endpointVShapeOK, escapeeOK] at h ⊢ <;>
    simp_all

theorem escapeeOK_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    escapeeOK escapee = true := by
  cases escapee <;>
    simp [endpointShadowOK, endpointVShapeOK, escapeeOK] at h ⊢ <;>
    simp_all

theorem maskNormalized_of_endpointCandidateMaskOK
    {escapee center : Label} {mask : Nat}
    (h : endpointCandidateMaskOK escapee center mask = true) :
    SurplusCOMPGBank.maskNormalized mask = true := by
  cases escapee <;> cases center <;>
    simp [endpointCandidateMaskOK, escapeeOK] at h ⊢ <;>
    simp_all

theorem endpointCandidateMaskOK_of_endpointShadowOK
    {escapee center : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    endpointCandidateMaskOK escapee center (shadow.centerMask center) = true := by
  cases escapee <;> cases center <;>
    simp [endpointShadowOK, endpointCandidateMaskOK, endpointVShapeOK,
      endpointWShapeOK, escapeeOK, SurplusCOMPGBank.Shadow.classesShapeOK,
      SurplusCOMPGBank.Shadow.classShapeOKAt,
      SurplusCOMPGBank.Shadow.classHas, SurplusCOMPGBank.oneHitOK,
      SurplusCOMPGBank.circumcenterOK, SurplusCOMPGBank.circumcenterOKAt,
      SurplusCOMPGBank.allLabels, SurplusCOMPGBank.isMoserLabel] at h ⊢ <;>
    simp_all

theorem mem_endpointCandidateMasks_of_endpointShadowOK
    {escapee center : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    shadow.centerMask center ∈ endpointCandidateMasks escapee center := by
  rw [endpointCandidateMasks]
  have hOK := endpointCandidateMaskOK_of_endpointShadowOK
    (center := center) h
  exact List.mem_filter.mpr
    ⟨SurplusCOMPGBank.mem_allNormalizedMasks_of_maskNormalized
      (maskNormalized_of_endpointCandidateMaskOK hOK), hOK⟩

theorem pairCountsOK_shadowPairCountsForAssigned_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow} {assigned : List Label}
    (h : endpointShadowOK escapee shadow = true)
    (hprefix : assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes) :
    SurplusCOMPGBank.pairCountsOK
      (SurplusCOMPGBank.shadowPairCountsForAssigned shadow assigned) = true := by
  exact SurplusCOMPGBank.pairCountsOK_shadowPairCountsForAssigned_of_searchPairCountsOK
    (searchPairCountsOK_of_endpointShadowOK h) hprefix

theorem mem_endpointSearchAux_nil_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow} {assigned : List Label}
    {masks pairCounts : List Nat}
    (hvalid : endpointShadowOK escapee shadow = true)
    (hmasks : masks = shadow.masks)
    (hcounts : SurplusCOMPGBank.pairCountsOK pairCounts = true) :
    shadow.masks ∈ endpointSearchAux escapee assigned masks pairCounts [] := by
  subst masks
  have hlen : shadow.masks.length = SurplusCOMPGBank.labelCount := by
    simpa [SurplusCOMPGBank.Shadow.hasTenMasks] using
      hasTenMasks_of_endpointShadowOK hvalid
  unfold endpointSearchAux
  simp [hlen, hcounts]

theorem mem_endpointSearchAux_cons
    {target masks pairCounts : List Nat} {escapee center : Label}
    {assigned : List Label} {candidates : List Nat}
    {rest : List (Label × List Nat)} {mask : Nat}
    (hmem : mask ∈ candidates)
    (hsep :
      SurplusCOMPGBank.assignedSeparationOK center mask assigned masks = true)
    (hcounts : SurplusCOMPGBank.pairCountsOK
      (SurplusCOMPGBank.incrementPairCounts center mask pairCounts) = true)
    (htail : target ∈ endpointSearchAux escapee (center :: assigned)
      (SurplusCOMPGBank.setCenterMask masks center mask)
      (SurplusCOMPGBank.incrementPairCounts center mask pairCounts) rest) :
    target ∈ endpointSearchAux escapee assigned masks pairCounts
      ((center, candidates) :: rest) := by
  unfold endpointSearchAux
  exact List.mem_flatMap.mpr ⟨mask, hmem, by simpa [hsep, hcounts] using htail⟩

theorem mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow} {center : Label}
    {assigned : List Label} {rest : List (Label × List Nat)}
    (hvalid : endpointShadowOK escapee shadow = true)
    (hprefix : assigned ∈ SurplusCOMPGBank.fragmentSearchAssignedPrefixes)
    (hnext : center :: assigned ∈
      SurplusCOMPGBank.fragmentSearchAssignedPrefixes)
    (hne : ∀ other, other ∈ assigned → center ≠ other)
    (htail : shadow.masks ∈ endpointSearchAux escapee (center :: assigned)
      (SurplusCOMPGBank.shadowMasksForAssigned shadow (center :: assigned))
      (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
        (center :: assigned)) rest) :
    shadow.masks ∈ endpointSearchAux escapee assigned
      (SurplusCOMPGBank.shadowMasksForAssigned shadow assigned)
      (SurplusCOMPGBank.shadowPairCountsForAssigned shadow assigned)
      ((center, endpointCandidateMasks escapee center) :: rest) := by
  apply mem_endpointSearchAux_cons
  · exact mem_endpointCandidateMasks_of_endpointShadowOK
      (center := center) hvalid
  · exact SurplusCOMPGBank.assignedSeparationOK_of_searchSeparationOK
      (searchSeparationOK_of_endpointShadowOK hvalid)
      (fun other hmem =>
        SurplusCOMPGBank.centerMaskOf_shadowMasksForAssigned_of_mem
          hprefix hmem)
      hne
  · simpa [SurplusCOMPGBank.shadowPairCountsForAssigned] using
      pairCountsOK_shadowPairCountsForAssigned_of_endpointShadowOK
        hvalid hnext
  · simpa [SurplusCOMPGBank.shadowMasksForAssigned,
      SurplusCOMPGBank.shadowPairCountsForAssigned] using htail

theorem shadow_mem_endpointSearchAux_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow}
    (hvalid : endpointShadowOK escapee shadow = true) :
    shadow.masks ∈ endpointSearchAux escapee []
      SurplusCOMPGBank.emptyShadowMasks SurplusCOMPGBank.emptyPairCounts
      (endpointSearchPlan escapee) := by
  have hcounts : SurplusCOMPGBank.pairCountsOK
      (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
        SurplusCOMPGBank.fullFragmentSearchAssigned) = true := by
    exact pairCountsOK_shadowPairCountsForAssigned_of_endpointShadowOK hvalid
      (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes,
        SurplusCOMPGBank.fullFragmentSearchAssigned])
  have h10 : shadow.masks ∈ endpointSearchAux escapee
      SurplusCOMPGBank.fullFragmentSearchAssigned
      (SurplusCOMPGBank.shadowMasksForAssigned shadow
        SurplusCOMPGBank.fullFragmentSearchAssigned)
      (SurplusCOMPGBank.shadowPairCountsForAssigned shadow
        SurplusCOMPGBank.fullFragmentSearchAssigned) [] := by
    exact mem_endpointSearchAux_nil_of_endpointShadowOK hvalid
      (SurplusCOMPGBank.shadowMasksForFullFragmentSearchAssigned_eq_of_hasTenMasks
        (hasTenMasks_of_endpointShadowOK hvalid)) hcounts
  have h9 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .s3)
    (assigned := [.s2, .s1, .Q2, .Q1, .Pu, .Pw, .u, .w, .v])
    (rest := []) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h10
  have h8 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .s2)
    (assigned := [.s1, .Q2, .Q1, .Pu, .Pw, .u, .w, .v])
    (rest := [(.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h9
  have h7 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .s1)
    (assigned := [.Q2, .Q1, .Pu, .Pw, .u, .w, .v])
    (rest := [(.s2, endpointCandidateMasks escapee .s2),
      (.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h8
  have h6 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .Q2)
    (assigned := [.Q1, .Pu, .Pw, .u, .w, .v])
    (rest := [(.s1, endpointCandidateMasks escapee .s1),
      (.s2, endpointCandidateMasks escapee .s2),
      (.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h7
  have h5 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .Q1)
    (assigned := [.Pu, .Pw, .u, .w, .v])
    (rest := [(.Q2, endpointCandidateMasks escapee .Q2),
      (.s1, endpointCandidateMasks escapee .s1),
      (.s2, endpointCandidateMasks escapee .s2),
      (.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h6
  have h4 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .Pu)
    (assigned := [.Pw, .u, .w, .v])
    (rest := [(.Q1, endpointCandidateMasks escapee .Q1),
      (.Q2, endpointCandidateMasks escapee .Q2),
      (.s1, endpointCandidateMasks escapee .s1),
      (.s2, endpointCandidateMasks escapee .s2),
      (.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h5
  have h3 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .Pw)
    (assigned := [.u, .w, .v])
    (rest := [(.Pu, endpointCandidateMasks escapee .Pu),
      (.Q1, endpointCandidateMasks escapee .Q1),
      (.Q2, endpointCandidateMasks escapee .Q2),
      (.s1, endpointCandidateMasks escapee .s1),
      (.s2, endpointCandidateMasks escapee .s2),
      (.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h4
  have h2 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .u)
    (assigned := [.w, .v])
    (rest := [(.Pw, endpointCandidateMasks escapee .Pw),
      (.Pu, endpointCandidateMasks escapee .Pu),
      (.Q1, endpointCandidateMasks escapee .Q1),
      (.Q2, endpointCandidateMasks escapee .Q2),
      (.s1, endpointCandidateMasks escapee .s1),
      (.s2, endpointCandidateMasks escapee .s2),
      (.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h3
  have h1 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .w)
    (assigned := [.v])
    (rest := [(.u, endpointCandidateMasks escapee .u),
      (.Pw, endpointCandidateMasks escapee .Pw),
      (.Pu, endpointCandidateMasks escapee .Pu),
      (.Q1, endpointCandidateMasks escapee .Q1),
      (.Q2, endpointCandidateMasks escapee .Q2),
      (.s1, endpointCandidateMasks escapee .s1),
      (.s2, endpointCandidateMasks escapee .s2),
      (.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h2
  have h0 := mem_endpointSearchAux_shadow_step_of_endpointShadowOK
    (escapee := escapee) (shadow := shadow) (center := .v)
    (assigned := [])
    (rest := [(.w, endpointCandidateMasks escapee .w),
      (.u, endpointCandidateMasks escapee .u),
      (.Pw, endpointCandidateMasks escapee .Pw),
      (.Pu, endpointCandidateMasks escapee .Pu),
      (.Q1, endpointCandidateMasks escapee .Q1),
      (.Q2, endpointCandidateMasks escapee .Q2),
      (.s1, endpointCandidateMasks escapee .s1),
      (.s2, endpointCandidateMasks escapee .s2),
      (.s3, endpointCandidateMasks escapee .s3)]) hvalid
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by simp [SurplusCOMPGBank.fragmentSearchAssignedPrefixes])
    (by intro other hmem; cases other <;> simp at hmem ⊢) h1
  simpa [endpointSearchPlan, endpointSearchOrder,
    SurplusCOMPGBank.shadowMasksForAssigned,
    SurplusCOMPGBank.shadowPairCountsForAssigned,
    SurplusCOMPGBank.emptyShadowMasks] using h0

theorem mem_endpointSearchEscapees_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    escapee ∈ endpointSearchEscapees := by
  have hesc := escapeeOK_of_endpointShadowOK h
  cases escapee <;> simp [escapeeOK, endpointSearchEscapees] at hesc ⊢

theorem computedEndpointShadowAcceptedBySearch_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    computedEndpointShadowAcceptedBySearch escapee shadow = true := by
  have hpath : shadow.masks ∈ endpointSearchAux escapee []
      SurplusCOMPGBank.emptyShadowMasks SurplusCOMPGBank.emptyPairCounts
      (endpointSearchPlan escapee) :=
    shadow_mem_endpointSearchAux_of_endpointShadowOK h
  have hentryFor : (escapee, shadow.masks) ∈
      rawEndpointSearchEntriesFor escapee := by
    unfold rawEndpointSearchEntriesFor
    exact List.mem_map.mpr ⟨shadow.masks, hpath, rfl⟩
  have hentry : (escapee, shadow.masks) ∈ computedEndpointSearchEntries := by
    unfold computedEndpointSearchEntries
    exact List.mem_flatMap.mpr
      ⟨escapee, mem_endpointSearchEscapees_of_endpointShadowOK h, hentryFor⟩
  simp [computedEndpointShadowAcceptedBySearch,
    hasTenMasks_of_endpointShadowOK h, containsEntry_eq_true_of_mem hentry]

end Search

end ShadowBank

end EndpointCertificate

end Problem97
