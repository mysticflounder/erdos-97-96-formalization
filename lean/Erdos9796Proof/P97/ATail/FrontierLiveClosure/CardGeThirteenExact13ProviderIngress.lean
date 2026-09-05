/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13DispatchRawBridge
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.ProviderRowNogoodCertificate
import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13OrderTransport

/-!
# Source-faithful provider ingress for the exact-thirteen branch

This module is the adapter between the provenance-preserving exact-thirteen
raw packet and the provider-indexed row-nogood checker.  It deliberately keeps
raw labels separate from positional labels.  In particular, the two retained
second-apex rows are not identified merely because their geometric center is
the same, and the global rows are empty at the two source-blocker centers.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailExactFourRobustCapExpansion
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open DRExactThirteenValuation
open ExactThirteenBranchIngress
open ProviderRowNogoodCertificate

attribute [local instance] Classical.propDecidable

/-- The non-apex raw labels, represented without hard-coded label pins. -/
def Exact13GlobalCenter : Type := {c : Fin 13 // 2 ≤ c.val}

instance instDecidableEqExact13GlobalCenter : DecidableEq Exact13GlobalCenter :=
  fun a b =>
    if h : a.val = b.val then
      isTrue (Subtype.ext h)
    else
      isFalse (fun hab => h (congrArg Subtype.val hab))

deriving instance Repr for Exact13GlobalCenter

/-- The five named rows and the eleven possible global-center providers. -/
inductive Exact13Provider where
  | c0
  | c1
  | k
  | l
  | t
  | g (center : Exact13GlobalCenter)
deriving DecidableEq, Repr

/-- One source-selected four-class is retained at every possible global center.
The dependent sigma keeps the selected class and its transported row together,
so a consumer cannot replace it by an arbitrary four-element support. -/
structure Exact13GlobalRows
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBranchIngress S) : Type where
  row : ∀ c : Exact13GlobalCenter,
    Sigma fun K : SelectedFourClass D.A (P.pt c.1) =>
      PositionalFourSupportRow P c.1 K.support K.radius

/-- Choose the source row supplied by the global K4 theorem at each global
center.  This is noncomputable only because the source theorem is existential;
it introduces no fixed center or support assignment. -/
noncomputable def Exact13GlobalRows.ofIngress
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBranchIngress S) : Exact13GlobalRows P := by
  classical
  exact
    { row := fun c =>
        let hK := exists_positionalFourSupportRow_at_raw_label D P c.1
        ⟨Classical.choose hK,
          Classical.choice (Classical.choose_spec hK)⟩ }

/-- The global support is suppressed precisely when its center is one of the
two actual source blockers. -/
def guardedGlobalSupport (b0 b1 : Fin 13)
    (Graw : Exact13GlobalCenter → Finset (Fin 13))
    (c : Exact13GlobalCenter) : Finset (Fin 13) :=
  if c.1 = b0 ∨ c.1 = b1 then ∅ else Graw c

/-- The blocker guard has the source-CSP empty-row behavior. -/
theorem guardedGlobalSupport_eq_empty
    (b0 b1 c : Fin 13) (Graw : Exact13GlobalCenter → Finset (Fin 13))
    (hc : c = b0 ∨ c = b1)
    (hglobal : 2 ≤ c.val) :
    guardedGlobalSupport b0 b1 Graw ⟨c, hglobal⟩ = ∅ := by
  simp [guardedGlobalSupport, hc]

/-- A raw provider pattern retains each source row and keeps the role of a
provider distinct from its geometric center. -/
def Exact13RawProviderPattern
    (b0 b1 : Fin 13) (C0 C1 K L Trow : Finset (Fin 13))
    (Graw : Exact13GlobalCenter → Finset (Fin 13)) :
    ProviderRowPattern Exact13Provider (Fin 13) where
  centerOf := fun provider =>
    match provider with
    | .c0 => b0
    | .c1 => b1
    | .k => secondApex
    | .l => secondApex
    | .t => firstApex
    | .g c => c.1
  supportOf := fun provider =>
    match provider with
    | .c0 => C0
    | .c1 => C1
    | .k => K
    | .l => L
    | .t => Trow
    | .g c => guardedGlobalSupport b0 b1 Graw c

/-- Instantiate the raw pattern directly from a dispatch packet. -/
def exact13RawProviderPattern_of_dispatch
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (X : CardGeThirteenExact13DispatchRawPacket
      R surface firstRow secondRow Q P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P X.tightSupport)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q.base P)
    (G : Exact13GlobalRows P) :
    ProviderRowPattern Exact13Provider (Fin 13) :=
  Exact13RawProviderPattern V.blocker₁ V.blocker₂
    X.tightSupport.C0raw X.tightSupport.C1raw X.tightSupport.Kraw O.Lraw
    V.firstApexRow.rawSupport
    (fun c => (G.row c).2.rawSupport)

/-- Transport the positional equal-distance field back to raw labels.  This is
the first adapter needed by every source row in the provider realization. -/
theorem PositionalFourSupportRow.raw_equalDistances
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBranchIngress S)
    {rawCenter : Fin 13} {physicalSupport : Finset ℝ²} {rowRadius : ℝ}
    (V : PositionalFourSupportRow P rawCenter physicalSupport rowRadius)
    {i j : Fin 13} (hi : i ∈ V.rawSupport) (hj : j ∈ V.rawSupport) :
    dist (P.pt rawCenter) (P.pt i) = dist (P.pt rawCenter) (P.pt j) := by
  have hi' : P.idx i ∈ V.support := by
    rw [V.support_eq]
    exact Finset.mem_image.mpr ⟨i, hi, rfl⟩
  have hj' : P.idx j ∈ V.support := by
    rw [V.support_eq]
    exact Finset.mem_image.mpr ⟨j, hj, rfl⟩
  have hiRadius := V.support_eq_radius (P.idx i) hi'
  have hjRadius := V.support_eq_radius (P.idx j) hj'
  rw [P.boundaryEnumeration.pt_eq rawCenter,
    P.boundaryEnumeration.pt_eq i, P.boundaryEnumeration.pt_eq j]
  exact hiRadius.trans hjRadius.symm

/-- The unguarded source global row never contains its own raw center. -/
theorem Exact13GlobalRows.raw_center_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBranchIngress S) (G : Exact13GlobalRows P)
    (c : Exact13GlobalCenter) :
    c.1 ∉ (G.row c).2.rawSupport := by
  intro hc
  have hpos : P.idx c.1 ∈ (G.row c).2.support := by
    rw [(G.row c).2.support_eq]
    exact Finset.mem_image.mpr ⟨c.1, hc, rfl⟩
  exact (G.row c).2.center_not_mem hpos

/-- Prove provider realization from raw equal-distance obligations.  The guard
case is intentionally discharged by contradiction when a checked row claims
membership in an empty global provider. -/
theorem exact13RawProviderPattern_realizes_of_equidist
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (P : ExactThirteenBranchIngress S)
    (b0 b1 : Fin 13) (C0 C1 K L Trow : Finset (Fin 13))
    (Graw : Exact13GlobalCenter → Finset (Fin 13))
    (hC0 : ∀ i ∈ C0, ∀ j ∈ C0,
      dist (P.pt b0) (P.pt i) = dist (P.pt b0) (P.pt j))
    (hC1 : ∀ i ∈ C1, ∀ j ∈ C1,
      dist (P.pt b1) (P.pt i) = dist (P.pt b1) (P.pt j))
    (hK : ∀ i ∈ K, ∀ j ∈ K,
      dist (P.pt secondApex) (P.pt i) =
        dist (P.pt secondApex) (P.pt j))
    (hL : ∀ i ∈ L, ∀ j ∈ L,
      dist (P.pt secondApex) (P.pt i) =
        dist (P.pt secondApex) (P.pt j))
    (hT : ∀ i ∈ Trow, ∀ j ∈ Trow,
      dist (P.pt firstApex) (P.pt i) =
        dist (P.pt firstApex) (P.pt j))
    (hG : ∀ (c : Exact13GlobalCenter) (i : Fin 13),
      i ∈ Graw c → ∀ (j : Fin 13),
        j ∈ Graw c →
          dist (P.pt c.1) (P.pt i) = dist (P.pt c.1) (P.pt j)) :
    ProviderRealizes
      (Exact13RawProviderPattern b0 b1 C0 C1 K L Trow Graw) P.pt := by
  refine { equidist := ?_, injective := P.labelMap.injective }
  intro provider first hfirst second hsecond
  cases provider with
  | c0 =>
      simpa [Exact13RawProviderPattern] using hC0 first hfirst second hsecond
  | c1 =>
      simpa [Exact13RawProviderPattern] using hC1 first hfirst second hsecond
  | k =>
      simpa [Exact13RawProviderPattern] using hK first hfirst second hsecond
  | l =>
      simpa [Exact13RawProviderPattern] using hL first hfirst second hsecond
  | t =>
      simpa [Exact13RawProviderPattern] using hT first hfirst second hsecond
  | g c =>
      by_cases hg : c.1 = b0 ∨ c.1 = b1
      · simp [Exact13RawProviderPattern, guardedGlobalSupport, hg] at hfirst
      · apply hG c first
        · simpa [Exact13RawProviderPattern, guardedGlobalSupport, hg] using hfirst
        · simpa [Exact13RawProviderPattern, guardedGlobalSupport, hg] using hsecond

/-- Realize the dispatch assignment.  The two alternatives in
Q.base.thirdRow_named are retained until the K/L obligations are discharged,
so no named row or raw support is pinned by this adapter. -/
theorem exact13RawProviderPattern_realizes
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    (surface : ExactFourPostCardElevenRobustSurface R)
    (firstRow secondRow : SelectedFourClass D.A S.oppApex2)
    (Q : CardGeThirteenUncoveredStrictInteriorPacket R firstRow secondRow)
    (P : ExactThirteenBranchIngress S)
    (X : CardGeThirteenExact13DispatchRawPacket
      R surface firstRow secondRow Q P)
    (O : CardGeThirteenRawOtherOuterSupport
      R surface firstRow secondRow Q.base P X.tightSupport)
    (V : ExactThirteenFivePositionalRows R firstRow secondRow Q.base P)
    (G : Exact13GlobalRows P) :
    ProviderRealizes
      (exact13RawProviderPattern_of_dispatch R surface firstRow secondRow Q P X O V G)
      P.pt := by
  let T := X.tightSupport
  have hC0eq : T.C0raw = V.sourceRow₁.rawSupport := by
    apply raw_eq_of_image_eq P
    rw [T.C0raw_image, V.sourceRow₁.rawSupport_image]
  have hC1eq : T.C1raw = V.sourceRow₂.rawSupport := by
    apply raw_eq_of_image_eq P
    rw [T.C1raw_image, V.sourceRow₂.rawSupport_image]
  have hC0 : ∀ i ∈ T.C0raw, ∀ j ∈ T.C0raw,
      dist (P.pt V.blocker₁) (P.pt i) =
        dist (P.pt V.blocker₁) (P.pt j) := by
    intro i hi j hj
    apply PositionalFourSupportRow.raw_equalDistances P V.sourceRow₁
    · simpa [hC0eq] using hi
    · simpa [hC0eq] using hj
  have hC1 : ∀ i ∈ T.C1raw, ∀ j ∈ T.C1raw,
      dist (P.pt V.blocker₂) (P.pt i) =
        dist (P.pt V.blocker₂) (P.pt j) := by
    intro i hi j hj
    apply PositionalFourSupportRow.raw_equalDistances P V.sourceRow₂
    · simpa [hC1eq] using hi
    · simpa [hC1eq] using hj
  have hK : ∀ i ∈ T.Kraw, ∀ j ∈ T.Kraw,
      dist (P.pt secondApex) (P.pt i) =
        dist (P.pt secondApex) (P.pt j) := by
    rcases O.is_other with h | h
    · have hKraw : T.Kraw = V.secondApexRow₂.rawSupport := by
        apply raw_eq_of_image_eq P
        rw [T.Kraw_image, h.1, V.secondApexRow₂.rawSupport_image]
      intro i hi j hj
      apply PositionalFourSupportRow.raw_equalDistances P V.secondApexRow₂
      · simpa [hKraw] using hi
      · simpa [hKraw] using hj
    · have hKraw : T.Kraw = V.secondApexRow₁.rawSupport := by
        apply raw_eq_of_image_eq P
        rw [T.Kraw_image, h.1, V.secondApexRow₁.rawSupport_image]
      intro i hi j hj
      apply PositionalFourSupportRow.raw_equalDistances P V.secondApexRow₁
      · simpa [hKraw] using hi
      · simpa [hKraw] using hj
  have hL : ∀ i ∈ O.Lraw, ∀ j ∈ O.Lraw,
      dist (P.pt secondApex) (P.pt i) =
        dist (P.pt secondApex) (P.pt j) := by
    rcases O.is_other with h | h
    · have hLraw : O.Lraw = V.secondApexRow₁.rawSupport := by
        apply raw_eq_of_image_eq P
        rw [h.2, V.secondApexRow₁.rawSupport_image]
      intro i hi j hj
      apply PositionalFourSupportRow.raw_equalDistances P V.secondApexRow₁
      · simpa [hLraw] using hi
      · simpa [hLraw] using hj
    · have hLraw : O.Lraw = V.secondApexRow₂.rawSupport := by
        apply raw_eq_of_image_eq P
        rw [h.2, V.secondApexRow₂.rawSupport_image]
      intro i hi j hj
      apply PositionalFourSupportRow.raw_equalDistances P V.secondApexRow₂
      · simpa [hLraw] using hi
      · simpa [hLraw] using hj
  have hT : ∀ i ∈ V.firstApexRow.rawSupport, ∀ j ∈ V.firstApexRow.rawSupport,
      dist (P.pt firstApex) (P.pt i) =
        dist (P.pt firstApex) (P.pt j) := by
    intro i hi j hj
    exact PositionalFourSupportRow.raw_equalDistances P V.firstApexRow hi hj
  have hG :
      ∀ (c : Exact13GlobalCenter) (i : Fin 13),
        i ∈ (G.row c).2.rawSupport → ∀ (j : Fin 13),
          j ∈ (G.row c).2.rawSupport →
            dist (P.pt c.1) (P.pt i) = dist (P.pt c.1) (P.pt j) := by
    intro c i hi j hj
    exact PositionalFourSupportRow.raw_equalDistances P (G.row c).2 hi hj
  apply exact13RawProviderPattern_realizes_of_equidist P
    V.blocker₁ V.blocker₂ T.C0raw T.C1raw T.Kraw O.Lraw
    V.firstApexRow.rawSupport (fun c => (G.row c).2.rawSupport)
    hC0 hC1 hK hL hT hG

/-- Reindex a raw provider pattern into the positional boundary coordinates. -/
def Exact13RawProviderPattern.toPositional
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (raw : ProviderRowPattern Exact13Provider (Fin 13))
    (P : ExactThirteenBranchIngress S) :
    ProviderRowPattern Exact13Provider (Fin 13) where
  centerOf := fun provider => P.idx (raw.centerOf provider)
  supportOf := fun provider => (raw.supportOf provider).image P.idx

/-- The raw provider realization survives the source-faithful positional
reindexing. -/
theorem Exact13RawProviderPattern.toPositional_realizes
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (raw : ProviderRowPattern Exact13Provider (Fin 13))
    (P : ExactThirteenBranchIngress S)
    (hraw : ProviderRealizes raw P.pt) :
    ProviderRealizes
      (Exact13RawProviderPattern.toPositional raw P) P.φ := by
  refine { equidist := ?_, injective := P.boundaryEnumeration.injective }
  intro provider first hfirst second hsecond
  rcases Finset.mem_image.mp hfirst with ⟨i, hi, hfirst_eq⟩
  rcases Finset.mem_image.mp hsecond with ⟨j, hj, hsecond_eq⟩
  subst first
  subst second
  have heq := hraw.equidist provider i hi j hj
  rw [P.boundaryEnumeration.pt_eq (raw.centerOf provider),
    P.boundaryEnumeration.pt_eq i, P.boundaryEnumeration.pt_eq j] at heq
  exact heq

/-- A checked provider row may use the two endpoints of one conflict edge. -/
def exact13ProviderEdgeChoice (provider : Exact13Provider)
    (first second : Fin 13) : ProviderRowChoice Exact13Provider (Fin 13) :=
  { provider := provider, support := insert first {second} }

/-- Two membership atoms imply PositiveRowsMatch for one provider edge. -/
theorem providerPositiveRowsMatch_single
    (P : ProviderRowPattern Exact13Provider (Fin 13))
    (provider : Exact13Provider) (first second : Fin 13)
    (hfirst : first ∈ P.supportOf provider)
    (hsecond : second ∈ P.supportOf provider) :
    ProviderPositiveRowsMatch P
      [exact13ProviderEdgeChoice provider first second] := by
  intro choice hchoice x hx
  rcases List.mem_singleton.mp hchoice with rfl
  simp only [exact13ProviderEdgeChoice, Finset.mem_insert,
    Finset.mem_singleton] at hx
  rcases hx with rfl | rfl
  · exact hfirst
  · exact hsecond

/-- Four provider-membership atoms imply PositiveRowsMatch for the two edges
of one conflict clause.  Role/blocker atoms are deliberately not hidden in
this proposition; the clause decoder supplies them separately. -/
theorem providerPositiveRowsMatch_two
    (P : ProviderRowPattern Exact13Provider (Fin 13))
    (provider₁ provider₂ : Exact13Provider)
    (first₁ second₁ first₂ second₂ : Fin 13)
    (hfirst₁ : first₁ ∈ P.supportOf provider₁)
    (hsecond₁ : second₁ ∈ P.supportOf provider₁)
    (hfirst₂ : first₂ ∈ P.supportOf provider₂)
    (hsecond₂ : second₂ ∈ P.supportOf provider₂) :
    ProviderPositiveRowsMatch P
      [ exact13ProviderEdgeChoice provider₁ first₁ second₁
      , exact13ProviderEdgeChoice provider₂ first₂ second₂ ] := by
  intro choice hchoice x hx
  rcases List.mem_cons.mp hchoice with rfl | hchoice
  · simp only [exact13ProviderEdgeChoice, Finset.mem_insert,
      Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact hfirst₁
    · exact hsecond₁
  · rcases List.mem_singleton.mp hchoice with rfl
    simp only [exact13ProviderEdgeChoice, Finset.mem_insert,
      Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact hfirst₂
    · exact hsecond₂

end ATailFrontierLiveClosure
end Problem97
