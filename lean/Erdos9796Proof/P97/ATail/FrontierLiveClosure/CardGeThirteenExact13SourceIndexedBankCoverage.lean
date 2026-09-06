/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceIndexedFiniteKey
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13WeightedProviderBankBridge

/-!
# Source-indexed exact-thirteen bank coverage

This module is the small adapter between a finite source-indexed `Key` and a
checked weighted provider-bank entry.  A key records raw labels and the
orientation; the adapter transports those labels to positional choices using
the key's certified order.  No concrete bank or exhaustive coverage claim is
introduced here.
-/

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenExact13SourceIndexedBankCoverage

open CardGeThirteenExact13SourceOrderBridge
open CardGeThirteenExact13SourceIndexedFiniteKey
open CardGeThirteenExact13WeightedProviderBankBridge
open DRExactThirteenValuation
open ProviderRowNogoodCertificate

/-- A raw source candidate is entitled by a source-indexed key. -/
def KeyCandidateMatches (k : Key) (candidate : Candidate) : Prop :=
  candidate.orientation = k.orientation ∧
    candidate.first ≠ candidate.second ∧
    candidate.first ∈ k.rawSupport candidate.provider ∧
    candidate.second ∈ k.rawSupport candidate.provider

/-- Transport a key-matched raw candidate to the positional boundary chart. -/
def keyPositionalEdgeChoice (k : Key) (candidate : Candidate) :
    ProviderRowChoice Exact13Provider (Fin 13) :=
  exact13ProviderEdgeChoice candidate.provider
    (orderIndex k.orientation candidate.first)
    (orderIndex k.orientation candidate.second)

/-- A checked entry applies to a key when its center map and its complete list
of positional row choices are supplied by key-entitled raw candidates. -/
def KeyEntryCovers (k : Key) (e : Entry) : Prop :=
  e.centers = k.centerOf ∧
    ∃ candidates : List Candidate,
      (∀ candidate ∈ candidates, KeyCandidateMatches k candidate) ∧
        candidates.map (keyPositionalEdgeChoice k) = e.choices

/-- A bank covers the finite necessary key domain.  This is only a coverage
predicate; it does not assert that the bank is inhabited or generated. -/
def ValidKeyCover (bank : List Entry) : Prop :=
  ∀ k ∈ validKeys, ∃ e ∈ bank, KeyEntryCovers k e

private theorem sourceIndex_eq_orderIndex
    (I : Input) (orientation : Bool) (ho : sourceOrderValid I orientation) :
    I.P.idx = orderIndex orientation := by
  cases orientation <;>
    simpa [sourceOrderValid, orderIndex, I.coarse.profile_eq_secondOpposite] using ho

private theorem rawSupport_eq_providerSupport
    (I : Input) (k : Key)
    (hsupport : k.supportOf = I.positionalPattern.supportOf)
    (ho : sourceOrderValid I k.orientation) (provider : Exact13Provider) :
    k.rawSupport provider = I.providerPattern.supportOf provider := by
  ext x
  simp only [Key.rawSupport, Finset.mem_filter]
  rw [hsupport]
  change (x ∈ Finset.univ ∧ orderIndex k.orientation x ∈
    (I.providerPattern.supportOf provider).image I.P.idx) ↔
      x ∈ I.providerPattern.supportOf provider
  rw [← sourceIndex_eq_orderIndex I k.orientation ho]
  simp only [Finset.mem_univ, true_and]
  constructor
  · intro hx
    obtain ⟨y, hy, heq⟩ := Finset.mem_image.mp hx
    exact I.P.boundaryEnumeration.idx_injective heq ▸ hy
  · intro hx
    exact Finset.mem_image.mpr ⟨x, hx, rfl⟩

private theorem keyCandidateMatches_candidatePredicate
    (I : Input) (k : Key) (candidate : Candidate)
    (hsupport : k.supportOf = I.positionalPattern.supportOf)
    (ho : sourceOrderValid I k.orientation)
    (hmatch : KeyCandidateMatches k candidate) :
    candidatePredicate I candidate := by
  rcases hmatch with ⟨horientation, hne, hfirst, hsecond⟩
  refine ⟨?_, hne, ?_, ?_⟩
  · simpa [horientation] using ho
  · rw [rawSupport_eq_providerSupport I k hsupport ho candidate.provider] at hfirst
    exact hfirst
  · rw [rawSupport_eq_providerSupport I k hsupport ho candidate.provider] at hsecond
    exact hsecond

private theorem positionalEdgeChoice_eq_keyPositionalEdgeChoice
    (I : Input) (k : Key) (candidate : Candidate)
    (ho : sourceOrderValid I k.orientation) :
    positionalEdgeChoice I candidate = keyPositionalEdgeChoice k candidate := by
  unfold positionalEdgeChoice keyPositionalEdgeChoice
  rw [sourceIndex_eq_orderIndex I k.orientation ho]

private theorem positionalEdgeChoices_eq_keyPositionalEdgeChoices
    (I : Input) (k : Key) (candidates : List Candidate)
    (ho : sourceOrderValid I k.orientation) :
    candidates.map (positionalEdgeChoice I) =
      candidates.map (keyPositionalEdgeChoice k) := by
  induction candidates with
  | nil => rfl
  | cons candidate candidates ih =>
      simp only [List.map]
      rw [positionalEdgeChoice_eq_keyPositionalEdgeChoice I k candidate ho, ih]

/-- A key-matched checked entry covers the source input represented by the key.
The only source-side hypotheses are exact center/support equality and the
orientation certificate needed to identify raw and positional labels. -/
theorem entry_covers_of_key_match
    (I : Input) (k : Key) (e : Entry)
    (hcenter : k.centerOf = I.positionalPattern.centerOf)
    (hsupport : k.supportOf = I.positionalPattern.supportOf)
    (ho : sourceOrderValid I k.orientation)
    (hmatch : KeyEntryCovers k e) :
    e.Covers I := by
  rcases hmatch with ⟨hentryCenter, candidates, hcandidates, hchoices⟩
  refine ⟨hentryCenter.trans hcenter, candidates, ?_, ?_⟩
  · intro candidate hmem
    exact keyCandidateMatches_candidatePredicate I k candidate hsupport ho
      (hcandidates candidate hmem)
  · exact (positionalEdgeChoices_eq_keyPositionalEdgeChoices I k candidates ho).trans
      hchoices

/-- A bank covering every valid source-indexed key covers every source input. -/
theorem bankCovers_of_validKeyCover
    (bank : List Entry) (hcover : ValidKeyCover bank) :
    BankCovers bank := by
  intro I
  obtain ⟨k, hk, hcenter, hsupport, ho⟩ := exists_mem_validKeys I
  obtain ⟨e, hempty, hmatch⟩ := hcover k hk
  exact ⟨e, hempty, entry_covers_of_key_match I k e hcenter hsupport ho hmatch⟩

end CardGeThirteenExact13SourceIndexedBankCoverage
end ATailFrontierLiveClosure
end Problem97

#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceIndexedBankCoverage.entry_covers_of_key_match
#print axioms Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceIndexedBankCoverage.bankCovers_of_validKeyCover
