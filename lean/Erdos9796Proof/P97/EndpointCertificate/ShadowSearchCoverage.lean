/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearchShards.All

/-!
# Endpoint finite shadow search coverage

This module consumes the generated depth-3 search shards and proves that every
valid endpoint shadow accepted by the relaxed endpoint DFS is present in the
117-row endpoint shadow bank.
-/

namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

namespace Search

private theorem list_all_eq_true_of_mem
    {α : Type} {p : α → Bool} {a : α} :
    {items : List α} → items.all p = true → a ∈ items → p a = true
  | [], _h, ha => by cases ha
  | _ :: rest, h, ha => by
      simp only [List.all_cons, Bool.and_eq_true] at h
      cases ha with
      | head => simpa using h.1
      | tail _ haTail => exact list_all_eq_true_of_mem h.2 haTail

private theorem mem_endpointSearchAux_cons_cases
    {target masks pairCounts : List Nat} {escapee center : Label}
    {assigned : List Label} {candidates : List Nat}
    {rest : List (Label × List Nat)}
    (hmem : target ∈ endpointSearchAux escapee assigned masks pairCounts
      ((center, candidates) :: rest)) :
    ∃ mask, mask ∈ candidates ∧
      SurplusCOMPGBank.assignedSeparationOK center mask assigned masks = true ∧
      SurplusCOMPGBank.pairCountsOK
        (SurplusCOMPGBank.incrementPairCounts center mask pairCounts) = true ∧
      target ∈ endpointSearchAux escapee (center :: assigned)
        (SurplusCOMPGBank.setCenterMask masks center mask)
        (SurplusCOMPGBank.incrementPairCounts center mask pairCounts) rest := by
  unfold endpointSearchAux at hmem
  rcases List.mem_flatMap.mp hmem with ⟨mask, hmask, htail⟩
  by_cases hsep :
      SurplusCOMPGBank.assignedSeparationOK center mask assigned masks = true
  · by_cases hcounts : SurplusCOMPGBank.pairCountsOK
        (SurplusCOMPGBank.incrementPairCounts center mask pairCounts) = true
    · refine ⟨mask, hmask, hsep, hcounts, ?_⟩
      simpa [hsep, hcounts] using htail
    · simp [hsep, hcounts] at htail
  · simp [hsep] at htail

private theorem endpoint_row_entry_of_valid_search_path
    {escapee : Label} {shadow : Shadow}
    (hesc : escapee ∈ endpointSearchEscapees)
    (hvalid : endpointShadowOK escapee shadow = true)
    (hmem : shadow.masks ∈ endpointSearchAux escapee []
      SurplusCOMPGBank.emptyShadowMasks SurplusCOMPGBank.emptyPairCounts
      (endpointSearchPlan escapee)) :
    containsEntry (escapee, shadow.masks) endpointRowEntries = true := by
  have hmem0 : shadow.masks ∈ endpointSearchAux escapee []
      SurplusCOMPGBank.emptyShadowMasks SurplusCOMPGBank.emptyPairCounts
      ((.v, endpointCandidateMasks escapee .v) ::
        (.w, endpointCandidateMasks escapee .w) ::
        (.u, endpointCandidateMasks escapee .u) ::
        endpointDepth3RestPlan escapee) := by
    simpa [endpointSearchPlan, endpointSearchOrder,
      SurplusCOMPGBank.fragmentSearchOrder, endpointDepth3RestPlan] using hmem
  rcases mem_endpointSearchAux_cons_cases hmem0 with
    ⟨vmask, hv, _hsepV, _hcountsV, hmem1⟩
  rcases mem_endpointSearchAux_cons_cases hmem1 with
    ⟨wmask, hw, _hsepW, _hcountsW, hmem2⟩
  rcases mem_endpointSearchAux_cons_cases hmem2 with
    ⟨umask, hu, _hsepU, _hcountsU, hmem3⟩
  have hsubtree :
      shadow.masks ∈ endpointDepth3SubtreeResult escapee vmask wmask umask := by
    simpa [endpointDepth3SubtreeResult, endpointDepth3StateMasks,
      endpointDepth2StateMasks, endpointDepth3StateCounts,
      endpointDepth2StateCounts] using hmem3
  have hcovered :=
    endpointDepth3SubtreeValidAllAccepted_of_mem_candidates hesc hv hw hu
  have hleaf := list_all_eq_true_of_mem hcovered hsubtree
  simpa [hvalid] using hleaf

/-- Every valid endpoint shadow is present in the 117-row endpoint shadow bank. -/
theorem endpointShadowInBank_of_endpointShadowOK
    {escapee : Label} {shadow : Shadow}
    (h : endpointShadowOK escapee shadow = true) :
    endpointShadowInBank escapee shadow = true := by
  have hpath := shadow_mem_endpointSearchAux_of_endpointShadowOK h
  have hesc := mem_endpointSearchEscapees_of_endpointShadowOK h
  have hcontains :=
    endpoint_row_entry_of_valid_search_path hesc h hpath
  simp [endpointShadowInBank, hasTenMasks_of_endpointShadowOK h, hcontains]

end Search

end ShadowBank

end EndpointCertificate

end Problem97
