/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
-/

import Erdos9796Proof.P97.ATail.FrontierLiveClosure.CardGeThirteenExact13DirectCell0ThreeFormTerminal

/-!
# Direct exact-thirteen cell-0 one-form G5/G7/G8 terminal

This module records the repaired one-form certificate on direct positions
`8, 3, 5, 7`.  The dispatch packet and exactly six raw provider incidences are
premises; no blocker premise or aggregate closure claim is introduced.
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

def directCell0G7 : Exact13Provider := .g ⟨7, by decide⟩

def directCell0OneFormG8Path :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 8, directCell0Position 7)
    steps :=
      [ .row directCell0G8 (directCell0Position 7) (directCell0Position 5) ]
    last := (directCell0Position 8, directCell0Position 5) }

def directCell0OneFormG5G7Path :
    ProviderClosurePathData Exact13Provider (Fin 13) :=
  { first := (directCell0Position 3, directCell0Position 5)
    steps :=
      [ .flip (directCell0Position 3) (directCell0Position 5)
      , .row directCell0G5 (directCell0Position 3) (directCell0Position 7)
      , .flip (directCell0Position 5) (directCell0Position 7)
      , .row directCell0G7 (directCell0Position 5) (directCell0Position 3)
      , .flip (directCell0Position 7) (directCell0Position 3)
      ]
    last := (directCell0Position 3, directCell0Position 7) }

def directCell0OneFormG5G7G8Data :
    ProviderWeightedKalmansonCancellationData Exact13Provider 13 :=
  { terms :=
      [ { quad := ⟨directCell0Position 8, directCell0Position 3,
            directCell0Position 5, directCell0Position 7⟩
          form := .innerOuter
          weight := 1 }
      ]
    pairings :=
      [ { left := directCell0OneFormG8Path.first
          right := directCell0OneFormG8Path.last
          path := directCell0OneFormG8Path }
      , { left := directCell0OneFormG5G7Path.first
          right := directCell0OneFormG5G7Path.last
          path := directCell0OneFormG5G7Path }
      ] }

def directCell0OneFormG5G7G8Choices :
    List (ProviderRowChoice Exact13Provider (Fin 13)) :=
  [ exact13ProviderEdgeChoice directCell0G8
      (directCell0Position 7) (directCell0Position 5)
  , exact13ProviderEdgeChoice directCell0G5
      (directCell0Position 3) (directCell0Position 7)
  , exact13ProviderEdgeChoice directCell0G7
      (directCell0Position 5) (directCell0Position 3)
  ]

structure DirectCell0OneFormG5G7G8Atoms
    (raw : ProviderRowPattern Exact13Provider (Fin 13)) : Prop where
  g8 : (7 : Fin 13) ∈ raw.supportOf directCell0G8 ∧
    (5 : Fin 13) ∈ raw.supportOf directCell0G8
  g5 : (3 : Fin 13) ∈ raw.supportOf directCell0G5 ∧
    (7 : Fin 13) ∈ raw.supportOf directCell0G5
  g7 : (5 : Fin 13) ∈ raw.supportOf directCell0G7 ∧
    (3 : Fin 13) ∈ raw.supportOf directCell0G7

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
    (atoms : DirectCell0OneFormG5G7G8Atoms raw) :
    ProviderPositiveRowsMatch
      (Exact13RawProviderPattern.toPositional raw P)
      directCell0OneFormG5G7G8Choices := by
  have hg8₁ := directCell0OneForm_toPositional_mem raw P hidx atoms.g8.1
  have hg8₂ := directCell0OneForm_toPositional_mem raw P hidx atoms.g8.2
  have hg5₁ := directCell0OneForm_toPositional_mem raw P hidx atoms.g5.1
  have hg5₂ := directCell0OneForm_toPositional_mem raw P hidx atoms.g5.2
  have hg7₁ := directCell0OneForm_toPositional_mem raw P hidx atoms.g7.1
  have hg7₂ := directCell0OneForm_toPositional_mem raw P hidx atoms.g7.2
  intro choice hchoice x hx
  simp [directCell0OneFormG5G7G8Choices] at hchoice
  rcases hchoice with rfl | rfl | rfl
  all_goals
    simp only [exact13ProviderEdgeChoice, Finset.mem_insert,
      Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
  · exact hg8₁
  · exact hg8₂
  · exact hg5₁
  · exact hg5₂
  · exact hg7₁
  · exact hg7₂

/- The direct one-form terminal uses the source-selected raw pattern and only
   the six provider incidences encoded by `DirectCell0OneFormG5G7G8Atoms`. -/
theorem false_of_directCell0_oneForm_g5g7g8
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
    (atoms : DirectCell0OneFormG5G7G8Atoms
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
      directCell0OneFormG5G7G8Data.check directCell0OneFormG5G7G8Choices
        (Exact13RawProviderPattern.toPositional raw P) = true := by
    simp [directCell0OneFormG5G7G8Data,
      directCell0OneFormG5G7G8Choices, directCell0OneFormG8Path,
      directCell0OneFormG5G7Path, raw, directCell0G5, directCell0G7,
      directCell0G8, Exact13RawProviderPattern.toPositional,
      directCell0RawProviderPattern, exact13RawProviderPattern_of_dispatch,
      hidx, Exact13RawProviderPattern,
      ProviderWeightedKalmansonCancellationData.check,
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
      directCell0Position, directIndex, directValue, secondApex, firstApex]; decide
  exact false_of_providerWeightedKalmansonCancellationData_of_check
    hconv himage P.boundaryEnumeration.ccw hpos
    directCell0OneFormG5G7G8Choices hpositive directCell0OneFormG5G7G8Data hcheck

end ATailFrontierLiveClosure
end Problem97
