/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceIndexedBankCoverage

/-!
# Authenticated exact-13 representative certificate ingress

This module translates the wave5 bank records at indices `0` and `8949` into
typed checked entries.  The first record is the mirror one-form with atoms
`L11,L8,T11,T8`; the second is the mirror two-form with atoms
`G12_1,G12_9,G8_1,G8_12,L_12,L_9`.  No exhaustive bank or closure claim is
made here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenExact13RepresentativeCertificate

open CardGeThirteenExact13SourceIndexedBankCoverage
open CardGeThirteenExact13SourceIndexedFiniteKey
open CardGeThirteenExact13SourceOrderBridge
open CardGeThirteenExact13WeightedProviderBankBridge
open DRExactThirteenValuation
open ProviderRowNogoodCertificate

attribute [local instance] Classical.propDecidable

def mirrorPosition (i : Fin 13) : Fin 13 := orderIndex true i

def wave5G12 : Exact13Provider := .g ⟨12, by decide⟩
def wave5G8 : Exact13Provider := .g ⟨8, by decide⟩

def oneFormCenters : Exact13Provider → Fin 13
  | .c0 => 10
  | .c1 => 12
  | .k => 3
  | .l => 3
  | .t => 7
  | .g center => mirrorPosition center.1

def oneFormSupports : Exact13Provider → Finset (Fin 13)
  | .c0 => {1, 2, 11, 12}
  | .c1 => {3, 4, 5, 6}
  | .k => {0, 7, 9, 10}
  | .l => {4, 8, 11, 12}
  | .t => {8, 9, 10, 11}
  | .g center =>
      if center.1 = 11 then {8, 9, 10, 12}
      else if center.1 = 9 then {8, 10, 11, 12}
      else if center.1 = 10 then ∅
      else if center.1 = 12 then ∅
      else {9, 10, 11, 12}

def oneFormKey : Key where
  centerOf := oneFormCenters
  supportOf := oneFormSupports
  orientation := true
  z := 8
  a := 11
  b := 12
  other := .c0

def oneFormChoices : List (ProviderRowChoice Exact13Provider (Fin 13)) :=
  [ exact13ProviderEdgeChoice .l (mirrorPosition 11) (mirrorPosition 8)
  , exact13ProviderEdgeChoice .t (mirrorPosition 11) (mirrorPosition 8) ]

def oneFormData : ProviderWeightedKalmansonCancellationData Exact13Provider 13 :=
  { terms :=
      [ { quad := ⟨mirrorPosition 0, mirrorPosition 1,
            mirrorPosition 8, mirrorPosition 11⟩
          form := .innerOuter
          weight := 1 } ]
    pairings :=
      [ { left := (mirrorPosition 0, mirrorPosition 11)
          right := (mirrorPosition 0, mirrorPosition 8)
          path :=
            { first := (mirrorPosition 0, mirrorPosition 11)
              steps := [ .row .l (mirrorPosition 11) (mirrorPosition 8) ]
              last := (mirrorPosition 0, mirrorPosition 8) } }
      , { left := (mirrorPosition 1, mirrorPosition 8)
          right := (mirrorPosition 1, mirrorPosition 11)
          path :=
            { first := (mirrorPosition 1, mirrorPosition 8)
              steps := [ .row .t (mirrorPosition 8) (mirrorPosition 11) ]
              last := (mirrorPosition 1, mirrorPosition 11) } } ] }

def oneFormEntry : Entry where
  centers := oneFormCenters
  choices := oneFormChoices
  data := oneFormData
  checked := by decide

def oneFormCandidates : List Candidate :=
  [ ⟨.l, 11, 8, true⟩
  , ⟨.t, 11, 8, true⟩ ]

def twoFormCenters : Exact13Provider → Fin 13
  | .c0 => 11
  | .c1 => 1
  | .k => 3
  | .l => 3
  | .t => 7
  | .g center => mirrorPosition center.1

def twoFormSupports : Exact13Provider → Finset (Fin 13)
  | .c0 => {0, 4, 6, 9}
  | .c1 => {3, 5, 7, 12}
  | .k => {1, 2, 10, 11}
  | .l => {0, 8, 9, 12}
  | .t => {3, 4, 9, 11}
  | .g center =>
      if center.1 = 10 then {5, 6, 11, 12}
      else if center.1 = 12 then {2, 7, 9, 10}
      else if center.1 = 2 then {1, 6, 8, 11}
      else if center.1 = 8 then {4, 7, 10, 12}
      else if center.1 = 9 then {0, 2, 5, 8}
      else if center.1 = 6 then ∅
      else if center.1 = 11 then ∅
      else if center.1 = 3 then {0, 3, 5, 10}
      else if center.1 = 4 then {2, 3, 6, 12}
      else if center.1 = 5 then {2, 4, 7, 8}
      else {0, 1, 6, 7}

def twoFormKey : Key where
  centerOf := twoFormCenters
  supportOf := twoFormSupports
  orientation := true
  z := 8
  a := 9
  b := 2
  other := .c0

def twoFormChoices : List (ProviderRowChoice Exact13Provider (Fin 13)) :=
  [ exact13ProviderEdgeChoice .l (mirrorPosition 12) (mirrorPosition 9)
  , exact13ProviderEdgeChoice wave5G12 (mirrorPosition 9) (mirrorPosition 1)
  , exact13ProviderEdgeChoice wave5G8 (mirrorPosition 1) (mirrorPosition 12) ]

def twoFormData : ProviderWeightedKalmansonCancellationData Exact13Provider 13 :=
  { terms :=
      [ { quad := ⟨mirrorPosition 0, mirrorPosition 1,
            mirrorPosition 9, mirrorPosition 12⟩
          form := .innerOuter
          weight := 1 }
      , { quad := ⟨mirrorPosition 1, mirrorPosition 8,
            mirrorPosition 9, mirrorPosition 12⟩
          form := .adjacentSides
          weight := 1 } ]
    pairings :=
      [ { left := (mirrorPosition 0, mirrorPosition 12)
          right := (mirrorPosition 0, mirrorPosition 9)
          path :=
            { first := (mirrorPosition 0, mirrorPosition 12)
              steps := [ .row .l (mirrorPosition 12) (mirrorPosition 9) ]
              last := (mirrorPosition 0, mirrorPosition 9) } }
      , { left := (mirrorPosition 9, mirrorPosition 12)
          right := (mirrorPosition 1, mirrorPosition 12)
          path :=
            { first := (mirrorPosition 9, mirrorPosition 12)
              steps :=
                [ .flip (mirrorPosition 9) (mirrorPosition 12)
                , .row wave5G12 (mirrorPosition 9) (mirrorPosition 1)
                , .flip (mirrorPosition 12) (mirrorPosition 1) ]
              last := (mirrorPosition 1, mirrorPosition 12) } }
      , { left := (mirrorPosition 1, mirrorPosition 9)
          right := (mirrorPosition 1, mirrorPosition 9)
          path :=
            { first := (mirrorPosition 1, mirrorPosition 9)
              steps := []
              last := (mirrorPosition 1, mirrorPosition 9) } }
      , { left := (mirrorPosition 1, mirrorPosition 8)
          right := (mirrorPosition 8, mirrorPosition 12)
          path :=
            { first := (mirrorPosition 1, mirrorPosition 8)
              steps :=
                [ .flip (mirrorPosition 1) (mirrorPosition 8)
                , .row wave5G8 (mirrorPosition 1) (mirrorPosition 12) ]
              last := (mirrorPosition 8, mirrorPosition 12) } } ] }

def twoFormEntry : Entry where
  centers := twoFormCenters
  choices := twoFormChoices
  data := twoFormData
  checked := by decide

def twoFormCandidates : List Candidate :=
  [ ⟨.l, 12, 9, true⟩
  , ⟨wave5G12, 9, 1, true⟩
  , ⟨wave5G8, 1, 12, true⟩ ]

theorem oneForm_data_check :
    oneFormEntry.data.check oneFormEntry.choices oneFormEntry.checkPattern = true :=
  oneFormEntry.checked

theorem twoForm_data_check :
    twoFormEntry.data.check twoFormEntry.choices twoFormEntry.checkPattern = true :=
  twoFormEntry.checked

theorem keyEntryCovers_of_source_candidates
    (k : Key) (e : Entry) (hcenters : e.centers = k.centerOf)
    (candidates : List Candidate)
    (hsource : ∀ candidate ∈ candidates, KeyCandidateMatches k candidate)
    (hchoices : candidates.map (keyPositionalEdgeChoice k) = e.choices) :
    KeyEntryCovers k e :=
  ⟨hcenters, candidates, hsource, hchoices⟩

theorem oneForm_keyEntryCovers :
    KeyEntryCovers oneFormKey oneFormEntry := by
  apply keyEntryCovers_of_source_candidates oneFormKey oneFormEntry rfl
    oneFormCandidates
  · intro candidate hcandidate
    have hcandidate' :
        candidate = ⟨.l, 11, 8, true⟩ ∨ candidate = ⟨.t, 11, 8, true⟩ := by
      simpa only [oneFormCandidates, List.mem_cons, List.mem_singleton,
        List.not_mem_nil, or_false] using hcandidate
    rcases hcandidate' with h | h
    · subst candidate
      simp [KeyCandidateMatches, oneFormKey, oneFormSupports,
      Key.rawSupport, orderIndex, mirrorIndex, mirrorValue]
    · subst candidate
      simp [KeyCandidateMatches, oneFormKey, oneFormSupports,
        Key.rawSupport, orderIndex, mirrorIndex, mirrorValue]
  · rfl

theorem twoForm_keyEntryCovers :
    KeyEntryCovers twoFormKey twoFormEntry := by
  apply keyEntryCovers_of_source_candidates twoFormKey twoFormEntry rfl
    twoFormCandidates
  · intro candidate hcandidate
    have hcandidate' :
        candidate = ⟨.l, 12, 9, true⟩ ∨
          candidate = ⟨wave5G12, 9, 1, true⟩ ∨
          candidate = ⟨wave5G8, 1, 12, true⟩ := by
      simpa only [twoFormCandidates, List.mem_cons, List.mem_singleton,
        List.not_mem_nil, or_false] using hcandidate
    rcases hcandidate' with h | h | h
    · subst candidate
      simp [KeyCandidateMatches, twoFormKey, twoFormSupports,
        Key.rawSupport, orderIndex, mirrorIndex, mirrorValue]
    · subst candidate
      simp [KeyCandidateMatches, twoFormKey, twoFormSupports,
        Key.rawSupport, orderIndex, mirrorIndex, mirrorValue,
        wave5G12]
    · subst candidate
      simp [KeyCandidateMatches, twoFormKey, twoFormSupports,
        Key.rawSupport, orderIndex, mirrorIndex, mirrorValue,
        wave5G8]
  · rfl

end CardGeThirteenExact13RepresentativeCertificate
end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13RepresentativeCertificate.oneForm_data_check
#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13RepresentativeCertificate.twoForm_data_check
#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13RepresentativeCertificate.oneForm_keyEntryCovers
#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13RepresentativeCertificate.twoForm_keyEntryCovers
