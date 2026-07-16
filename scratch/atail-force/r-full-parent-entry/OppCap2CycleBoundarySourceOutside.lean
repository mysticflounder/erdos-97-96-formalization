/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import FixedSingleRadiusCycleSourceOutside

/-!
# The sole `oppCap2` cycle source forces a boundary source-outside triple

Every canonical source in the fixed-radius blocker cycle lies on one circle
about `oppApex1`, and at most one source lies in `oppCap2`.  Suppose the center
of a consecutive cycle triple is that exceptional source.  The preceding two
sources are then strict `oppCap1` points.  If both belonged to the selected
row centered at the exception, the exception and `oppApex1` would be two
distinct centers in the ordered `oppCap2`, equidistant from the same two
distinct points outside that cap.  Ordered-cap outside-pair uniqueness rules
this out.

This argument uses only the source-exact fixed-radius theorem.  It does not
identify or compare the independently reconstructed robust-pair mates or
their private radii.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRFullParentEntryScratch

open ATailSubcarrierTerminalInvariantScratch
open ATailRActualBlockerTransitionScratch

attribute [local instance] Classical.propDecidable

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

private theorem oppApex1_mem_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C3
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C1
  · simpa [SurplusCapPacket.oppCap2,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C2

private theorem oppApex1_mem_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex1 ∈ S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v2_mem_C1
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v3_mem_C2
  · simpa [SurplusCapPacket.surplusCap,
      SurplusCapPacket.oppApex1, hi] using S.partition.v1_mem_C3

/-- A fixed-radius cycle source distinct from a named `oppCap2` source is
strict `oppCap1`. -/
private theorem source_mem_strictOppCap1_of_ne_oppCap2_source
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    {i e : Fin K.period}
    (heOpp2 : (K.source e).1 ∈ S.oppCap2)
    (hsourceNe : K.source i ≠ K.source e) :
    (K.source i).1 ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  rcases
      SourceExactMinimalActualBlockerCycle.source_mem_strictOppCap1_or_oppCap2
        K i with hstrict | hiOpp2
  · exact hstrict
  · exact False.elim (hsourceNe (congrArg K.source
      (SourceExactMinimalActualBlockerCycle.eq_of_sources_mem_oppCap2
        K hiOpp2 heOpp2)))

/-- If the second successor of a period-at-least-three cycle index is the
sole possible `oppCap2` source, the preceding source is outside the selected
critical shell at the first successor.

The selected shell is the actual full critical row, and its center is exactly
the second successor. -/
theorem sourceOutsideSuccessorShell_of_secondSuccessor_mem_oppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hthree : 3 ≤ K.period) (i : Fin K.period)
    (hOpp2 :
      (K.source
        (orderedSuccessorIndex K (orderedSuccessorIndex K i))).1 ∈
          S.oppCap2) :
    CycleSourceOutsideSuccessorShell K i := by
  let j := orderedSuccessorIndex K i
  let e := orderedSuccessorIndex K j
  have hijEdge :
      H.blockerVertex (K.source i) = K.source j := by
    simpa [j] using blockerVertex_source_eq_orderedSuccessor K i
  have hjeEdge :
      H.blockerVertex (K.source j) = K.source e := by
    simpa [e] using blockerVertex_source_eq_orderedSuccessor K j
  have hiNeE : K.source i ≠ K.source e := by
    simpa [j, e, hjeEdge] using
      source_ne_secondBlocker_of_three_le_period K hthree i
  have hjNeE : K.source j ≠ K.source e := by
    intro h
    exact H.blockerVertex_ne (K.source j) (hjeEdge.trans h.symm)
  have heOpp2 : (K.source e).1 ∈ S.oppCap2 := by
    simpa [j, e] using hOpp2
  have hiStrict :=
    source_mem_strictOppCap1_of_ne_oppCap2_source K heOpp2 hiNeE
  have hjStrict :=
    source_mem_strictOppCap1_of_ne_oppCap2_source K heOpp2 hjNeE
  intro hiRow
  let R := (H.selectedAt (K.source j).1 (K.source j).2).toCriticalFourShell
  have hjRow : (K.source j).1 ∈ R.support := R.q_mem_support
  have heCenter :
      H.centerAt (K.source j).1 (K.source j).2 = (K.source e).1 := by
    exact congrArg Subtype.val hjeEdge
  have heEq :
      dist (K.source e).1 (K.source i).1 =
        dist (K.source e).1 (K.source j).1 := by
    simpa [R, heCenter] using
      (R.support_eq_radius (K.source i).1 hiRow).trans
        (R.support_eq_radius (K.source j).1 hjRow).symm
  have hapexEq :
      dist S.oppApex1 (K.source i).1 =
        dist S.oppApex1 (K.source j).1 := by
    exact
      (mem_selectedClass.mp
        (SourceExactMinimalActualBlockerCycle.source_mem_fixedClass K i)).2.trans
      (mem_selectedClass.mp
        (SourceExactMinimalActualBlockerCycle.source_mem_fixedClass K j)).2.symm
  have hiOutsideOpp2 : (K.source i).1 ∉ S.oppCap2 := by
    intro hiOpp2
    exact (Finset.mem_sdiff.mp hiStrict).2
      (Finset.mem_union.mpr (Or.inr hiOpp2))
  have hjOutsideOpp2 : (K.source j).1 ∉ S.oppCap2 := by
    intro hjOpp2
    exact (Finset.mem_sdiff.mp hjStrict).2
      (Finset.mem_union.mpr (Or.inr hjOpp2))
  have heNeApex : (K.source e).1 ≠ S.oppApex1 := by
    intro h
    exact
      (SourceExactMinimalActualBlockerCycle.source_off_surplus_of_fixedRadius
        K e) (h ▸ oppApex1_mem_surplusCap S)
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have heImage : (K.source e).1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact heOpp2
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap, hcapEq]
    exact oppApex1_mem_oppCap2 S
  rcases Finset.mem_image.mp heImage with ⟨re, _hre, hre⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ra, _hra, hra⟩
  have hreNe : re ≠ ra := by
    intro h
    apply heNeApex
    calc
      (K.source e).1 = L.points re := hre.symm
      _ = L.points ra := congrArg L.points h
      _ = S.oppApex1 := hra
  have hiOutsideImage : (K.source i).1 ∉ Finset.univ.image L.points := by
    simpa [hcap, hcapEq] using hiOutsideOpp2
  have hjOutsideImage : (K.source j).1 ∉ Finset.univ.image L.points := by
    simpa [hcap, hcapEq] using hjOutsideOpp2
  have hij : (K.source i).1 ≠ (K.source j).1 := by
    intro h
    exact H.blockerVertex_ne (K.source i)
      (hijEdge.trans (Subtype.ext h).symm)
  rcases lt_or_gt_of_ne hreNe with hreLt | hraLt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hreLt
      (K.source i).2 (K.source j).2 hiOutsideImage hjOutsideImage hij
      (by simpa [hre] using heEq)
      (by simpa [hra] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hraLt
      (K.source i).2 (K.source j).2 hiOutsideImage hjOutsideImage hij
      (by simpa [hra] using hapexEq)
      (by simpa [hre] using heEq)

/-- Cyclic predecessor index, used only to place a named exception two steps
after the desired boundary source. -/
noncomputable def orderedPredecessorIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) : Fin K.period :=
  ⟨(i.1 + K.period - 1) % K.period,
    Nat.mod_lt _ (lt_of_lt_of_le Nat.zero_lt_two K.two_le_period)⟩

/-- The public cyclic successor and predecessor are inverse. -/
theorem orderedSuccessorIndex_orderedPredecessorIndex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {C : Finset ℝ²} {rho : ℝ}
    {P : AmbientRobustHistoryPair D S C rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (i : Fin K.period) :
    orderedSuccessorIndex K (orderedPredecessorIndex K i) = i := by
  apply Fin.ext
  simp only [orderedSuccessorIndex, orderedPredecessorIndex]
  have hp : 0 < K.period :=
    lt_of_lt_of_le Nat.zero_lt_two K.two_le_period
  have hone : 1 % K.period = 1 :=
    Nat.mod_eq_of_lt (lt_of_lt_of_le Nat.one_lt_two K.two_le_period)
  have hsum : i.1 + K.period - 1 + 1 = i.1 + K.period := by omega
  calc
    (((i.1 + K.period - 1) % K.period + 1) % K.period) =
        (((i.1 + K.period - 1) % K.period + 1 % K.period) %
          K.period) := by rw [hone]
    _ = (i.1 + K.period - 1 + 1) % K.period := by
      exact (Nat.add_mod (i.1 + K.period - 1) 1 K.period).symm
    _ = (i.1 + K.period) % K.period := by rw [hsum]
    _ = i.1 := by
      rw [Nat.add_mod, Nat.mod_eq_of_lt i.isLt, Nat.mod_self, add_zero,
        Nat.mod_eq_of_lt i.isLt]

/-- Every named `oppCap2` source in a period-at-least-three cycle therefore
produces a boundary source-outside triple two cyclic steps before it. -/
theorem exists_sourceOutsideSuccessorShell_of_source_mem_oppCap2
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (hthree : 3 ≤ K.period)
    {e : Fin K.period} (heOpp2 : (K.source e).1 ∈ S.oppCap2) :
    ∃ i : Fin K.period, CycleSourceOutsideSuccessorShell K i := by
  let j := orderedPredecessorIndex K e
  let i := orderedPredecessorIndex K j
  refine ⟨i, sourceOutsideSuccessorShell_of_secondSuccessor_mem_oppCap2
    K hthree i ?_⟩
  have hij : orderedSuccessorIndex K i = j := by
    simpa [i] using orderedSuccessorIndex_orderedPredecessorIndex K j
  have hje : orderedSuccessorIndex K j = e := by
    simpa [j] using orderedSuccessorIndex_orderedPredecessorIndex K e
  simpa [hij, hje] using heOpp2

/-- Combining the all-strict descent with the exceptional boundary argument
eliminates the cap-local disjunction: every coherent fixed-radius cycle of
period at least three has a source-outside successor shell. -/
theorem exists_sourceOutsideSuccessorShell_of_three_le_period
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    (K : SourceExactMinimalActualBlockerCycle P H)
    (O : OppCap1OrderedData D S) (hthree : 3 ≤ K.period) :
    ∃ i : Fin K.period, CycleSourceOutsideSuccessorShell K i := by
  rcases exists_sourceOutsideSuccessorShell_or_source_mem_oppCap2
      K O hthree with hsourceOutside | ⟨e, heOpp2⟩
  · exact hsourceOutside
  · exact exists_sourceOutsideSuccessorShell_of_source_mem_oppCap2
      K hthree heOpp2

#print axioms sourceOutsideSuccessorShell_of_secondSuccessor_mem_oppCap2
#print axioms orderedSuccessorIndex_orderedPredecessorIndex
#print axioms exists_sourceOutsideSuccessorShell_of_source_mem_oppCap2
#print axioms exists_sourceOutsideSuccessorShell_of_three_le_period

end ATailRFullParentEntryScratch
end Problem97
