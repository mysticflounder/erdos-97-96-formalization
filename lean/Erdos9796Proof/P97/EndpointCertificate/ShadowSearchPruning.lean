/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.EndpointCertificate.ShadowSearch

/-!
# Enumeration-free pruning of depth-3 endpoint search shards

The depth-3 endpoint coverage argument fixes the `.v`, `.w`, and `.u` masks and
then asks whether every valid shadow in the remaining subtree is row-bank
covered.  Enumerating that subtree is the expensive step, and most of the
`4 * 4 * 33` fixed triples per escapee do not need it:

* **Pair-count dead** — if the depth-3 pair counts already exceed the
  `pairCountsOK` bound, the search returns no leaves at all, because
  `endpointSearchAux` re-tests `pairCountsOK` before descending and the counts
  only ever increase.  `endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false`.

* **Separation dead** — if the fixed `.u` mask is not cross-separated from the
  fixed `.w` (or `.v`) mask, then *no* leaf of the subtree is a valid endpoint
  shadow, because the depth-3 rest plan never reassigns `.v`, `.w`, or `.u`, so
  every leaf carries those same three masks into `searchSeparationOK`.  The
  `!endpointShadowOK ...` disjunct of the certificate is then true at every
  leaf.  `endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false` and
  `..._of_crossSep_uv_false`.

Both hypotheses are decidable tests on the three fixed masks alone, so the
generated dispatch discharges the dead triples by `decide` instead of importing
a search certificate for them.
-/

namespace Problem97

namespace EndpointCertificate

namespace ShadowBank

namespace Search

/-! ### Pair counts only increase -/

private theorem pairCountsOK_of_incrementPairCountsAux
    {center : Label} {mask : Nat} :
    ∀ (counts : List Nat) (pairs : List (Label × Label)),
      SurplusCOMPGBank.pairCountsOK
          (SurplusCOMPGBank.incrementPairCountsAux center mask counts pairs) =
        true →
      SurplusCOMPGBank.pairCountsOK counts = true
  | [], _, _ => by simp [SurplusCOMPGBank.pairCountsOK]
  | _ :: _, [], h => by
      simpa [SurplusCOMPGBank.incrementPairCountsAux] using h
  | count :: restCounts, _ :: restPairs, h => by
      simp only [SurplusCOMPGBank.incrementPairCountsAux,
        SurplusCOMPGBank.pairCountsOK, List.all_cons, Bool.and_eq_true,
        decide_eq_true_eq] at h ⊢
      refine ⟨by omega, ?_⟩
      have := pairCountsOK_of_incrementPairCountsAux restCounts restPairs
        (by simpa [SurplusCOMPGBank.pairCountsOK] using h.2)
      simpa [SurplusCOMPGBank.pairCountsOK] using this

/-- Assigning one more center can only break the pair-count bound, never fix it. -/
private theorem pairCountsOK_incrementPairCounts_eq_false
    {center : Label} {mask : Nat} {counts : List Nat}
    (h : SurplusCOMPGBank.pairCountsOK counts = false) :
    SurplusCOMPGBank.pairCountsOK
      (SurplusCOMPGBank.incrementPairCounts center mask counts) = false := by
  cases hb : SurplusCOMPGBank.pairCountsOK
      (SurplusCOMPGBank.incrementPairCounts center mask counts) with
  | false => rfl
  | true =>
      rw [pairCountsOK_of_incrementPairCountsAux (center := center) (mask := mask)
        counts SurplusCOMPGBank.labelPairs hb] at h
      exact Bool.noConfusion h

/-! ### A state that already violates the pair-count bound has no leaves -/

theorem endpointSearchAux_eq_nil_of_pairCountsOK_false {escapee : Label} :
    ∀ (plan : List (Label × List Nat)) (assigned : List Label)
      (masks counts : List Nat),
      SurplusCOMPGBank.pairCountsOK counts = false →
      endpointSearchAux escapee assigned masks counts plan = []
  | [], _, _, _, h => by
      unfold endpointSearchAux
      simp [h]
  | (_, _) :: _, _, _, _, h => by
      unfold endpointSearchAux
      simp [pairCountsOK_incrementPairCounts_eq_false h]

/-! ### The depth-3 rest plan never reassigns `.v`, `.w`, or `.u` -/

private theorem getD_setNth_of_ne :
    ∀ (i j value : Nat) (l : List Nat), i ≠ j →
      (SurplusCOMPGBank.setNth i value l).getD j 0 = l.getD j 0
  | _, _, _, [], _ => by simp [SurplusCOMPGBank.setNth]
  | 0, 0, _, _ :: _, h => absurd rfl h
  | 0, _ + 1, _, _ :: _, _ => by simp [SurplusCOMPGBank.setNth]
  | _ + 1, 0, _, _ :: _, _ => by simp [SurplusCOMPGBank.setNth]
  | i + 1, j + 1, value, _ :: l, h => by
      simpa [SurplusCOMPGBank.setNth] using
        getD_setNth_of_ne i j value l (by omega)

private theorem centerMaskOf_setCenterMask_of_ne
    {masks : List Nat} {center other : Label} {mask : Nat}
    (h : center ≠ other) :
    SurplusCOMPGBank.centerMaskOf
        (SurplusCOMPGBank.setCenterMask masks center mask) other =
      SurplusCOMPGBank.centerMaskOf masks other := by
  refine getD_setNth_of_ne _ _ _ _ ?_
  cases center <;> cases other <;>
    simp_all [SurplusCOMPGBank.Label.index]

/-- A center the plan never assigns keeps its mask all the way to the leaves. -/
private theorem centerMaskOf_of_mem_endpointSearchAux
    {escapee other : Label} :
    ∀ (plan : List (Label × List Nat)) (assigned : List Label)
      (masks counts target : List Nat),
      (∀ entry ∈ plan, entry.fst ≠ other) →
      target ∈ endpointSearchAux escapee assigned masks counts plan →
      SurplusCOMPGBank.centerMaskOf target other =
        SurplusCOMPGBank.centerMaskOf masks other
  | [], _, masks, _, target, _, hmem => by
      unfold endpointSearchAux at hmem
      split at hmem
      · have : target = masks := by simpa using hmem
        rw [this]
      · simp at hmem
  | (center, candidates) :: rest, assigned, masks, counts, target, hplan, hmem => by
      unfold endpointSearchAux at hmem
      rcases List.mem_flatMap.mp hmem with ⟨mask, _, hbranch⟩
      dsimp only at hbranch
      split at hbranch
      · rw [centerMaskOf_of_mem_endpointSearchAux rest (center :: assigned)
          (SurplusCOMPGBank.setCenterMask masks center mask) _ target
          (fun entry hentry => hplan entry (List.mem_cons_of_mem _ hentry))
          hbranch]
        exact centerMaskOf_setCenterMask_of_ne
          (hplan (center, candidates) List.mem_cons_self)
      · simp at hbranch

private theorem endpointDepth3RestPlan_fst_ne_v {escapee : Label} :
    ∀ entry ∈ endpointDepth3RestPlan escapee, entry.fst ≠ (.v : Label) := by
  intro entry hentry
  simp only [endpointDepth3RestPlan, List.mem_cons, List.not_mem_nil,
    or_false] at hentry
  rcases hentry with rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> simp

private theorem endpointDepth3RestPlan_fst_ne_w {escapee : Label} :
    ∀ entry ∈ endpointDepth3RestPlan escapee, entry.fst ≠ (.w : Label) := by
  intro entry hentry
  simp only [endpointDepth3RestPlan, List.mem_cons, List.not_mem_nil,
    or_false] at hentry
  rcases hentry with rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> simp

private theorem endpointDepth3RestPlan_fst_ne_u {escapee : Label} :
    ∀ entry ∈ endpointDepth3RestPlan escapee, entry.fst ≠ (.u : Label) := by
  intro entry hentry
  simp only [endpointDepth3RestPlan, List.mem_cons, List.not_mem_nil,
    or_false] at hentry
  rcases hentry with rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> simp

/-- Every leaf of a fixed depth-3 subtree carries the three fixed masks. -/
private theorem centerMaskOf_of_mem_endpointDepth3SubtreeResult
    {escapee : Label} {vmask wmask umask : Nat} {masks : List Nat}
    (hmem : masks ∈ endpointDepth3SubtreeResult escapee vmask wmask umask) :
    SurplusCOMPGBank.centerMaskOf masks .v = vmask ∧
      SurplusCOMPGBank.centerMaskOf masks .w = wmask ∧
      SurplusCOMPGBank.centerMaskOf masks .u = umask := by
  unfold endpointDepth3SubtreeResult at hmem
  refine ⟨?_, ?_, ?_⟩
  · rw [centerMaskOf_of_mem_endpointSearchAux _ _ _ _ _
      endpointDepth3RestPlan_fst_ne_v hmem]
    rfl
  · rw [centerMaskOf_of_mem_endpointSearchAux _ _ _ _ _
      endpointDepth3RestPlan_fst_ne_w hmem]
    rfl
  · rw [centerMaskOf_of_mem_endpointSearchAux _ _ _ _ _
      endpointDepth3RestPlan_fst_ne_u hmem]
    rfl

/-! ### The two pruning certificates -/

/-- **L1.**  A depth-3 triple whose pair counts already exceed the bound has an
empty subtree, so its coverage certificate is vacuous. -/
theorem endpointDepth3SubtreeValidAllAccepted_of_pairCounts_false
    {escapee : Label} {vmask wmask umask : Nat}
    (h : SurplusCOMPGBank.pairCountsOK
      (endpointDepth3StateCounts vmask wmask umask) = false) :
    endpointDepth3SubtreeValidAllAccepted escapee vmask wmask umask = true := by
  have hnil : endpointDepth3SubtreeResult escapee vmask wmask umask = [] :=
    endpointSearchAux_eq_nil_of_pairCountsOK_false _ _ _ _ h
  simp [endpointDepth3SubtreeValidAllAccepted, hnil]

/-- Shared core of **L2**: a cross-separation failure between the fixed `.u`
mask and another fixed mask makes every leaf shadow invalid. -/
private theorem endpointDepth3SubtreeValidAllAccepted_of_crossSep_core
    {escapee : Label} {vmask wmask umask : Nat} {other : Label} {othermask : Nat}
    (hpair : ((.u : Label), other) ∈ SurplusCOMPGBank.orderedLabelPairs)
    (hother : ∀ masks ∈ endpointDepth3SubtreeResult escapee vmask wmask umask,
      SurplusCOMPGBank.centerMaskOf masks other = othermask)
    (h : SurplusCOMPGBank.crossSeparationOKForMasks .u umask other othermask =
      false) :
    endpointDepth3SubtreeValidAllAccepted escapee vmask wmask umask = true := by
  unfold endpointDepth3SubtreeValidAllAccepted
  rw [List.all_eq_true]
  intro masks hmem
  by_cases hvalid : endpointShadowOK escapee { masks := masks } = true
  · exfalso
    have hsep := searchSeparationOK_of_endpointShadowOK hvalid
    have hcross := (List.all_eq_true.mp hsep) ((.u : Label), other) hpair
    rw [show ({ masks := masks } : Shadow).centerMask (.u : Label) = umask from
        (centerMaskOf_of_mem_endpointDepth3SubtreeResult hmem).2.2,
      show ({ masks := masks } : Shadow).centerMask other = othermask from
        hother masks hmem, h] at hcross
    exact Bool.noConfusion hcross
  · rw [Bool.not_eq_true] at hvalid
    simp [hvalid]

/-- **L2**, `.u` against `.w`.  If the fixed `.u` and `.w` masks are not
cross-separated then no leaf of the subtree is a valid endpoint shadow. -/
theorem endpointDepth3SubtreeValidAllAccepted_of_crossSep_uw_false
    {escapee : Label} {vmask wmask umask : Nat}
    (h : SurplusCOMPGBank.crossSeparationOKForMasks .u umask .w wmask = false) :
    endpointDepth3SubtreeValidAllAccepted escapee vmask wmask umask = true :=
  endpointDepth3SubtreeValidAllAccepted_of_crossSep_core
    (by unfold SurplusCOMPGBank.orderedLabelPairs
        exact List.mem_cons_of_mem _ List.mem_cons_self)
    (fun _ hmem => (centerMaskOf_of_mem_endpointDepth3SubtreeResult hmem).2.1) h

/-- **L2**, `.u` against `.v`. -/
theorem endpointDepth3SubtreeValidAllAccepted_of_crossSep_uv_false
    {escapee : Label} {vmask wmask umask : Nat}
    (h : SurplusCOMPGBank.crossSeparationOKForMasks .u umask .v vmask = false) :
    endpointDepth3SubtreeValidAllAccepted escapee vmask wmask umask = true :=
  endpointDepth3SubtreeValidAllAccepted_of_crossSep_core
    (by unfold SurplusCOMPGBank.orderedLabelPairs; exact List.mem_cons_self)
    (fun _ hmem => (centerMaskOf_of_mem_endpointDepth3SubtreeResult hmem).1) h

end Search

end ShadowBank

end EndpointCertificate

end Problem97
