/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13ProviderIngress

/-!
# Direct exact-thirteen cell-0 three-form terminal

This module re-encodes the authenticated direct second-opposite three-form
certificate with the live `Exact13Provider` type.  It is deliberately a
conditional terminal: the source dispatch packet and ten provider-pair
incidences are premises, and no aggregate closure claim is made here.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open DRExactThirteenValuation
open ExactThirteenBranchIngress
open ProviderRowNogoodCertificate

attribute [local instance] Classical.propDecidable

def directCell0Position (i : Fin 13) : Fin 13 :=
  directIndex .secondOpposite i

def directCell0G2 : Exact13Provider := .g ⟨2, by decide⟩
def directCell0G3 : Exact13Provider := .g ⟨3, by decide⟩
def directCell0G5 : Exact13Provider := .g ⟨5, by decide⟩
def directCell0G6 : Exact13Provider := .g ⟨6, by decide⟩
def directCell0G8 : Exact13Provider := .g ⟨8, by decide⟩
def directCell0G11 : Exact13Provider := .g ⟨11, by decide⟩

def directCell0Path0 :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 2, directCell0Position 8)
    steps :=
      [ .flip (directCell0Position 2) (directCell0Position 8)
      , .row directCell0G8 (directCell0Position 2) (directCell0Position 6)
      ]
    last := (directCell0Position 8, directCell0Position 6) }

def directCell0Path1 :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 5, directCell0Position 0)
    steps :=
      [ .flip (directCell0Position 5) (directCell0Position 0)
      , .row .k (directCell0Position 5) (directCell0Position 7)
      ]
    last := (directCell0Position 0, directCell0Position 7) }

def directCell0Path2 :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 2, directCell0Position 7)
    steps :=
      [ .row directCell0G2 (directCell0Position 7) (directCell0Position 11) ]
    last := (directCell0Position 2, directCell0Position 11) }

def directCell0Path3 :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 8, directCell0Position 7)
    steps := []
    last := (directCell0Position 8, directCell0Position 7) }

def directCell0Path4 :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 0, directCell0Position 6)
    steps :=
      [ .flip (directCell0Position 0) (directCell0Position 6)
      , .row directCell0G6 (directCell0Position 0) (directCell0Position 1)
      , .flip (directCell0Position 6) (directCell0Position 1)
      , .row .t (directCell0Position 6) (directCell0Position 12)
      , .flip (directCell0Position 1) (directCell0Position 12)
      , .row .c1 (directCell0Position 1) (directCell0Position 3)
      , .flip (directCell0Position 12) (directCell0Position 3)
      , .row directCell0G3 (directCell0Position 12) (directCell0Position 5)
      , .flip (directCell0Position 3) (directCell0Position 5)
      , .row directCell0G5 (directCell0Position 3) (directCell0Position 2)
      , .flip (directCell0Position 5) (directCell0Position 2)
      ]
    last := (directCell0Position 2, directCell0Position 5) }

def directCell0Path5 :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 8, directCell0Position 11)
    steps :=
      [ .flip (directCell0Position 8) (directCell0Position 11)
      , .row directCell0G11 (directCell0Position 8) (directCell0Position 0)
      , .flip (directCell0Position 11) (directCell0Position 0)
      , .row .l (directCell0Position 11) (directCell0Position 8)
      , .flip (directCell0Position 0) (directCell0Position 8)
      ]
    last := (directCell0Position 8, directCell0Position 0) }

def directCell0ThreeFormData :
    ProviderWeightedKalmansonCancellationData Exact13Provider 13 :=
  { terms :=
      [ { quad := ⟨directCell0Position 8, directCell0Position 0,
            directCell0Position 6, directCell0Position 7⟩
          form := .innerOuter
          weight := 1 }
      , { quad := ⟨directCell0Position 2, directCell0Position 8,
            directCell0Position 11, directCell0Position 7⟩
          form := .innerOuter
          weight := 1 }
      , { quad := ⟨directCell0Position 2, directCell0Position 8,
            directCell0Position 5, directCell0Position 0⟩
          form := .adjacentSides
          weight := 1 }
      ]
    pairings :=
      [ { left := directCell0Path0.first
          right := directCell0Path0.last
          path := directCell0Path0 }
      , { left := directCell0Path1.first
          right := directCell0Path1.last
          path := directCell0Path1 }
      , { left := directCell0Path2.first
          right := directCell0Path2.last
          path := directCell0Path2 }
      , { left := directCell0Path3.first
          right := directCell0Path3.last
          path := directCell0Path3 }
      , { left := directCell0Path4.first
          right := directCell0Path4.last
          path := directCell0Path4 }
      , { left := directCell0Path5.first
          right := directCell0Path5.last
          path := directCell0Path5 }
      ] }

def directCell0ThreeFormChoices :
    List (ProviderRowChoice Exact13Provider (Fin 13)) :=
  [ exact13ProviderEdgeChoice directCell0G8
      (directCell0Position 2) (directCell0Position 6)
  , exact13ProviderEdgeChoice .k
      (directCell0Position 5) (directCell0Position 7)
  , exact13ProviderEdgeChoice directCell0G2
      (directCell0Position 7) (directCell0Position 11)
  , exact13ProviderEdgeChoice directCell0G6
      (directCell0Position 0) (directCell0Position 1)
  , exact13ProviderEdgeChoice .t
      (directCell0Position 6) (directCell0Position 12)
  , exact13ProviderEdgeChoice .c1
      (directCell0Position 1) (directCell0Position 3)
  , exact13ProviderEdgeChoice directCell0G3
      (directCell0Position 12) (directCell0Position 5)
  , exact13ProviderEdgeChoice directCell0G5
      (directCell0Position 3) (directCell0Position 2)
  , exact13ProviderEdgeChoice directCell0G11
      (directCell0Position 8) (directCell0Position 0)
  , exact13ProviderEdgeChoice .l
      (directCell0Position 11) (directCell0Position 8)
  ]

structure DirectCell0ThreeFormAtoms
    (raw : ProviderRowPattern Exact13Provider (Fin 13)) : Prop where
  c1 : (1 : Fin 13) ∈ raw.supportOf .c1 ∧
    (3 : Fin 13) ∈ raw.supportOf .c1
  g11 : (0 : Fin 13) ∈ raw.supportOf directCell0G11 ∧
    (8 : Fin 13) ∈ raw.supportOf directCell0G11
  g2 : (11 : Fin 13) ∈ raw.supportOf directCell0G2 ∧
    (7 : Fin 13) ∈ raw.supportOf directCell0G2
  g3 : (12 : Fin 13) ∈ raw.supportOf directCell0G3 ∧
    (5 : Fin 13) ∈ raw.supportOf directCell0G3
  g5 : (2 : Fin 13) ∈ raw.supportOf directCell0G5 ∧
    (3 : Fin 13) ∈ raw.supportOf directCell0G5
  g6 : (0 : Fin 13) ∈ raw.supportOf directCell0G6 ∧
    (1 : Fin 13) ∈ raw.supportOf directCell0G6
  g8 : (2 : Fin 13) ∈ raw.supportOf directCell0G8 ∧
    (6 : Fin 13) ∈ raw.supportOf directCell0G8
  k : (5 : Fin 13) ∈ raw.supportOf .k ∧
    (7 : Fin 13) ∈ raw.supportOf .k
  l : (11 : Fin 13) ∈ raw.supportOf .l ∧
    (8 : Fin 13) ∈ raw.supportOf .l
  t : (12 : Fin 13) ∈ raw.supportOf .t ∧
    (6 : Fin 13) ∈ raw.supportOf .t

/- The live raw pattern is kept as a definition so the theorem below cannot
   replace the source-selected rows by the synthetic probe pattern. -/
noncomputable def directCell0RawProviderPattern
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
      R surface firstRow secondRow Q.base P X.tightSupport) :
    ProviderRowPattern Exact13Provider (Fin 13) :=
  exact13RawProviderPattern_of_dispatch R surface firstRow secondRow Q P X O
    X.fivePositionalRows (Exact13GlobalRows.ofIngress P)

private theorem directCell0_toPositional_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (raw : ProviderRowPattern Exact13Provider (Fin 13))
    (P : ExactThirteenBranchIngress S)
    (hidx : P.idx = directIndex .secondOpposite)
    {provider : Exact13Provider} {i : Fin 13}
    (hi : i ∈ raw.supportOf provider) :
    directCell0Position i ∈
      (Exact13RawProviderPattern.toPositional raw P).supportOf provider := by
  refine Finset.mem_image.mpr ⟨i, hi, ?_⟩
  simp [Exact13RawProviderPattern.toPositional, directCell0Position, hidx]

private theorem directCell0_threeForm_positive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (raw : ProviderRowPattern Exact13Provider (Fin 13))
    (P : ExactThirteenBranchIngress S)
    (hidx : P.idx = directIndex .secondOpposite)
    (atoms : DirectCell0ThreeFormAtoms raw) :
    ProviderPositiveRowsMatch
      (Exact13RawProviderPattern.toPositional raw P)
      directCell0ThreeFormChoices := by
  have hc1₁ := directCell0_toPositional_mem raw P hidx atoms.c1.1
  have hc1₂ := directCell0_toPositional_mem raw P hidx atoms.c1.2
  have hg11₁ := directCell0_toPositional_mem raw P hidx atoms.g11.1
  have hg11₂ := directCell0_toPositional_mem raw P hidx atoms.g11.2
  have hg2₁ := directCell0_toPositional_mem raw P hidx atoms.g2.1
  have hg2₂ := directCell0_toPositional_mem raw P hidx atoms.g2.2
  have hg3₁ := directCell0_toPositional_mem raw P hidx atoms.g3.1
  have hg3₂ := directCell0_toPositional_mem raw P hidx atoms.g3.2
  have hg5₁ := directCell0_toPositional_mem raw P hidx atoms.g5.1
  have hg5₂ := directCell0_toPositional_mem raw P hidx atoms.g5.2
  have hg6₁ := directCell0_toPositional_mem raw P hidx atoms.g6.1
  have hg6₂ := directCell0_toPositional_mem raw P hidx atoms.g6.2
  have hg8₁ := directCell0_toPositional_mem raw P hidx atoms.g8.1
  have hg8₂ := directCell0_toPositional_mem raw P hidx atoms.g8.2
  have hk₁ := directCell0_toPositional_mem raw P hidx atoms.k.1
  have hk₂ := directCell0_toPositional_mem raw P hidx atoms.k.2
  have hl₁ := directCell0_toPositional_mem raw P hidx atoms.l.1
  have hl₂ := directCell0_toPositional_mem raw P hidx atoms.l.2
  have ht₁ := directCell0_toPositional_mem raw P hidx atoms.t.1
  have ht₂ := directCell0_toPositional_mem raw P hidx atoms.t.2
  intro choice hchoice x hx
  simp [directCell0ThreeFormChoices] at hchoice
  rcases hchoice with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
  all_goals
    simp only [exact13ProviderEdgeChoice, Finset.mem_insert,
      Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
  · exact hg8₁
  · exact hg8₂
  · exact hk₁
  · exact hk₂
  · exact hg2₂
  · exact hg2₁
  · exact hg6₁
  · exact hg6₂
  · exact ht₂
  · exact ht₁
  · exact hc1₁
  · exact hc1₂
  · exact hg3₁
  · exact hg3₂
  · exact hg5₂
  · exact hg5₁
  · exact hg11₂
  · exact hg11₁
  · exact hl₁
  · exact hl₂

/- The direct-cell terminal.  The source packet, not the probe, supplies the
   provider realization; the ten raw incidences are the only cell-specific
   support premises. -/
theorem false_of_directCell0_threeForm
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
    (hidx : P.idx = directIndex .secondOpposite)
    (hblocker₂ : X.fivePositionalRows.blocker₂ = 12)
    (atoms : DirectCell0ThreeFormAtoms
      (directCell0RawProviderPattern R surface firstRow secondRow Q P X O)) :
    False := by
  let raw := directCell0RawProviderPattern R surface firstRow secondRow Q P X O
  let G := Exact13GlobalRows.ofIngress P
  have hraw : ProviderRealizes raw P.pt := by
    exact exact13RawProviderPattern_realizes R surface firstRow secondRow Q P X O
      X.fivePositionalRows G
  have hpos : ProviderRealizes
      (Exact13RawProviderPattern.toPositional raw P) P.φ := by
    exact Exact13RawProviderPattern.toPositional_realizes raw P hraw
  have hpositive := directCell0_threeForm_positive raw P hidx atoms
  have himage : (Finset.univ : Finset (Fin 13)).image P.φ = D.A := by
    let cast : Fin 13 → Fin P.P.B.n := Fin.cast P.P.card_n.symm
    have hcast_surjective : Function.Surjective cast := by
      intro q
      refine ⟨Fin.cast P.P.card_n q, ?_⟩
      simp [cast]
    have hboundary_image :
        Finset.univ.image (fun q : Fin 13 => P.P.B.boundary (cast q)) = D.A := by
      calc
        Finset.univ.image (fun q : Fin 13 => P.P.B.boundary (cast q)) =
            (Finset.univ.image cast).image P.P.B.boundary := by
          simpa [Function.comp_def] using
            (Finset.image_image (s := (Finset.univ : Finset (Fin 13)))
              (f := cast) (g := P.P.B.boundary)).symm
        _ = Finset.univ.image P.P.B.boundary := by
          rw [Finset.image_univ_of_surjective hcast_surjective]
        _ = D.A := P.P.B.boundary_image
    have hφ : P.φ = fun q : Fin 13 => P.P.B.boundary (cast q) := by
      funext q
      exact P.boundary_realization q
    rw [hφ]
    exact hboundary_image
  have hconv : ConvexIndep D.A := by
    rw [← himage]
    exact P.boundaryEnumeration.convexIndep
  have hcheck :
      directCell0ThreeFormData.check directCell0ThreeFormChoices
        (Exact13RawProviderPattern.toPositional raw P) = true := by
    simp [directCell0ThreeFormData, directCell0ThreeFormChoices,
      directCell0Path0, directCell0Path1, directCell0Path2,
      directCell0Path3, directCell0Path4, directCell0Path5, raw,
      directCell0G2, directCell0G3, directCell0G5, directCell0G6,
      directCell0G8, directCell0G11,
      Exact13RawProviderPattern.toPositional, directCell0RawProviderPattern,
      exact13RawProviderPattern_of_dispatch, hidx, hblocker₂,
      Exact13RawProviderPattern, ProviderWeightedKalmansonCancellationData.check,
      ProviderWeightedKalmansonCancellationData.leftEdges,
      ProviderWeightedKalmansonCancellationData.rightEdges,
      GenericRowNogoodCertificate.WeightedKalmansonTerm.leftEdges,
      GenericRowNogoodCertificate.WeightedKalmansonTerm.rightEdges,
      GenericRowNogoodCertificate.WeightedKalmansonTerm.check,
      GenericRowNogoodCertificate.OrderedQuadData.leftEdge0,
      GenericRowNogoodCertificate.OrderedQuadData.leftEdge1,
      GenericRowNogoodCertificate.OrderedQuadData.rightEdge0,
      GenericRowNogoodCertificate.OrderedQuadData.rightEdge1,
      exact13ProviderEdgeChoice,
      checkProviderPath, checkProviderStepChain, checkProviderPrimitiveStep,
      ProviderPrimitiveEqualityStep.source, ProviderPrimitiveEqualityStep.target,
      directCell0Position, directIndex, directValue, secondApex, firstApex] <;> decide
  exact false_of_providerWeightedKalmansonCancellationData_of_check
    hconv himage P.boundaryEnumeration.ccw hpos directCell0ThreeFormChoices
    hpositive directCell0ThreeFormData hcheck

end ATailFrontierLiveClosure
end Problem97
