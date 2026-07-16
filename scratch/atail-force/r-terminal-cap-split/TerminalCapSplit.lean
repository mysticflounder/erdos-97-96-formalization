/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/

import LeastTerminalHitReciprocalRowSplit
import StrictOppCapCrossClassifier

/-!
# Cap split for the terminal reciprocal directed cross

The terminal `ReciprocalDirectedCrossResidual` has two distinct off-surplus
points on one circle about `oppApex1`.  The opposite-cap one-hit theorem
therefore leaves exactly two geometric branches:

* both endpoints lie in strict `oppCap1`; or
* one endpoint lies in strict `oppCap1` and the other is the unique point of
  this fixed-radius fiber in `oppCap2`.

On the both-strict branch, the selected row at the deleted endpoint contains
both points.  The existing strict-cap classifier used exact card five only to
separate the selected blocker from `oppApex1`.  Here that separation follows
instead from the residual's deletion-survival field.  The blocker is therefore
strict `oppCap1`, the row has exactly the two named endpoints in `oppCap1`,
and its remaining two support points lie outside `oppCap1`.

The second branch retains an ordered realization of `oppCap2`, the unique
fixed-fiber hit, and concrete ranks for that hit and `oppApex1`.  The unique
hit is either the shared Moser endpoint `surplusApex` or lies in strict
`oppCap2`.  This is a boundary packet, not a contradiction.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace ATailRTerminalCapSplitScratch

open ATAILStageOnePrescribedApexDichotomy
open ATailRFullParentEntryScratch
open ATailRFullParentEntryScratch.CoherentRCommonDeletionPacket
open ATailStrictOppCapCrossClassifierScratch
open ATailSubcarrierTerminalInvariantScratch

attribute [local instance] Classical.propDecidable

private lemma mem_moserVerts_cases
    {A : Finset ℝ²} {M : MoserTriangle A} {x : ℝ²}
    (hx : x ∈ M.verts) :
    x = M.v1 ∨ x = M.v2 ∨ x = M.v3 := by
  simpa [MoserTriangle.verts] using hx

private theorem capByIndex_surplusIdx_eq_surplusCap
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.surplusIdx = S.surplusCap := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.surplusCap, hi]

private theorem capByIndex_oppIndex1_eq_oppCap1
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex1 = S.oppCap1 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex1,
      SurplusCapPacket.oppCap1, hi]

private theorem capByIndex_oppIndex2_eq_oppCap2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.capByIndex S.oppIndex2 = S.oppCap2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.capByIndex, SurplusCapPacket.oppIndex2,
      SurplusCapPacket.oppCap2, hi]

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

private theorem oppCap1_inter_oppCap2_subset_surplusApex
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppCap1 ∩ S.oppCap2 ⊆
      ({S.surplusApex} : Finset ℝ²) := by
  intro x hx
  have hx1 : x ∈ S.oppCap1 := (Finset.mem_inter.mp hx).1
  have hx2 : x ∈ S.oppCap2 := (Finset.mem_inter.mp hx).2
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ S.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · simp
      · exact False.elim (S.partition.v2_notin_C2 hx1)
      · exact False.elim (S.partition.v3_notin_C3 hx2)
    · have hxA : x ∈ A := S.partition.C2_subset hx1
      have hone := S.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC1 : x ∈ S.partition.C1
      · simp [hxC1, hx1, hx2] at hone
      · simp [hxC1, hx1, hx2] at hone
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ S.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (S.partition.v1_notin_C1 hx2)
      · simp
      · exact False.elim (S.partition.v3_notin_C3 hx1)
    · have hxA : x ∈ A := S.partition.C3_subset hx1
      have hone := S.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC2 : x ∈ S.partition.C2
      · simp [hx1, hx2, hxC2] at hone
      · simp [hx1, hx2, hxC2] at hone
  · simp only [SurplusCapPacket.oppCap1, SurplusCapPacket.oppCap2,
      SurplusCapPacket.surplusApex, hi] at hx1 hx2 ⊢
    by_cases hxVerts : x ∈ S.triangle.verts
    · rcases mem_moserVerts_cases hxVerts with rfl | rfl | rfl
      · exact False.elim (S.partition.v1_notin_C1 hx1)
      · exact False.elim (S.partition.v2_notin_C2 hx2)
      · simp
    · have hxA : x ∈ A := S.partition.C1_subset hx1
      have hone := S.partition.nonmoser_in_one x hxA hxVerts
      by_cases hxC3 : x ∈ S.partition.C3
      · simp [hx1, hx2, hxC3] at hone
      · simp [hx1, hx2, hxC3] at hone

private theorem false_of_two_cap_centers_equidistant_outside_pair
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hapexCap : S.oppApex1 ∈ S.capByIndex k)
    (hc_ne_apex : c ≠ S.oppApex1)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hapexEq : dist S.oppApex1 a = dist S.oppApex1 b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hapexCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hapexImage with ⟨ia, _hia, hia⟩
  have hic_ne_ia : ic ≠ ia := by
    intro h
    apply hc_ne_apex
    calc
      c = L.points ic := hic.symm
      _ = L.points ia := by simp [h]
      _ = S.oppApex1 := hia
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_ia with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hia] using hapexEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hia] using hapexEq)
      (by simpa [hic] using hcEq)

private theorem directed_cross_blocker_mem_strictOppCap1_of_ne_apex
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {H : CriticalShellSystem D.A}
    {q w : ℝ²}
    (hqA : q ∈ D.A) (hwA : w ∈ D.A) (hqw : q ≠ w)
    (hqStrict : q ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hwStrict : w ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hcenterNe : H.centerAt q hqA ≠ S.oppApex1)
    (hwShell : w ∈ (H.selectedAt q hqA).toCriticalFourShell.support)
    (hapexEq : dist S.oppApex1 q = dist S.oppApex1 w) :
    H.centerAt q hqA ∈
      S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
  let c := H.centerAt q hqA
  have hcA : c ∈ D.A := by
    simpa [c] using
      (Finset.mem_erase.mp
        (H.selectedAt q hqA).toCriticalFourShell.center_mem).2
  have hqOffSurplus : q ∉ S.surplusCap :=
    fun h => (Finset.mem_sdiff.mp hqStrict).2
      (Finset.mem_union.mpr (Or.inl h))
  have hwOffSurplus : w ∉ S.surplusCap :=
    fun h => (Finset.mem_sdiff.mp hwStrict).2
      (Finset.mem_union.mpr (Or.inl h))
  have hqOffOpp2 : q ∉ S.oppCap2 :=
    fun h => (Finset.mem_sdiff.mp hqStrict).2
      (Finset.mem_union.mpr (Or.inr h))
  have hwOffOpp2 : w ∉ S.oppCap2 :=
    fun h => (Finset.mem_sdiff.mp hwStrict).2
      (Finset.mem_union.mpr (Or.inr h))
  have hcEq : dist c q = dist c w := by
    exact
      ((H.selectedAt q hqA).toCriticalFourShell.support_eq_radius
        q (H.selectedAt q hqA).toCriticalFourShell.q_mem_support).trans
      ((H.selectedAt q hqA).toCriticalFourShell.support_eq_radius
        w hwShell).symm
  have hcNotSurplus : c ∉ S.surplusCap := by
    intro hcSurplus
    have hcapEq := capByIndex_surplusIdx_eq_surplusCap S
    exact false_of_two_cap_centers_equidistant_outside_pair
      S S.surplusIdx
      (by simpa only [hcapEq] using hcSurplus)
      (by simpa only [hcapEq] using oppApex1_mem_surplusCap S)
      (by simpa [c] using hcenterNe)
      hqA hwA hqw
      (by simpa only [hcapEq] using hqOffSurplus)
      (by simpa only [hcapEq] using hwOffSurplus)
      hcEq hapexEq
  have hcNotOpp2 : c ∉ S.oppCap2 := by
    intro hcOpp2
    have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
    exact false_of_two_cap_centers_equidistant_outside_pair
      S S.oppIndex2
      (by simpa only [hcapEq] using hcOpp2)
      (by simpa only [hcapEq] using oppApex1_mem_oppCap2 S)
      (by simpa [c] using hcenterNe)
      hqA hwA hqw
      (by simpa only [hcapEq] using hqOffOpp2)
      (by simpa only [hcapEq] using hwOffOpp2)
      hcEq hapexEq
  exact mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps
    S hcA hcNotSurplus hcNotOpp2

private theorem source_deleted_secondApex_distance_ne
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) :
    dist R.sourcePair.x S.oppApex2 ≠
      dist R.deleted S.oppApex2 := by
  intro hsecond
  have hsourceA : R.sourcePair.x ∈ D.A :=
    (mem_selectedClass.mp X.source_mem_fixedClass).1
  have hdeletedA : R.deleted ∈ D.A :=
    (mem_selectedClass.mp X.deleted_mem_fixedClass).1
  exact U2NonSurplusSqueeze.oppCap2_escape_gen
    D S hsourceA hdeletedA X.source_off_surplus X.deleted_off_surplus
    R.source_ne_deleted
    (by simpa [dist_comm] using
      (mem_selectedClass.mp X.source_mem_fixedClass).2)
    (by simpa [dist_comm] using
      (mem_selectedClass.mp X.deleted_mem_fixedClass).2)
    rfl hsecond.symm

/-- The strongest row-local consequence of the both-strict endpoint branch.
No exact cardinality of the ambient first-apex class is assumed. -/
structure BothStrictBlockerCapPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) : Prop where
  source_strict :
    R.sourcePair.x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  deleted_strict :
    R.deleted ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  deletedBlocker_strict :
    H.centerAt R.deleted
        (mem_selectedClass.mp X.deleted_mem_fixedClass).1 ∈
      S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  deletedRow_inter_oppCap1_eq_pair :
    (H.selectedAt R.deleted
          (mem_selectedClass.mp X.deleted_mem_fixedClass).1).toCriticalFourShell.support ∩
        S.oppCap1 =
      ({R.deleted, R.sourcePair.x} : Finset ℝ²)
  deletedRow_sdiff_oppCap1_card_eq_two :
    ((H.selectedAt R.deleted
          (mem_selectedClass.mp X.deleted_mem_fixedClass).1).toCriticalFourShell.support \
        S.oppCap1).card = 2
  excludes_third_strict_source :
    ∀ z : ℝ²,
      z ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) →
      z ≠ R.deleted →
      z ≠ R.sourcePair.x →
      z ∉
        (H.selectedAt R.deleted
          (mem_selectedClass.mp X.deleted_mem_fixedClass).1).toCriticalFourShell.support
  source_deleted_secondApex_distance_ne :
    dist R.sourcePair.x S.oppApex2 ≠
      dist R.deleted S.oppApex2

/-- The cross-cap endpoint branch with the exact singleton first-apex fiber
and a concrete ordered realization of `oppCap2`. -/
structure CrossCapOrderedBoundaryPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) : Type where
  strictEndpoint : ℝ²
  exceptionalEndpoint : ℝ²
  orientation :
    (strictEndpoint = R.sourcePair.x ∧ exceptionalEndpoint = R.deleted) ∨
      (strictEndpoint = R.deleted ∧ exceptionalEndpoint = R.sourcePair.x)
  strictEndpoint_mem :
    strictEndpoint ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)
  exceptionalEndpoint_mem_oppCap2 :
    exceptionalEndpoint ∈ S.oppCap2
  exceptionalEndpoint_off_surplus :
    exceptionalEndpoint ∉ S.surplusCap
  exceptionalEndpoint_boundary_or_strict :
    exceptionalEndpoint = S.surplusApex ∨
      exceptionalEndpoint ∈ S.oppCap2 \ (S.surplusCap ∪ S.oppCap1)
  fixedFiber_inter_oppCap2 :
    (D.A.filter (fun z => dist z S.oppApex1 = radius) ∩ S.oppCap2) =
      ({exceptionalEndpoint} : Finset ℝ²)
  source_deleted_secondApex_distance_ne :
    dist R.sourcePair.x S.oppApex2 ≠
      dist R.deleted S.oppApex2
  m : ℕ
  L : Problem97.CGN.OrderedCap m
  Packet : Problem97.CGN.MecCapPacket D.A L
  Hside : Problem97.CGN.MinorCapSideHypotheses Packet
  Hord : Problem97.CGN.StrictCapOrder D.A L
  cap_image : Finset.univ.image L.points = S.oppCap2
  exceptionalRank : Fin m
  apexRank : Fin m
  exceptional_eq : L.points exceptionalRank = exceptionalEndpoint
  apex_eq : L.points apexRank = S.oppApex1
  ranks_ne : exceptionalRank ≠ apexRank
  strictEndpoint_outside_orderedCap :
    strictEndpoint ∉ Finset.univ.image L.points

private theorem bothStrictBlockerCapPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R)
    (hsourceStrict :
      R.sourcePair.x ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hdeletedStrict :
      R.deleted ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2)) :
    BothStrictBlockerCapPacket X := by
  let hdeletedA : R.deleted ∈ D.A :=
    (mem_selectedClass.mp X.deleted_mem_fixedClass).1
  let hsourceA : R.sourcePair.x ∈ D.A :=
    (mem_selectedClass.mp X.source_mem_fixedClass).1
  let deletedRow :=
    (H.selectedAt R.deleted hdeletedA).toCriticalFourShell
  have hdeletedBlockerNe :
      H.centerAt R.deleted hdeletedA ≠ S.oppApex1 := by
    exact actual_blocker_ne_of_deletion_survives
      H hdeletedA X.deleted_survives_firstApex
  have hfirst :
      dist S.oppApex1 R.deleted =
        dist S.oppApex1 R.sourcePair.x :=
    (mem_selectedClass.mp X.deleted_mem_fixedClass).2.trans
      (mem_selectedClass.mp X.source_mem_fixedClass).2.symm
  have hdeletedBlockerStrict :
      H.centerAt R.deleted hdeletedA ∈
        S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
    directed_cross_blocker_mem_strictOppCap1_of_ne_apex
      hdeletedA hsourceA R.source_ne_deleted.symm
      hdeletedStrict hsourceStrict hdeletedBlockerNe
      X.source_mem_deletedRow hfirst
  have hinterEq :
      deletedRow.support ∩ S.oppCap1 =
        ({R.deleted, R.sourcePair.x} : Finset ℝ²) := by
    let K := deletedRow.toSelectedFourClass
    have hcapEq := capByIndex_oppIndex1_eq_oppCap1 S
    have hinterLe : (K.support ∩ S.oppCap1).card ≤ 2 := by
      simpa only [hcapEq] using
        CapSelectedRowCounting.selectedFourClass_inter_capByIndex_card_le_two
          S D.convex S.oppIndex1 K
            (by simpa only [hcapEq] using
              (Finset.mem_sdiff.mp hdeletedBlockerStrict).1)
    have hpairSub :
        ({R.deleted, R.sourcePair.x} : Finset ℝ²) ⊆
          K.support ∩ S.oppCap1 := by
      intro z hz
      simp only [Finset.mem_insert, Finset.mem_singleton] at hz
      rcases hz with rfl | rfl
      · exact Finset.mem_inter.mpr
          ⟨deletedRow.q_mem_support, (Finset.mem_sdiff.mp hdeletedStrict).1⟩
      · exact Finset.mem_inter.mpr
          ⟨X.source_mem_deletedRow, (Finset.mem_sdiff.mp hsourceStrict).1⟩
    have hpairCard :
        ({R.deleted, R.sourcePair.x} : Finset ℝ²).card = 2 := by
      simp [R.source_ne_deleted.symm]
    symm
    apply Finset.eq_of_subset_of_card_le
    · simpa [K, deletedRow, CriticalFourShell.toSelectedFourClass] using hpairSub
    · rw [hpairCard]
      simpa [K, deletedRow, CriticalFourShell.toSelectedFourClass] using hinterLe
  have hsdiffCard :
      (deletedRow.support \ S.oppCap1).card = 2 := by
    have hinterCard : (deletedRow.support ∩ S.oppCap1).card = 2 := by
      rw [hinterEq]
      simp [R.source_ne_deleted.symm]
    have hsplit :
        (deletedRow.support ∩ S.oppCap1).card +
            (deletedRow.support \ S.oppCap1).card =
          deletedRow.support.card :=
      Finset.card_inter_add_card_sdiff deletedRow.support S.oppCap1
    rw [hinterCard, deletedRow.support_card] at hsplit
    omega
  refine {
    source_strict := hsourceStrict
    deleted_strict := hdeletedStrict
    deletedBlocker_strict := by
      simpa [hdeletedA] using hdeletedBlockerStrict
    deletedRow_inter_oppCap1_eq_pair := by
      simpa [deletedRow, hdeletedA] using hinterEq
    deletedRow_sdiff_oppCap1_card_eq_two := by
      simpa [deletedRow, hdeletedA] using hsdiffCard
    excludes_third_strict_source := ?_
    source_deleted_secondApex_distance_ne :=
      source_deleted_secondApex_distance_ne X }
  intro z hzStrict hzDeleted hzSource hzRow
  have hzInter :
      z ∈ deletedRow.support ∩ S.oppCap1 :=
    Finset.mem_inter.mpr
      ⟨by simpa [deletedRow, hdeletedA] using hzRow,
        (Finset.mem_sdiff.mp hzStrict).1⟩
  rw [hinterEq] at hzInter
  simp only [Finset.mem_insert, Finset.mem_singleton] at hzInter
  exact hzInter.elim hzDeleted hzSource

private theorem crossCapOrderedBoundaryPacket
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R)
    (strictEndpoint exceptionalEndpoint : ℝ²)
    (horientation :
      (strictEndpoint = R.sourcePair.x ∧ exceptionalEndpoint = R.deleted) ∨
        (strictEndpoint = R.deleted ∧ exceptionalEndpoint = R.sourcePair.x))
    (hstrict :
      strictEndpoint ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2))
    (hexceptionOpp2 : exceptionalEndpoint ∈ S.oppCap2) :
    Nonempty (CrossCapOrderedBoundaryPacket X) := by
  have hexceptionA : exceptionalEndpoint ∈ D.A := by
    rcases horientation with h | h
    · simpa [h.2] using (mem_selectedClass.mp X.deleted_mem_fixedClass).1
    · simpa [h.2] using (mem_selectedClass.mp X.source_mem_fixedClass).1
  have hexceptionClass :
      exceptionalEndpoint ∈ SelectedClass D.A S.oppApex1 radius := by
    rcases horientation with h | h
    · simpa [h.2] using X.deleted_mem_fixedClass
    · simpa [h.2] using X.source_mem_fixedClass
  have hexceptionOff : exceptionalEndpoint ∉ S.surplusCap := by
    rcases horientation with h | h
    · simpa [h.2] using X.deleted_off_surplus
    · simpa [h.2] using X.source_off_surplus
  have hexceptionBoundaryOrStrict :
      exceptionalEndpoint = S.surplusApex ∨
        exceptionalEndpoint ∈
          S.oppCap2 \ (S.surplusCap ∪ S.oppCap1) := by
    by_cases hexceptionOpp1 : exceptionalEndpoint ∈ S.oppCap1
    · left
      have hsingleton :=
        oppCap1_inter_oppCap2_subset_surplusApex S
          (Finset.mem_inter.mpr ⟨hexceptionOpp1, hexceptionOpp2⟩)
      simpa using hsingleton
    · right
      exact Finset.mem_sdiff.mpr
        ⟨hexceptionOpp2, by
          intro h
          rcases Finset.mem_union.mp h with hsurplus | hopp1
          · exact hexceptionOff hsurplus
          · exact hexceptionOpp1 hopp1⟩
  let DS : CounterexampleData :=
    { A := D.A
      nonempty := D.nonempty
      convex := D.convex
      K4 := D.K4
      packet := S }
  let fiber :=
    (D.A.filter (fun z => dist z S.oppApex1 = radius)) ∩ S.oppCap2
  have hexceptionFiber : exceptionalEndpoint ∈ fiber := by
    exact Finset.mem_inter.mpr
      ⟨Finset.mem_filter.mpr
        ⟨hexceptionA, by
          simpa [dist_comm] using
            (mem_selectedClass.mp hexceptionClass).2⟩,
        hexceptionOpp2⟩
  have hfiberSingleton :
      fiber = ({exceptionalEndpoint} : Finset ℝ²) := by
    apply Finset.eq_singleton_iff_unique_mem.mpr
    refine ⟨hexceptionFiber, ?_⟩
    intro z hz
    have hone := U2NonSurplusSqueeze.oppApex1_otherCap_one_hit DS radius
    rw [Finset.card_le_one] at hone
    exact hone z (by simpa [DS, fiber] using hz)
      exceptionalEndpoint (by simpa [DS, fiber] using hexceptionFiber)
  have hcapEq := capByIndex_oppIndex2_eq_oppCap2 S
  rcases S.capByIndex_cgn4g_capData D.convex S.oppIndex2 with
    ⟨m, L, Packet, Hside, Hord, hcap⟩
  have hcapImage : Finset.univ.image L.points = S.oppCap2 := by
    exact hcap.trans hcapEq
  have hexceptionImage :
      exceptionalEndpoint ∈ Finset.univ.image L.points := by
    rw [hcapImage]
    exact hexceptionOpp2
  have hapexImage : S.oppApex1 ∈ Finset.univ.image L.points := by
    rw [hcapImage]
    exact oppApex1_mem_oppCap2 S
  rcases Finset.mem_image.mp hexceptionImage with
    ⟨exceptionalRank, _hexceptionRank, hexceptionEq⟩
  rcases Finset.mem_image.mp hapexImage with
    ⟨apexRank, _hapexRank, hapexEq⟩
  have hranksNe : exceptionalRank ≠ apexRank := by
    intro h
    have heq : exceptionalEndpoint = S.oppApex1 := by
      calc
        exceptionalEndpoint = L.points exceptionalRank := hexceptionEq.symm
        _ = L.points apexRank := by rw [h]
        _ = S.oppApex1 := hapexEq
    exact hexceptionOff (heq ▸ oppApex1_mem_surplusCap S)
  refine ⟨{
    strictEndpoint := strictEndpoint
    exceptionalEndpoint := exceptionalEndpoint
    orientation := horientation
    strictEndpoint_mem := hstrict
    exceptionalEndpoint_mem_oppCap2 := hexceptionOpp2
    exceptionalEndpoint_off_surplus := hexceptionOff
    exceptionalEndpoint_boundary_or_strict := hexceptionBoundaryOrStrict
    fixedFiber_inter_oppCap2 := by
      simpa [fiber] using hfiberSingleton
    source_deleted_secondApex_distance_ne :=
      source_deleted_secondApex_distance_ne X
    m := m
    L := L
    Packet := Packet
    Hside := Hside
    Hord := Hord
    cap_image := hcapImage
    exceptionalRank := exceptionalRank
    apexRank := apexRank
    exceptional_eq := hexceptionEq
    apex_eq := hapexEq
    ranks_ne := hranksNe
    strictEndpoint_outside_orderedCap := ?_ }⟩
  simpa [hcapImage] using
    (fun hOpp2 =>
      (Finset.mem_sdiff.mp hstrict).2
        (Finset.mem_union.mpr (Or.inr hOpp2)))

/-- Exact endpoint classification of the terminal asymmetric residual.

The left branch contains the saturated selected-row packet.  The right branch
contains one strict endpoint and the unique ordered-`oppCap2` endpoint. -/
theorem ReciprocalDirectedCrossResidual.endpoint_cap_split
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius rho : ℝ}
    {T : FixedSingleRadiusTerminalHistory D S D.A radius}
    {P : AmbientRobustHistoryPair D S T.carrier rho}
    {H : CriticalShellSystem D.A}
    {R : CoherentRCommonDeletionPacket T P H}
    (X : ReciprocalDirectedCrossResidual R) :
    BothStrictBlockerCapPacket X ∨
      Nonempty (CrossCapOrderedBoundaryPacket X) := by
  by_cases hsourceOpp2 : R.sourcePair.x ∈ S.oppCap2
  · have hdeletedStrict :
        R.deleted ∈ S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) := by
      rcases X.source_or_deleted_mem_strictOppCap1 with
        hsourceStrict | hdeletedStrict
      · exact False.elim
          ((Finset.mem_sdiff.mp hsourceStrict).2
            (Finset.mem_union.mpr (Or.inr hsourceOpp2)))
      · exact hdeletedStrict
    exact Or.inr (crossCapOrderedBoundaryPacket
      X R.deleted R.sourcePair.x
      (Or.inr ⟨rfl, rfl⟩) hdeletedStrict hsourceOpp2)
  · have hsourceStrict :
        R.sourcePair.x ∈
          S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
      mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps S
        (mem_selectedClass.mp X.source_mem_fixedClass).1
        X.source_off_surplus hsourceOpp2
    by_cases hdeletedOpp2 : R.deleted ∈ S.oppCap2
    · exact Or.inr (crossCapOrderedBoundaryPacket
        X R.sourcePair.x R.deleted
        (Or.inl ⟨rfl, rfl⟩) hsourceStrict hdeletedOpp2)
    · have hdeletedStrict :
          R.deleted ∈
            S.oppCap1 \ (S.surplusCap ∪ S.oppCap2) :=
        mem_strictOppCap1_of_mem_A_of_not_mem_adjacentCaps S
          (mem_selectedClass.mp X.deleted_mem_fixedClass).1
          X.deleted_off_surplus hdeletedOpp2
      exact Or.inl
        (bothStrictBlockerCapPacket X hsourceStrict hdeletedStrict)

#print axioms source_deleted_secondApex_distance_ne
#print axioms ReciprocalDirectedCrossResidual.endpoint_cap_split

end ATailRTerminalCapSplitScratch
end Problem97
