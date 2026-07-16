/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleSecondApexExtrema
import FixedSingleRadiusCycleSameCapEdge
import Erdos9796Proof.P97.N9Endpoint.N4a

/-!
# Ordered-cap lift of the coherent fixed-radius blocker cycle

This file lifts a strict `oppCap1` actual-blocker edge to the concrete
`CGN.OrderedCap` supplied by the ambient surplus packet.  It keeps the actual
blocker-map provenance, proves that both ranks are strict interior ranks, and
uses the N4a endpoint-monotonicity exports to identify the direction of the
second-apex distance comparison in cap order.

The final theorem isolates the remaining same-cap producer premise exactly:
the endpoint-radius equality required by the sibling
`SameCapIncompatibleEdge` is equivalent to membership of the chosen ordered
cap endpoint in the *actual critical shell* at the cycle source.  Thus the
missing input is one row-endpoint incidence, not more cap-order bookkeeping.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem triangleByIndex_oppIndex1_v2_eq_oppApex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (S.triangleByIndex S.oppIndex1).v2 = S.oppApex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.triangleByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppApex2, hi]

private theorem oppApex2_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap, hi] using
      S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap, hi] using
      S.partition.v1_mem_C2
  · simpa [SurplusCapPacket.oppApex2, SurplusCapPacket.surplusCap, hi] using
      S.partition.v2_mem_C3

private theorem triangleByIndex_oppIndex1_v3_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    (S.triangleByIndex S.oppIndex1).v3 ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.triangleByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap2, hi] using S.partition.v1_mem_C3
  · simpa [SurplusCapPacket.triangleByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap2, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.triangleByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap2, hi] using S.partition.v3_mem_C2

private theorem strictOppCap1_ne_supportEndpoints
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) :
    x ≠ (S.triangleByIndex S.oppIndex1).v2 ∧
      x ≠ (S.triangleByIndex S.oppIndex1).v3 := by
  have hxNotUnion : x ∉ S.surplusCap ∪ S.oppCap2 :=
    (Finset.mem_sdiff.mp hx).2
  have hxNotSurplus : x ∉ S.surplusCap := by
    intro h
    exact hxNotUnion (Finset.mem_union_left _ h)
  have hxNotOpp2 : x ∉ S.oppCap2 := by
    intro h
    exact hxNotUnion (Finset.mem_union_right _ h)
  constructor
  · intro h
    apply hxNotSurplus
    rw [h, triangleByIndex_oppIndex1_v2_eq_oppApex2 S]
    exact oppApex2_mem_surplusCap S
  · intro h
    apply hxNotOpp2
    rw [h]
    exact triangleByIndex_oppIndex1_v3_mem_oppCap2 S

/-- The concrete ordered-cap data for `oppCap1`, with the support-endpoint
orientation retained. -/
structure OppCap1OrderedData
    (D : CounterexampleData) (S : SurplusCapPacket D.A) where
  m : ℕ
  L : Problem97.CGN.OrderedCap m
  Packet : Problem97.CGN.MecCapPacket D.A L
  Hside : Problem97.CGN.MinorCapSideHypotheses Packet
  Hord : Problem97.CGN.StrictCapOrder D.A L
  cap_image : Finset.univ.image L.points = S.capByIndex S.oppIndex1
  endpoints :
    ((L.points (Problem97.CGN.firstIndex Packet.hm) =
          (S.triangleByIndex S.oppIndex1).v2 ∧
        L.points (Problem97.CGN.lastIndex Packet.hm) =
          (S.triangleByIndex S.oppIndex1).v3) ∨
      (L.points (Problem97.CGN.firstIndex Packet.hm) =
          (S.triangleByIndex S.oppIndex1).v3 ∧
        L.points (Problem97.CGN.lastIndex Packet.hm) =
          (S.triangleByIndex S.oppIndex1).v2))

/-- Ambient convexity supplies one retained ordered-cap realization of
`oppCap1`. -/
theorem nonempty_oppCap1OrderedData
    (D : CounterexampleData) (S : SurplusCapPacket D.A) :
    Nonempty (OppCap1OrderedData D S) := by
  rcases S.capByIndex_cgn4g_capData_oriented D.convex S.oppIndex1 with
    ⟨m, L, Packet, Hside, Hord, hcap, hends⟩
  exact ⟨{
    m := m
    L := L
    Packet := Packet
    Hside := Hside
    Hord := Hord
    cap_image := hcap
    endpoints := hends }⟩

namespace OppCap1OrderedData

/-- The second opposite apex is one of the two concrete endpoints of this
ordered realization. -/
theorem secondApex_endpoint
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    (O : OppCap1OrderedData D S) :
    O.L.points (Problem97.CGN.firstIndex O.Packet.hm) = S.oppApex2 ∨
      O.L.points (Problem97.CGN.lastIndex O.Packet.hm) = S.oppApex2 := by
  rcases O.endpoints with h | h
  · exact Or.inl (h.1.trans (triangleByIndex_oppIndex1_v2_eq_oppApex2 S))
  · exact Or.inr (h.2.trans (triangleByIndex_oppIndex1_v2_eq_oppApex2 S))

end OppCap1OrderedData

/-- An actual-blocker edge realized at two strict interior ranks of one
concrete ordered `oppCap1`.  The final field records the exact relationship
between rank direction and distance from the second apex. -/
structure RankedActualBlockerEdge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (i : Fin K.period) where
  sourceRank : Fin O.m
  blockerRank : Fin O.m
  source_eq : O.L.points sourceRank = (K.source i).1
  blocker_eq :
    O.L.points blockerRank = (H.blockerVertex (K.source i)).1
  ranks_ne : sourceRank ≠ blockerRank
  source_ne_first :
    sourceRank ≠ Problem97.CGN.firstIndex O.Packet.hm
  source_ne_last :
    sourceRank ≠ Problem97.CGN.lastIndex O.Packet.hm
  blocker_ne_first :
    blockerRank ≠ Problem97.CGN.firstIndex O.Packet.hm
  blocker_ne_last :
    blockerRank ≠ Problem97.CGN.lastIndex O.Packet.hm
  secondApex_rank_direction :
    ((O.L.points (Problem97.CGN.firstIndex O.Packet.hm) = S.oppApex2 ∧
        ((sourceRank < blockerRank ∧
            dist (K.source i).1 S.oppApex2 <
              dist (H.blockerVertex (K.source i)).1 S.oppApex2) ∨
          (blockerRank < sourceRank ∧
            dist (H.blockerVertex (K.source i)).1 S.oppApex2 <
              dist (K.source i).1 S.oppApex2))) ∨
      (O.L.points (Problem97.CGN.lastIndex O.Packet.hm) = S.oppApex2 ∧
        ((sourceRank < blockerRank ∧
            dist (H.blockerVertex (K.source i)).1 S.oppApex2 <
              dist (K.source i).1 S.oppApex2) ∨
          (blockerRank < sourceRank ∧
            dist (K.source i).1 S.oppApex2 <
              dist (H.blockerVertex (K.source i)).1 S.oppApex2))))

/-- Any strict-`oppCap1` actual-blocker edge has a concrete ordered-rank
realization. -/
theorem nonempty_rankedActualBlockerEdge
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (i : Fin K.period)
    (hsource :
      (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hblocker :
      (H.blockerVertex (K.source i)).1 ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) :
    Nonempty (RankedActualBlockerEdge K O i) := by
  classical
  have hcapEq := capByIndex_oppIndex1_eq_oppCap1 S
  have hsourceCap : (K.source i).1 ∈ S.capByIndex S.oppIndex1 := by
    rw [hcapEq]
    exact (Finset.mem_sdiff.mp hsource).1
  have hblockerCap :
      (H.blockerVertex (K.source i)).1 ∈ S.capByIndex S.oppIndex1 := by
    rw [hcapEq]
    exact (Finset.mem_sdiff.mp hblocker).1
  have hsourceImage : (K.source i).1 ∈ Finset.univ.image O.L.points := by
    rw [O.cap_image]
    exact hsourceCap
  have hblockerImage :
      (H.blockerVertex (K.source i)).1 ∈ Finset.univ.image O.L.points := by
    rw [O.cap_image]
    exact hblockerCap
  rcases Finset.mem_image.mp hsourceImage with ⟨ix, _hixMem, hix⟩
  rcases Finset.mem_image.mp hblockerImage with ⟨ip, _hipMem, hip⟩
  have hpointsNe :
      (K.source i).1 ≠ (H.blockerVertex (K.source i)).1 := by
    intro h
    exact H.blockerVertex_ne (K.source i) (Subtype.ext h.symm)
  have hixip : ix ≠ ip := by
    intro h
    apply hpointsNe
    rw [← hix, ← hip, h]
  have hsEnds := strictOppCap1_ne_supportEndpoints S hsource
  have hpEnds := strictOppCap1_ne_supportEndpoints S hblocker
  have hsFirst : ix ≠ Problem97.CGN.firstIndex O.Packet.hm := by
    rcases O.endpoints with hends | hends
    · intro h
      apply hsEnds.1
      calc
        (K.source i).1 = O.L.points ix := hix.symm
        _ = O.L.points (Problem97.CGN.firstIndex O.Packet.hm) := congrArg O.L.points h
        _ = (S.triangleByIndex S.oppIndex1).v2 := hends.1
    · intro h
      apply hsEnds.2
      calc
        (K.source i).1 = O.L.points ix := hix.symm
        _ = O.L.points (Problem97.CGN.firstIndex O.Packet.hm) := congrArg O.L.points h
        _ = (S.triangleByIndex S.oppIndex1).v3 := hends.1
  have hsLast : ix ≠ Problem97.CGN.lastIndex O.Packet.hm := by
    rcases O.endpoints with hends | hends
    · intro h
      apply hsEnds.2
      calc
        (K.source i).1 = O.L.points ix := hix.symm
        _ = O.L.points (Problem97.CGN.lastIndex O.Packet.hm) := congrArg O.L.points h
        _ = (S.triangleByIndex S.oppIndex1).v3 := hends.2
    · intro h
      apply hsEnds.1
      calc
        (K.source i).1 = O.L.points ix := hix.symm
        _ = O.L.points (Problem97.CGN.lastIndex O.Packet.hm) := congrArg O.L.points h
        _ = (S.triangleByIndex S.oppIndex1).v2 := hends.2
  have hpFirst : ip ≠ Problem97.CGN.firstIndex O.Packet.hm := by
    rcases O.endpoints with hends | hends
    · intro h
      apply hpEnds.1
      calc
        (H.blockerVertex (K.source i)).1 = O.L.points ip := hip.symm
        _ = O.L.points (Problem97.CGN.firstIndex O.Packet.hm) := congrArg O.L.points h
        _ = (S.triangleByIndex S.oppIndex1).v2 := hends.1
    · intro h
      apply hpEnds.2
      calc
        (H.blockerVertex (K.source i)).1 = O.L.points ip := hip.symm
        _ = O.L.points (Problem97.CGN.firstIndex O.Packet.hm) := congrArg O.L.points h
        _ = (S.triangleByIndex S.oppIndex1).v3 := hends.1
  have hpLast : ip ≠ Problem97.CGN.lastIndex O.Packet.hm := by
    rcases O.endpoints with hends | hends
    · intro h
      apply hpEnds.2
      calc
        (H.blockerVertex (K.source i)).1 = O.L.points ip := hip.symm
        _ = O.L.points (Problem97.CGN.lastIndex O.Packet.hm) := congrArg O.L.points h
        _ = (S.triangleByIndex S.oppIndex1).v3 := hends.2
    · intro h
      apply hpEnds.1
      calc
        (H.blockerVertex (K.source i)).1 = O.L.points ip := hip.symm
        _ = O.L.points (Problem97.CGN.lastIndex O.Packet.hm) := congrArg O.L.points h
        _ = (S.triangleByIndex S.oppIndex1).v2 := hends.2
  have hdir :
      ((O.L.points (Problem97.CGN.firstIndex O.Packet.hm) = S.oppApex2 ∧
          ((ix < ip ∧
              dist (K.source i).1 S.oppApex2 <
                dist (H.blockerVertex (K.source i)).1 S.oppApex2) ∨
            (ip < ix ∧
              dist (H.blockerVertex (K.source i)).1 S.oppApex2 <
                dist (K.source i).1 S.oppApex2))) ∨
        (O.L.points (Problem97.CGN.lastIndex O.Packet.hm) = S.oppApex2 ∧
          ((ix < ip ∧
              dist (H.blockerVertex (K.source i)).1 S.oppApex2 <
                dist (K.source i).1 S.oppApex2) ∨
            (ip < ix ∧
              dist (K.source i).1 S.oppApex2 <
                dist (H.blockerVertex (K.source i)).1 S.oppApex2)))) := by
    rcases O.secondApex_endpoint with hfirst | hlast
    · left
      refine ⟨hfirst, ?_⟩
      rcases lt_or_gt_of_ne hixip with hlt | hgt
      · left
        refine ⟨hlt, ?_⟩
        have hmono :=
          Problem97.FiniteEndpoint.E3L20a_of_cgnCapData
            O.Packet O.Hside O.Hord hlt
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
          hix, hip, hfirst, dist_comm] using hmono
      · right
        refine ⟨hgt, ?_⟩
        have hmono :=
          Problem97.FiniteEndpoint.E3L20a_of_cgnCapData
            O.Packet O.Hside O.Hord hgt
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCap_points,
          hix, hip, hfirst, dist_comm] using hmono
    · right
      refine ⟨hlast, ?_⟩
      rcases lt_or_gt_of_ne hixip with hlt | hgt
      · left
        refine ⟨hlt, ?_⟩
        have hrev : ip.rev < ix.rev := by
          apply Fin.lt_def.mpr
          rw [Fin.val_rev, Fin.val_rev]
          have := Fin.lt_def.mp hlt
          omega
        have hmono :=
          Problem97.FiniteEndpoint.E3L20b_of_cgnCapData
            O.Packet O.Hside O.Hord hrev
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
          hix, hip, hlast, dist_comm] using hmono
      · right
        refine ⟨hgt, ?_⟩
        have hrev : ix.rev < ip.rev := by
          apply Fin.lt_def.mpr
          rw [Fin.val_rev, Fin.val_rev]
          have := Fin.lt_def.mp hgt
          omega
        have hmono :=
          Problem97.FiniteEndpoint.E3L20b_of_cgnCapData
            O.Packet O.Hside O.Hord hrev
        simpa [Problem97.FiniteEndpoint.OrderedSideChain.ofOrderedCapRev_points,
          hix, hip, hlast, dist_comm] using hmono
  exact ⟨{
    sourceRank := ix
    blockerRank := ip
    source_eq := hix
    blocker_eq := hip
    ranks_ne := hixip
    source_ne_first := hsFirst
    source_ne_last := hsLast
    blocker_ne_first := hpFirst
    blocker_ne_last := hpLast
    secondApex_rank_direction := hdir }⟩

/-- For period at least three, the banked same-cap edge theorem and the new
second-apex extrema theorem coexist on one concrete ordered-cap realization.
The local edge is not claimed to be one of the two global extremal edges: the
single possible `oppCap2` source is exactly what prevents that unconditional
identification. -/
structure OrderedSecondApexCyclePacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H) where
  order : OppCap1OrderedData D S
  extrema : SourceExactMinimalActualBlockerCycle.SecondApexDistanceExtrema K
  edgeIndex : Fin K.period
  edge : RankedActualBlockerEdge K order edgeIndex

theorem nonempty_orderedSecondApexCyclePacket_of_three_le_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hthree : 3 ≤ K.period) :
    Nonempty (OrderedSecondApexCyclePacket K) := by
  rcases nonempty_oppCap1OrderedData D S with ⟨O⟩
  rcases
      SourceExactMinimalActualBlockerCycle.nonempty_secondApexDistanceExtrema K with
    ⟨E⟩
  rcases
      SourceExactMinimalActualBlockerCycle.exists_strictOppCap1_blockerEdge_of_three_le_period
        K hthree with
    ⟨i, hsource, hblocker⟩
  rcases nonempty_rankedActualBlockerEdge K O i hsource hblocker with ⟨R⟩
  exact ⟨{ order := O, extrema := E, edgeIndex := i, edge := R }⟩

/-- Endpoint side vocabulary matching the sibling `CapEndpoint` interface,
kept local because that sibling module is not import-reachable here. -/
inductive ActualShellEndpoint
  | first
  | last
  deriving DecidableEq, Repr

def ActualShellEndpoint.idx {m : ℕ} (hm : 2 ≤ m) :
    ActualShellEndpoint → Fin m
  | .first => Problem97.CGN.firstIndex hm
  | .last => Problem97.CGN.lastIndex hm

namespace RankedActualBlockerEdge

/-- The one field still needed to complete the sibling
`SameCapIncompatibleEdge`: the selected ordered-cap endpoint has the same
distance from the *actual blocker* as the source does. -/
def EndpointRadiusPremise
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S} {i : Fin K.period}
    (E : RankedActualBlockerEdge K O i)
    (used : ActualShellEndpoint) : Prop :=
  dist (O.L.points E.blockerRank) (O.L.points E.sourceRank) =
    dist (O.L.points E.blockerRank)
      (O.L.points (used.idx O.Packet.hm))

/-- Exact shell interpretation of the missing endpoint-radius field.  Because
the selected critical row is a *full* radius class, the metric equality is
equivalent to the chosen endpoint belonging to that actual row. -/
theorem endpointRadiusPremise_iff_actualRowEndpointMem
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S} {i : Fin K.period}
    (E : RankedActualBlockerEdge K O i)
    (used : ActualShellEndpoint) :
    E.EndpointRadiusPremise used ↔
      O.L.points (used.idx O.Packet.hm) ∈
        (H.selectedAt (K.source i).1 (K.source i).2).toCriticalFourShell.support := by
  let R :=
    (H.selectedAt (K.source i).1 (K.source i).2).toCriticalFourShell
  constructor
  · intro heq
    apply R.off_row_named_label_forbidden
    · exact O.Packet.mem_A _
    · have hsourceRadius :
          dist (H.blockerVertex (K.source i)).1 (K.source i).1 = R.radius := by
        simpa [R, CriticalShellSystem.blockerVertex] using
          R.support_eq_radius (K.source i).1 R.q_mem_support
      have heq' :
          dist (H.blockerVertex (K.source i)).1 (K.source i).1 =
            dist (H.blockerVertex (K.source i)).1
              (O.L.points (used.idx O.Packet.hm)) := by
        simpa [EndpointRadiusPremise, E.source_eq, E.blocker_eq] using heq
      simpa [R, CriticalShellSystem.blockerVertex] using heq'.symm.trans hsourceRadius
  · intro hmem
    have hsourceRadius :
        dist (H.blockerVertex (K.source i)).1 (K.source i).1 = R.radius := by
      simpa [R, CriticalShellSystem.blockerVertex] using
        R.support_eq_radius (K.source i).1 R.q_mem_support
    have hendpointRadius :
        dist (H.blockerVertex (K.source i)).1
            (O.L.points (used.idx O.Packet.hm)) = R.radius := by
      simpa [R, CriticalShellSystem.blockerVertex] using
        R.support_eq_radius _ hmem
    have heq :
        dist (H.blockerVertex (K.source i)).1 (K.source i).1 =
          dist (H.blockerVertex (K.source i)).1
            (O.L.points (used.idx O.Packet.hm)) :=
      hsourceRadius.trans hendpointRadius.symm
    simpa [EndpointRadiusPremise, E.source_eq, E.blocker_eq] using heq

end RankedActualBlockerEdge

/-- Local exact mirror of the banked sibling `SameCapIncompatibleEdge` shape.
It is used only to show that no additional hidden field remains after one
actual-row endpoint incidence is supplied. -/
structure SameCapIncompatibleEdgeMirror {m : ℕ}
    (A : Finset ℝ²) (L : Problem97.CGN.OrderedCap m) where
  hm : 2 ≤ m
  ix : Fin m
  ip : Fin m
  used : ActualShellEndpoint
  mem_pts : ∀ t, L.points t ∈ A
  endpoint_radius_eq :
    dist (L.points ip) (L.points ix) =
      dist (L.points ip) (L.points (used.idx hm))

/-- Once the single actual-row endpoint incidence is available, the ranked
actual-blocker edge fills every field of the sibling edge interface. -/
def RankedActualBlockerEdge.toSameCapIncompatibleEdgeMirror
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {K : SourceExactMinimalActualBlockerCycle P H}
    {O : OppCap1OrderedData D S} {i : Fin K.period}
    (E : RankedActualBlockerEdge K O i)
    (used : ActualShellEndpoint)
    (hendpoint : E.EndpointRadiusPremise used) :
    SameCapIncompatibleEdgeMirror D.A O.L :=
  { hm := O.Packet.hm
    ix := E.sourceRank
    ip := E.blockerRank
    used := used
    mem_pts := O.Packet.mem_A
    endpoint_radius_eq := hendpoint }

#print axioms nonempty_rankedActualBlockerEdge
#print axioms nonempty_orderedSecondApexCyclePacket_of_three_le_period
#print axioms RankedActualBlockerEdge.endpointRadiusPremise_iff_actualRowEndpointMem
#print axioms RankedActualBlockerEdge.toSameCapIncompatibleEdgeMirror

end ATailRFullParentEntryScratch
end Problem97
