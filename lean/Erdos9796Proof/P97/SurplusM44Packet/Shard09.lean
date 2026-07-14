/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import Erdos9796Proof.P97.SurplusM44Packet.Shard01
import Erdos9796Proof.P97.SurplusM44Packet.Shard02
import Erdos9796Proof.P97.SurplusM44Packet.Shard05
import Erdos9796Proof.P97.SurplusM44Packet.Shard07
import Erdos9796Proof.P97.SurplusM44Packet.Shard08

/-!
# `SurplusM44Packet` shard 09 (lines 11483-12329 of the original monolith)

Mechanical split of `SurplusM44Packet.lean`; body text is verbatim.
First decl:
`IsM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple_chains`.
Last decl:
`IsM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_exact_split_chainData`.
The aggregator module `Erdos9796Proof.P97.SurplusM44Packet` re-exports every shard, so
downstream imports are unchanged.
-/

open scoped EuclideanGeometry
open Finset

namespace Problem97

namespace SurplusCapPacket

/-- Chain-facing second non-surplus-cap erased-pin reducer.  The ordered-chain
inputs supply the adjacent one-hit upper bounds. -/
theorem IsM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hxA : x ∈ A)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex2 p (dist p x))
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x)) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex2 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.exists_oppIndex2_primitive_packet_cases_of_erasedPinTriple
    hK4 hcontain hxA hp htriple hl_pos hr_pos hl hr

/-- Chain-facing first non-surplus-cap erased-pin reducer with the erased
surplus point supplying the right-adjacent lower count. -/
theorem
    IsM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support)
    (hl_pos : 1 ≤ S.leftAdjCount S.oppIndex1 p (dist p x)) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex1 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.exists_oppIndex1_primitive_packet_cases_of_surplus_erasedPinTriple
    hK4 hcontain hx hp htriple hl_pos hl hr

/-- Chain-facing second non-surplus-cap erased-pin reducer with the erased
surplus point supplying the left-adjacent lower count. -/
theorem
    IsM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support)
    (hr_pos : 1 ≤ S.rightAdjCount S.oppIndex2 p (dist p x)) :
    ∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1)) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex2 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.exists_oppIndex2_primitive_packet_cases_of_surplus_erasedPinTriple
    hK4 hcontain hx hp htriple hr_pos hl hr

/-- Chain-facing first non-surplus erased-pin split.  The ordered-chain
one-hit bounds reduce the branch to primitive packet rows or the single
left-zero full-count obstruction `(2,1,0,1)`. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      (S.moserCount p (dist p x) = 2 ∧
        S.sameCapCount S.oppIndex1 p (dist p x) = 1 ∧
        S.leftAdjCount S.oppIndex1 p (dist p x) = 0 ∧
        S.rightAdjCount S.oppIndex1 p (dist p x) = 1) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex1 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.oppIndex1_surplusErasedPinTriple_cases
    hK4 hcontain hx hp htriple hl hr

/-- Chain-facing second non-surplus erased-pin split.  The ordered-chain
one-hit bounds reduce the branch to primitive packet rows or the single
right-zero full-count obstruction `(2,1,1,0)`. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      (S.moserCount p (dist p x) = 2 ∧
        S.sameCapCount S.oppIndex2 p (dist p x) = 1 ∧
        S.leftAdjCount S.oppIndex2 p (dist p x) = 1 ∧
        S.rightAdjCount S.oppIndex2 p (dist p x) = 0) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex2 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.oppIndex2_surplusErasedPinTriple_cases
    hK4 hcontain hx hp htriple hl hr

/-- Chain-facing first non-surplus erased-pin split, returning a named
one-sided payload instead of raw obstruction counts. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_payload_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex1 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.oppIndex1_surplusErasedPinTriple_payload_cases
    hK4 hcontain hx hp htriple hl hr

/-- Chain-facing second non-surplus erased-pin split, returning a named
one-sided payload instead of raw obstruction counts. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_payload_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) := by
  rcases S.adjacentCount_le_one_of_adjacent_chains
      S.oppIndex2 p (dist p x) L R hmonoL hmonoR hsubL hsubR with
    ⟨hl, hr⟩
  exact hM44.oppIndex2_surplusErasedPinTriple_payload_cases
    hK4 hcontain hx hp htriple hl hr

/-- Aggregated-chain-data first non-surplus erased-pin split, returning a
primitive row or the named one-sided payload. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_payload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact hM44.oppIndex1_surplusErasedPinTriple_payload_cases_chains
    hK4 hcontain hx hp htriple L R hmonoL hmonoR hsubL hsubR

/-- Aggregated-chain-data second non-surplus erased-pin split, returning a
primitive row or the named one-sided payload. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_payload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact hM44.oppIndex2_surplusErasedPinTriple_payload_cases_chains
    hK4 hcontain hx hp htriple L R hmonoL hmonoR hsubL hsubR

/-- Aggregated-chain-data first non-surplus erased-pin split, returning a
primitive row or the one-sided payload with the erased point identified as the
right-adjacent singleton. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_erasedPayload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (htriple : ErasedPinTriple A x p)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x)) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex1 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex1 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
          S.packetRightAdjCount S.oppIndex1 T = 1))) ∨
      RightOneSidedErasedPayload S S.oppIndex1 p x (dist p x) := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_payload_cases_chainData
      hK4 hcontain hx hp htriple hdata with
    hprimitive | hpayload
  · exact Or.inl hprimitive
  · exact Or.inr
      (S.rightOneSidedErasedPayload_of_oppIndex1_surplus_mem hx hpayload)

/-- Aggregated-chain-data second non-surplus erased-pin split, returning a
primitive row or the one-sided payload with the erased point identified as the
left-adjacent singleton. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_erasedPayload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (htriple : ErasedPinTriple A x p)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x)) :
    (∃ T : Finset ℝ²,
      T ⊆ SelectedClass A p (dist p x) ∧
      T.card = 4 ∧
      ((S.packetMoserCount T = 1 ∧
          S.packetSameCapCount S.oppIndex2 p T = 1 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1) ∨
        (S.packetMoserCount T = 2 ∧
          S.packetSameCapCount S.oppIndex2 p T = 0 ∧
          S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
          S.packetRightAdjCount S.oppIndex2 T = 1))) ∨
      LeftOneSidedErasedPayload S S.oppIndex2 p x (dist p x) := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_payload_cases_chainData
      hK4 hcontain hx hp htriple hdata with
    hprimitive | hpayload
  · exact Or.inl hprimitive
  · exact Or.inr
      (S.leftOneSidedErasedPayload_of_oppIndex2_surplus_mem hx hpayload)

/-- Consumer form for the first non-surplus erased-pin branch: primitive-row
and one-sided-payload exclusions refute the erased-pin triple. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hl : S.leftAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex1 p (dist p x) ≤ 1)
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hpayloadFalse :
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_payload_cases
      hK4 hcontain hx hp htriple hl hr with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Consumer form for the second non-surplus erased-pin branch: primitive-row
and one-sided-payload exclusions refute the erased-pin triple. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hl : S.leftAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hr : S.rightAdjCount S.oppIndex2 p (dist p x) ≤ 1)
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hpayloadFalse :
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_payload_cases
      hK4 hcontain hx hp htriple hl hr with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Chain-facing consumer form for the first non-surplus erased-pin branch. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex1) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex1) ⊆ R.support)
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hpayloadFalse :
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_payload_cases_chains
      hK4 hcontain hx hp htriple L R hmonoL hmonoR hsubL hsubR with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Chain-facing consumer form for the second non-surplus erased-pin branch. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases_chains
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²} {mL mR : ℕ}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (L : FiniteEndpoint.OrderedSideChain mL)
    (R : FiniteEndpoint.OrderedSideChain mR)
    (hmonoL : N8a3AdjacentCapDistanceStrict p L)
    (hmonoR : N8a3AdjacentCapDistanceStrict p R)
    (hsubL :
      (SelectedClass A p (dist p x) ∩
          S.leftAdjacentInteriorByIndex S.oppIndex2) ⊆ L.support)
    (hsubR :
      (SelectedClass A p (dist p x) ∩
          S.rightAdjacentInteriorByIndex S.oppIndex2) ⊆ R.support)
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hpayloadFalse :
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_payload_cases_chains
      hK4 hcontain hx hp htriple L R hmonoL hmonoR hsubL hsubR with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Aggregated-chain-data consumer form for the first non-surplus erased-pin
branch. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hpayloadFalse :
      RightOneSidedObstructionPayload S S.oppIndex1 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact hM44.oppIndex1_surplusErasedPinTriple_false_of_payload_cases_chains
    hK4 hcontain hx hp L R hmonoL hmonoR hsubL hsubR
    hprimitiveFalse hpayloadFalse htriple

/-- Aggregated-chain-data consumer form for the second non-surplus erased-pin
branch. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hpayloadFalse :
      LeftOneSidedObstructionPayload S S.oppIndex2 p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hdata with
    ⟨mL, mR, L, R, hmonoL, hmonoR, hsubL, hsubR⟩
  exact hM44.oppIndex2_surplusErasedPinTriple_false_of_payload_cases_chains
    hK4 hcontain hx hp L R hmonoL hmonoR hsubL hsubR
    hprimitiveFalse hpayloadFalse htriple

/-- Aggregated-chain-data consumer form for the first non-surplus erased-pin
branch, using the stronger erased-point one-sided payload. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hpayloadFalse :
      RightOneSidedErasedPayload S S.oppIndex1 p x (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex1_surplusErasedPinTriple_erasedPayload_cases_chainData
      hK4 hcontain hx hp htriple hdata with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Aggregated-chain-data consumer form for the second non-surplus erased-pin
branch, using the stronger erased-point one-sided payload. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hpayloadFalse :
      LeftOneSidedErasedPayload S S.oppIndex2 p x (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False := by
  rcases hM44.oppIndex2_surplusErasedPinTriple_erasedPayload_cases_chainData
      hK4 hcontain hx hp htriple hdata with
    hprimitive | hpayload
  · rcases hprimitive with ⟨T, hTsub, hTcard, hrows⟩
    exact hprimitiveFalse hTsub hTcard hrows
  · exact hpayloadFalse hpayload

/-- Aggregated-chain-data consumer for the first non-surplus erased-pin branch,
with the one-sided erased payload split into own-endpoint and opposite-Moser
subcases. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_split_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) → False)
    (hoppositeFalse :
      S.oppositeVertexByIndex S.oppIndex1 ∈
        SelectedClass A p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False :=
  hM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    hK4 hcontain hx hp hdata hprimitiveFalse
    (fun hpayload =>
      S.rightOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex1
        hownFalse hoppositeFalse hpayload)
    htriple

/-- Aggregated-chain-data consumer for the second non-surplus erased-pin branch,
with the one-sided erased payload split into own-endpoint and opposite-Moser
subcases. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_split_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) → False)
    (hoppositeFalse :
      S.oppositeVertexByIndex S.oppIndex2 ∈
        SelectedClass A p (dist p x) → False)
    (htriple : ErasedPinTriple A x p) :
    False :=
  hM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    hK4 hcontain hx hp hdata hprimitiveFalse
    (fun hpayload =>
      S.leftOneSidedErasedPayload_false_of_own_or_opposite S.oppIndex2
        hownFalse hoppositeFalse hpayload)
    htriple

/-- Aggregated-chain-data consumer for the first non-surplus erased-pin branch,
with the one-sided erased payload split into own-endpoint and exact-opposite
cap-class subcases. -/
theorem IsM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_exact_split_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior1)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex1 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex1 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex1 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex1 T = 1 ∧
            S.packetRightAdjCount S.oppIndex1 T = 1)) → False)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex1 ∈
          SelectedClass A p (dist p x) → False)
    (hexactOppositeFalse :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex1) (dist p x) =
        S.capByIndex S.oppIndex1 → False)
    (htriple : ErasedPinTriple A x p) :
    False :=
  hM44.oppIndex1_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    hK4 hcontain hx hp hdata hprimitiveFalse
    (fun hpayload =>
      hM44.rightOneSidedErasedPayload_false_of_own_or_exactOpposite
        hK4 hcontain hp hownFalse hexactOppositeFalse hpayload)
    htriple

/-- Aggregated-chain-data consumer for the second non-surplus erased-pin
branch, with the one-sided erased payload split into own-endpoint and
exact-opposite cap-class subcases. -/
theorem IsM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_exact_split_chainData
    {A : Finset ℝ²} {S : SurplusCapPacket A} (hM44 : S.IsM44)
    (hK4 : HasNEquidistantProperty 4 A)
    (hcontain : S.NonSurplusMoserCapContainment)
    {x p : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.surplusIdx)
    (hp : p ∈ S.oppInterior2)
    (hdata :
      S.AdjacentChainOneHitData S.oppIndex2 p (dist p x))
    (hprimitiveFalse :
      ∀ {T : Finset ℝ²},
        T ⊆ SelectedClass A p (dist p x) →
        T.card = 4 →
        ((S.packetMoserCount T = 1 ∧
            S.packetSameCapCount S.oppIndex2 p T = 1 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1) ∨
          (S.packetMoserCount T = 2 ∧
            S.packetSameCapCount S.oppIndex2 p T = 0 ∧
            S.packetLeftAdjCount S.oppIndex2 T = 1 ∧
            S.packetRightAdjCount S.oppIndex2 T = 1)) → False)
    (hownFalse :
      S.leftOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) →
        S.rightOuterVertexByIndex S.oppIndex2 ∈
          SelectedClass A p (dist p x) → False)
    (hexactOppositeFalse :
      SelectedClass A (S.oppositeVertexByIndex S.oppIndex2) (dist p x) =
        S.capByIndex S.oppIndex2 → False)
    (htriple : ErasedPinTriple A x p) :
    False :=
  hM44.oppIndex2_surplusErasedPinTriple_false_of_erasedPayload_cases_chainData
    hK4 hcontain hx hp hdata hprimitiveFalse
    (fun hpayload =>
      hM44.leftOneSidedErasedPayload_false_of_own_or_exactOpposite
        hK4 hcontain hp hownFalse hexactOppositeFalse hpayload)
    htriple


end SurplusCapPacket

end Problem97
