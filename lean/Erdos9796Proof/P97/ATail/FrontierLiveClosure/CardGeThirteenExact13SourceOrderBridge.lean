/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13ProviderIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13SourceRoleIngress
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13CoarseCellIngress

/-!
# Source-order bridge for the exact-thirteen provider cell

This module is the smallest source-faithful boundary between the live
exact-thirteen packet and a finite replay candidate.  Provider identity,
raw-label supports, the source-role witness, the coarse cell, and the direct or
reflected order remain explicit.  The finite predicate is a diagnostic API: it
does not assert that any candidate is a valid certificate or that the cell is
unsatisfiable.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure
namespace CardGeThirteenExact13SourceOrderBridge

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open DRExactThirteenValuation
open ExactThirteenBranchIngress
open ProviderRowNogoodCertificate

attribute [local instance] Classical.propDecidable

/-- All source data needed to form a provider-indexed exact-thirteen order
candidate.  `globalRows` is existentially supplied by the source K4 theorem;
the remaining fields are the live dispatch, coarse-cell, and source-role
packets, with no fixed labels or orientation selected. -/
structure Input where
  D : CounterexampleData
  S : SurplusCapPacket D.A
  radius : ℝ
  H : CriticalShellSystem D.A
  F : CriticalPairFrontier D S radius H
  R : OriginalUniqueFourResidual F
  surface : ExactFourPostCardElevenRobustSurface R
  firstRow : SelectedFourClass D.A S.oppApex2
  secondRow : SelectedFourClass D.A S.oppApex2
  Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow
  P : ExactThirteenBranchIngress S
  X : CardGeThirteenExact13DispatchRawPacket
    R surface firstRow secondRow Q P
  O : CardGeThirteenRawOtherOuterSupport
    R surface firstRow secondRow Q.base P X.tightSupport
  coarse : ExactThirteenCoarseCellSignature
    R surface firstRow secondRow Q P X.tightSupport O
  sourceRole : CardGeThirteenExact13SourceRoleWitnesses
    R surface firstRow secondRow Q P X

/- The global rows are taken from the source existential at every admissible
center.  Keeping this as a constructor, rather than an arbitrary `Input`
field, prevents a replay caller from silently substituting non-source rows. -/
noncomputable def Input.globalRows (I : Input) : Exact13GlobalRows I.P :=
  Exact13GlobalRows.ofIngress I.P

/-- The source-built provider pattern attached to an input packet. -/
noncomputable def Input.providerPattern {I : Input} :
    ProviderRowPattern Exact13Provider (Fin 13) :=
  exact13RawProviderPattern_of_dispatch
    I.R I.surface I.firstRow I.secondRow I.Q I.P I.X I.O
    I.X.fivePositionalRows I.globalRows

/- The finite provider type has one constructor for each named row and one
global constructor for each admissible center. -/
deriving instance Fintype for Exact13GlobalCenter

/-- Every named provider and every admissible global-center provider. -/
def providerElems : Finset Exact13Provider :=
  { .c0, .c1, .k, .l, .t } ∪
    (Finset.univ.image (fun center : Exact13GlobalCenter =>
      Exact13Provider.g center))

instance instFintypeExact13Provider : Fintype Exact13Provider where
  elems := providerElems
  complete := by
    intro provider
    cases provider with
    | c0 => simp [providerElems]
    | c1 => simp [providerElems]
    | k => simp [providerElems]
    | l => simp [providerElems]
    | t => simp [providerElems]
    | g center => simp [providerElems]

/-- A finite candidate keeps the provider tag, both raw labels, and the one of
the two source orders under consideration. -/
structure Candidate where
  provider : Exact13Provider
  first : Fin 13
  second : Fin 13
  orientation : Bool
deriving DecidableEq, Fintype, Repr

/-- The raw-label order represented by a candidate's orientation bit. -/
def sourceOrder (I : Input) (orientation : Bool) : List (Fin 13) :=
  match orientation with
  | false => directOrder I.P.profile
  | true => mirrorOrder I.P.profile

/-- The orientation assertion is kept as a predicate rather than choosing one
orientation by proof elimination. -/
def sourceOrderValid (I : Input) (orientation : Bool) : Prop :=
  match orientation with
  | false => I.P.idx = directIndex I.P.profile
  | true => I.P.idx = mirrorIndex I.P.profile

/-- A candidate is source-entitled exactly when its two labels are distinct,
belong to the provider row built from `X/O/globalRows`, and its order bit is
one of the two orders certified by the live ingress. -/
def candidatePredicate (I : Input) (candidate : Candidate) : Prop :=
  sourceOrderValid I candidate.orientation ∧
    candidate.first ≠ candidate.second ∧
    candidate.first ∈ I.providerPattern.supportOf candidate.provider ∧
    candidate.second ∈ I.providerPattern.supportOf candidate.provider

/-- Boolean form of the source-entitled candidate predicate. -/
noncomputable def candidateCheck (I : Input) (candidate : Candidate) : Bool :=
  decide (candidatePredicate I candidate)

/-- The exhaustive finite candidate universe used by a replay consumer. -/
noncomputable def candidateUniverse (I : Input) : Finset Candidate :=
  Finset.univ.filter (fun candidate => candidateCheck I candidate)

/-- Membership in the replay universe is exactly the source-entitled
candidate predicate; no candidate is silently omitted by the finite filter. -/
theorem mem_candidateUniverse_iff (I : Input) (candidate : Candidate) :
    candidate ∈ candidateUniverse I ↔ candidatePredicate I candidate := by
  simp only [candidateUniverse, candidateCheck, Finset.mem_filter, Finset.mem_univ,
    true_and, decide_eq_true_eq]

/-- The finite universe is bounded by the explicit candidate type. -/
theorem candidateUniverse_card_le (I : Input) :
    (candidateUniverse I).card ≤ Fintype.card Candidate := by
  exact Finset.card_le_univ _

/-- Convert a candidate into the provider edge choice consumed by the kernel
provider checker. -/
def edgeChoice (candidate : Candidate) :
    ProviderRowChoice Exact13Provider (Fin 13) :=
  exact13ProviderEdgeChoice candidate.provider candidate.first candidate.second

/-- Every checked candidate gives a positive provider-row choice, with no
cross-provider or cross-radius equality inferred. -/
theorem edgeChoice_positive_of_check
    (I : Input) (candidate : Candidate)
    (hcheck : candidateCheck I candidate = true) :
    ProviderPositiveRowsMatch I.providerPattern [edgeChoice candidate] := by
  have hp : candidatePredicate I candidate := of_decide_eq_true hcheck
  exact providerPositiveRowsMatch_single I.providerPattern candidate.provider
    candidate.first candidate.second hp.2.2.1 hp.2.2.2

/-- The source-role witness is visible in the blocker-0 provider row. -/
theorem sourceRole_s0_mem_c0 (I : Input) :
    I.sourceRole.s0 ∈ I.providerPattern.supportOf .c0 := by
  simpa [Input.providerPattern, Exact13RawProviderPattern] using
    I.sourceRole.s0_mem_C0

/-- The source-role witness is visible in the blocker-1 provider row. -/
theorem sourceRole_s1_mem_c1 (I : Input) :
    I.sourceRole.s1 ∈ I.providerPattern.supportOf .c1 := by
  simpa [Input.providerPattern, Exact13RawProviderPattern] using
    I.sourceRole.s1_mem_C1

/-- The deleted source-role label is visible in the first-apex provider row. -/
theorem sourceRole_d_mem_t (I : Input) :
    I.sourceRole.d ∈ I.providerPattern.supportOf .t := by
  simpa [Input.providerPattern, Exact13RawProviderPattern] using
    I.sourceRole.d_mem_firstApex

/-- The complete provider pattern is realized by the source-faithful finite
label map. -/
theorem providerPattern_realizes (I : Input) :
    ProviderRealizes I.providerPattern I.P.pt := by
  exact exact13RawProviderPattern_realizes
    I.R I.surface I.firstRow I.secondRow I.Q I.P I.X I.O
    I.X.fivePositionalRows I.globalRows

/-- A source-entitled orientation transports its raw order to canonical
positions, which is the order interface expected by replay encodings. -/
theorem sourceOrder_map_idx_of_predicate
    (I : Input) (candidate : Candidate)
    (hp : candidatePredicate I candidate) :
    (sourceOrder I candidate.orientation).map I.P.idx = List.ofFn id := by
  cases h : candidate.orientation with
  | false =>
      have hidx : I.P.idx = directIndex I.P.profile := by
        simpa only [sourceOrderValid, h] using hp.1
      simpa only [sourceOrder, h] using directOrder_map_idx_of_eq hidx
  | true =>
      have hidx : I.P.idx = mirrorIndex I.P.profile := by
        simpa only [sourceOrderValid, h] using hp.1
      simpa only [sourceOrder, h] using mirrorOrder_map_idx_of_eq hidx


/-- The four-point other row has a pair in one of the two blocker rows. -/
private theorem exists_pair_in_one_blocker
    (C0 C1 K L : Finset (Fin 13)) (z : Fin 13)
    (hcover : (C0 ∪ C1) ∪ K = Finset.univ.erase z)
    (hLcard : L.card = 4) (hzL : z ∈ L) (hLK : Disjoint L K) :
    (∃ a ∈ C0 ∩ L, ∃ b ∈ C0 ∩ L, a ≠ b) ∨
      (∃ a ∈ C1 ∩ L, ∃ b ∈ C1 ∩ L, a ≠ b) := by
  classical
  have hsub : L.erase z ⊆ (C0 ∩ L) ∪ (C1 ∩ L) := by
    intro x hx
    rcases Finset.mem_erase.mp hx with ⟨hxz, hxL⟩
    have hxCover : x ∈ (C0 ∪ C1) ∪ K := by
      rw [hcover]
      exact Finset.mem_erase.mpr ⟨hxz, Finset.mem_univ x⟩
    rcases Finset.mem_union.mp hxCover with hx01 | hxK
    · rcases Finset.mem_union.mp hx01 with hx0 | hx1
      · exact Finset.mem_union.mpr (Or.inl (Finset.mem_inter.mpr ⟨hx0, hxL⟩))
      · exact Finset.mem_union.mpr (Or.inr (Finset.mem_inter.mpr ⟨hx1, hxL⟩))
    · exact False.elim (Finset.disjoint_left.mp hLK hxL hxK)
  have hcard : (L.erase z).card + 1 = L.card := Finset.card_erase_add_one hzL
  have hsum : (L.erase z).card ≤ (C0 ∩ L).card + (C1 ∩ L).card :=
    (Finset.card_le_card hsub).trans (Finset.card_union_le _ _)
  have hlarge : 1 < (C0 ∩ L).card ∨ 1 < (C1 ∩ L).card := by omega
  exact hlarge.imp Finset.one_lt_card.mp Finset.one_lt_card.mp

/-- An actual pair shared by L and a blocker supplies two source candidates;
provider identity is retained separately for each occurrence of the pair. -/
theorem exists_shared_L_blocker_candidates
    (I : Input) (o : Bool) (ho : sourceOrderValid I o) :
    ∃ (j : Exact13Provider) (a b : Fin 13),
      (j = .c0 ∨ j = .c1) ∧
      candidatePredicate I ⟨.l, a, b, o⟩ ∧
      candidatePredicate I ⟨j, a, b, o⟩ ∧
      ProviderPositiveRowsMatch I.providerPattern
        [edgeChoice ⟨.l, a, b, o⟩, edgeChoice ⟨j, a, b, o⟩] := by
  have hpair := exists_pair_in_one_blocker
    I.X.tightSupport.C0raw I.X.tightSupport.C1raw I.X.tightSupport.Kraw
    I.O.Lraw I.X.tightSupport.zraw I.X.tightSupport.raw_cover
    I.O.Lraw_card I.O.Lraw_mem_zraw I.O.Lraw_disjoint_Kraw
  have hraw : ∃ (j : Exact13Provider) (a b : Fin 13),
      (j = .c0 ∨ j = .c1) ∧ a ≠ b ∧
      a ∈ I.O.Lraw ∧ b ∈ I.O.Lraw ∧
      a ∈ I.providerPattern.supportOf j ∧ b ∈ I.providerPattern.supportOf j := by
    rcases hpair with ⟨a, ha, b, hb, hab⟩ | ⟨a, ha, b, hb, hab⟩
    · exact ⟨.c0, a, b, Or.inl rfl, hab, (Finset.mem_inter.mp ha).2,
        (Finset.mem_inter.mp hb).2, (Finset.mem_inter.mp ha).1,
        (Finset.mem_inter.mp hb).1⟩
    · exact ⟨.c1, a, b, Or.inr rfl, hab, (Finset.mem_inter.mp ha).2,
        (Finset.mem_inter.mp hb).2, (Finset.mem_inter.mp ha).1,
        (Finset.mem_inter.mp hb).1⟩
  rcases hraw with ⟨j, a, b, hj, hab, haL, hbL, haJ, hbJ⟩
  have hLa : a ∈ I.providerPattern.supportOf .l := haL
  have hLb : b ∈ I.providerPattern.supportOf .l := hbL
  refine ⟨j, a, b, hj, ⟨ho, hab, hLa, hLb⟩, ⟨ho, hab, haJ, hbJ⟩, ?_⟩
  simpa only [edgeChoice] using
    providerPositiveRowsMatch_two I.providerPattern .l j a b a b hLa hLb haJ hbJ

/-- Reindex the actual source provider rows into its positional boundary chart. -/
noncomputable def Input.positionalPattern (I : Input) :
    ProviderRowPattern Exact13Provider (Fin 13) :=
  Exact13RawProviderPattern.toPositional I.providerPattern I.P

/-- Transport a candidate's endpoints through the retained source index map. -/
def positionalEdgeChoice (I : Input) (candidate : Candidate) :
    ProviderRowChoice Exact13Provider (Fin 13) :=
  exact13ProviderEdgeChoice candidate.provider
    (I.P.idx candidate.first) (I.P.idx candidate.second)

/-- A source candidate remains positive after positional transport. -/
theorem positionalEdgeChoice_positive_of_predicate
    (I : Input) (candidate : Candidate) (hp : candidatePredicate I candidate) :
    ProviderPositiveRowsMatch I.positionalPattern [positionalEdgeChoice I candidate] := by
  apply providerPositiveRowsMatch_single
  · exact Finset.mem_image.mpr ⟨candidate.first, hp.2.2.1, rfl⟩
  · exact Finset.mem_image.mpr ⟨candidate.second, hp.2.2.2, rfl⟩

/-- Every list of source candidates, including the shared L/blocker pair,
transports to positive choices in the same source provider pattern. -/
theorem positionalEdgeChoices_positive_of_predicates
    (I : Input) (candidates : List Candidate)
    (hp : ∀ c ∈ candidates, candidatePredicate I c) :
    ProviderPositiveRowsMatch I.positionalPattern
      (candidates.map (positionalEdgeChoice I)) := by
  intro choice hchoice
  rcases List.mem_map.mp hchoice with ⟨c, hc, rfl⟩
  exact positionalEdgeChoice_positive_of_predicate I c (hp c hc)
    (positionalEdgeChoice I c) (by simp)

/-- The positional provider rows realize the actual source boundary. -/
theorem positionalPattern_realizes (I : Input) :
    ProviderRealizes I.positionalPattern I.P.φ :=
  Exact13RawProviderPattern.toPositional_realizes I.providerPattern I.P
    (providerPattern_realizes I)

/-- A checked weighted cancellation on source-entitled, positionally transported
candidates contradicts the actual convex boundary. The data and successful check
are explicit premises; this theorem does not supply finite-cell coverage. -/
theorem false_of_checked_positional_candidates
    (I : Input) (candidates : List Candidate)
    (hp : ∀ c ∈ candidates, candidatePredicate I c)
    (data : ProviderWeightedKalmansonCancellationData Exact13Provider 13)
    (hcheck : data.check (candidates.map (positionalEdgeChoice I))
      I.positionalPattern = true) : False := by
  exact false_of_providerWeightedKalmansonCancellationData_of_check
    I.P.boundaryEnumeration.convexIndep rfl I.P.boundaryEnumeration.ccw
    (positionalPattern_realizes I) (candidates.map (positionalEdgeChoice I))
    (positionalEdgeChoices_positive_of_predicates I candidates hp) data hcheck

end CardGeThirteenExact13SourceOrderBridge
end ATailFrontierLiveClosure
end Problem97

#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge.mem_candidateUniverse_iff
#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge.providerPattern_realizes

#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge.exists_shared_L_blocker_candidates

#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge.positionalEdgeChoice_positive_of_predicate

#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge.positionalEdgeChoices_positive_of_predicates

#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge.positionalPattern_realizes

#print axioms
  Problem97.ATailFrontierLiveClosure.CardGeThirteenExact13SourceOrderBridge.false_of_checked_positional_candidates
