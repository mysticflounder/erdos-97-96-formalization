/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13DirectCell0ThreeFormTerminal

/-!
# Direct exact-thirteen cell-0 one-form terminal

This module records the single inner-outer Kalmanson clause with ordered
labels `[2, 8, 0, 7]`.  It is a conditional terminal: the live exact-thirteen
provider packet and the six raw support incidences are premises.  It does not
claim coverage of the direct cell or of the exact-thirteen branch.
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

def directCell0OneFormPathL :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 8, directCell0Position 0)
    steps :=
      [ .flip (directCell0Position 8) (directCell0Position 0)
      , .row .l (directCell0Position 8) (directCell0Position 2)
      , .flip (directCell0Position 0) (directCell0Position 2)
      ]
    last := (directCell0Position 2, directCell0Position 0) }

def directCell0OneFormPathG2G8 :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 2, directCell0Position 7)
    steps :=
      [ .row directCell0G2 (directCell0Position 7) (directCell0Position 8)
      , .flip (directCell0Position 2) (directCell0Position 8)
      , .row directCell0G8 (directCell0Position 2) (directCell0Position 7)
      ]
    last := (directCell0Position 8, directCell0Position 7) }

def directCell0OneFormData :
    ProviderWeightedKalmansonCancellationData Exact13Provider 13 :=
  { terms :=
      [ { quad := ⟨directCell0Position 2, directCell0Position 8,
            directCell0Position 0, directCell0Position 7⟩
          form := .innerOuter
          weight := 1 }
      ]
    pairings :=
      [ { left := directCell0OneFormPathL.first
          right := directCell0OneFormPathL.last
          path := directCell0OneFormPathL }
      , { left := directCell0OneFormPathG2G8.first
          right := directCell0OneFormPathG2G8.last
          path := directCell0OneFormPathG2G8 }
      ] }

def directCell0OneFormChoices :
    List (ProviderRowChoice Exact13Provider (Fin 13)) :=
  [ exact13ProviderEdgeChoice .l
      (directCell0Position 2) (directCell0Position 8)
  , exact13ProviderEdgeChoice directCell0G2
      (directCell0Position 7) (directCell0Position 8)
  , exact13ProviderEdgeChoice directCell0G8
      (directCell0Position 2) (directCell0Position 7)
  ]

structure DirectCell0OneFormAtoms
    (raw : ProviderRowPattern Exact13Provider (Fin 13)) : Prop where
  l : (2 : Fin 13) ∈ raw.supportOf .l ∧
    (8 : Fin 13) ∈ raw.supportOf .l
  g2 : (7 : Fin 13) ∈ raw.supportOf directCell0G2 ∧
    (8 : Fin 13) ∈ raw.supportOf directCell0G2
  g8 : (2 : Fin 13) ∈ raw.supportOf directCell0G8 ∧
    (7 : Fin 13) ∈ raw.supportOf directCell0G8

private theorem directCell0OneForm_toPositional_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (raw : ProviderRowPattern Exact13Provider (Fin 13))
    (P : ExactThirteenBranchIngress S)
    (hidx : P.idx = directIndex .secondOpposite)
    {provider : Exact13Provider} {i : Fin 13}
    (hi : i ∈ raw.supportOf provider) :
    directCell0Position i ∈
      (Exact13RawProviderPattern.toPositional raw P).supportOf provider := by
  refine Finset.mem_image.mpr ⟨i, hi, ?_⟩
  simp [directCell0Position, hidx]

private theorem directCell0OneForm_positive
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (raw : ProviderRowPattern Exact13Provider (Fin 13))
    (P : ExactThirteenBranchIngress S)
    (hidx : P.idx = directIndex .secondOpposite)
    (atoms : DirectCell0OneFormAtoms raw) :
    ProviderPositiveRowsMatch
      (Exact13RawProviderPattern.toPositional raw P)
      directCell0OneFormChoices := by
  have hl₂ := directCell0OneForm_toPositional_mem raw P hidx atoms.l.1
  have hl₈ := directCell0OneForm_toPositional_mem raw P hidx atoms.l.2
  have hg2₇ := directCell0OneForm_toPositional_mem raw P hidx atoms.g2.1
  have hg2₈ := directCell0OneForm_toPositional_mem raw P hidx atoms.g2.2
  have hg8₂ := directCell0OneForm_toPositional_mem raw P hidx atoms.g8.1
  have hg8₇ := directCell0OneForm_toPositional_mem raw P hidx atoms.g8.2
  intro choice hchoice x hx
  simp [directCell0OneFormChoices] at hchoice
  rcases hchoice with rfl | rfl | rfl
  all_goals
    simp only [exact13ProviderEdgeChoice, Finset.mem_insert,
      Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
  · exact hl₂
  · exact hl₈
  · exact hg2₇
  · exact hg2₈
  · exact hg8₂
  · exact hg8₇

theorem false_of_directCell0_oneForm_g2g8l
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
    (atoms : DirectCell0OneFormAtoms
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
  have hpositive := directCell0OneForm_positive raw P hidx atoms
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
      directCell0OneFormData.check directCell0OneFormChoices
        (Exact13RawProviderPattern.toPositional raw P) = true := by
    simp [directCell0OneFormData, directCell0OneFormChoices,
      directCell0OneFormPathL, directCell0OneFormPathG2G8, raw,
      directCell0G2, directCell0G8,
      Exact13RawProviderPattern.toPositional, directCell0RawProviderPattern,
      exact13RawProviderPattern_of_dispatch, hidx,
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
      exact13ProviderEdgeChoice, checkProviderPath, checkProviderStepChain,
      checkProviderPrimitiveStep, ProviderPrimitiveEqualityStep.source,
      ProviderPrimitiveEqualityStep.target, directCell0Position, directIndex,
      directValue, secondApex, firstApex]
  exact false_of_providerWeightedKalmansonCancellationData_of_check
    hconv himage P.boundaryEnumeration.ccw hpos directCell0OneFormChoices
    hpositive directCell0OneFormData hcheck

end ATailFrontierLiveClosure
end Problem97
