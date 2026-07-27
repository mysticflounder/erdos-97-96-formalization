/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherMain

/-!
# A distinct good strict second-cap source

This file extracts a source distinct from the live retained source when the
physical second-apex radius class has at least four strict second-cap-interior
points.  It also records a distinct peer omitted from the extracted source's
actual late row.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem secondInterior_not_mem_surplusCap_distinctGoodSource
    {A : Finset ℝ²} (S : SurplusCapPacket A) {x : ℝ²}
    (hx : x ∈ S.capInteriorByIndex S.oppIndex2) :
    x ∉ S.surplusCap := by
  have hnot := S.capInteriorByIndex_not_mem_capByIndex_of_ne hx
    S.surplusIdx_ne_oppIndex2.symm
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simpa [SurplusCapPacket.capByIndex,
      SurplusCapPacket.surplusCap, hi] using hnot

private theorem exists_mem_avoiding_three_of_card_gt
    {α : Type*} (T X Y Z : Finset α)
    (hcard : X.card + Y.card + Z.card < T.card) :
    ∃ z ∈ T, z ∉ X ∧ z ∉ Y ∧ z ∉ Z := by
  classical
  by_contra hnone
  have hsubset : T ⊆ (X ∪ Y) ∪ Z := by
    intro z hz
    by_cases hx : z ∈ X
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr (Or.inl hx)))
    by_cases hy : z ∈ Y
    · exact Finset.mem_union.mpr (Or.inl (Finset.mem_union.mpr (Or.inr hy)))
    by_cases hzZ : z ∈ Z
    · exact Finset.mem_union.mpr (Or.inr hzZ)
    exact False.elim (hnone ⟨z, hz, hx, hy, hzZ⟩)
  have hle := Finset.card_le_card hsubset
  have hxy := Finset.card_union_le X Y
  have hxyz := Finset.card_union_le (X ∪ Y) Z
  omega

private theorem mem_outsideFirstApexFiber_of_not_mem_firstClass_distinctGoodSource
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A} {F : CriticalPairFrontier D S radius H}
    (R : OriginalUniqueFourResidual F)
    {source : CarrierVertex D.A}
    (hnot :
      source.1 ∉ SelectedClass D.A S.oppApex1 radius) :
    source ∈ outsideFirstApexFiber R := by
  apply Finset.mem_sdiff.mpr
  refine ⟨Finset.mem_univ _, ?_⟩
  intro hsourceFiber
  have hblockers := (Finset.mem_filter.mp hsourceFiber).2
  apply hnot
  apply
    (lateFirstApexSystem_centerAt_eq_iff_mem_class R source.2).mp
  calc
    (lateFirstApexSystem R).centerAt source.1 source.2 =
        (lateFirstApexSystem R).centerAt
          F.pair.q F.pair.q_mem_A :=
      congrArg Subtype.val hblockers
    _ = S.oppApex1 :=
      lateFirstApexSystem_centerAt_eq R F.pair.q_mem_A
        (frontier_pair_q_mem_firstApexClass F)

/-- Four strict second-cap-interior points leave a source distinct from the
live retained source after excluding the at-most-one first-class hit and the
at-most-one source for which both source-valid interior deletions fail.  The
five-point physical class then supplies a distinct peer omitted from the new
source's actual late row, with a different actual blocker. -/
theorem exactFourRigid221_exists_distinctGoodSource_with_omittedPeer
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hfour :
      4 ≤
        (SelectedClass D.A S.oppApex2 P.rho ∩
          S.capInteriorByIndex S.oppIndex2).card) :
    ∃ goodSource : CarrierVertex D.A,
      goodSource ≠ P.source ∧
      goodSource.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
      goodSource.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
      goodSource ∈ outsideFirstApexFiber R ∧
      (HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt
            goodSource.1 goodSource.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt
            goodSource.1 goodSource.2)) ∧
      ∃ peer : CarrierVertex D.A,
        peer ≠ goodSource ∧
        peer.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
        peer.1 ∈ S.capInteriorByIndex S.oppIndex2 ∧
        peer.1 ∉
          ((lateFirstApexSystem R).selectedAt
            goodSource.1 goodSource.2).toCriticalFourShell.support ∧
        (lateFirstApexSystem R).centerAt
            goodSource.1 goodSource.2 ≠
          (lateFirstApexSystem R).centerAt peer.1 peer.2 := by
  classical
  let secondInterior :=
    SelectedClass D.A S.oppApex2 P.rho ∩
      S.capInteriorByIndex S.oppIndex2
  let firstHit :=
    secondInterior.filter fun z =>
      z ∈ SelectedClass D.A S.oppApex1 radius
  let badSources :=
    (interiorPairBadOutsideSources R).filter fun source =>
      source.1 ∈ SelectedClass D.A S.oppApex2 P.rho ∧
        source.1 ∈ S.capInteriorByIndex S.oppIndex2
  let badPoints := badSources.image fun source => source.1
  let currentSourcePoint : Finset ℝ² := {P.source.1}
  have hfirstHit : firstHit.card ≤ 1 := by
    have hsubset :
        firstHit ⊆
          (((D.A.filter fun x => dist x S.oppApex1 = radius) \
              S.surplusCap).filter fun x =>
            x ∈ SelectedClass D.A S.oppApex2 P.rho) := by
      intro x hx
      rcases Finset.mem_filter.mp hx with ⟨hxInterior, hxFirst⟩
      rcases Finset.mem_inter.mp hxInterior with ⟨hxSecond, hxCapInterior⟩
      rcases mem_selectedClass.mp hxFirst with ⟨hxA, hxRadius⟩
      exact Finset.mem_filter.mpr ⟨
        Finset.mem_sdiff.mpr ⟨
          Finset.mem_filter.mpr
            ⟨hxA, by simpa only [dist_comm] using hxRadius⟩,
          secondInterior_not_mem_surplusCap_distinctGoodSource
            S hxCapInterior⟩,
        hxSecond⟩
    exact le_trans (Finset.card_le_card hsubset)
      (firstApex_marginal_inter_secondClass_card_le_one
        D S radius P.rho)
  have hbadPoints : badPoints.card ≤ 1 := by
    calc
      badPoints.card = badSources.card :=
        Finset.card_image_of_injective _ Subtype.val_injective
      _ ≤ 1 := by
        simpa [badSources] using
          interiorPairBad_secondClassInterior_card_le_one
            R P.surface.secondApex_robust (rho := P.rho)
  have hcurrentSourcePoint : currentSourcePoint.card ≤ 1 := by
    simp [currentSourcePoint]
  have hsmall :
      firstHit.card + badPoints.card + currentSourcePoint.card <
        secondInterior.card := by
    have hfour' : 4 ≤ secondInterior.card := by
      simpa [secondInterior] using hfour
    omega
  obtain ⟨z, hzInterior, hzFirstHit, hzBad, hzCurrent⟩ :=
    exists_mem_avoiding_three_of_card_gt
      secondInterior firstHit badPoints currentSourcePoint hsmall
  rcases Finset.mem_inter.mp hzInterior with
    ⟨hzSecond, hzCapInterior⟩
  have hzFirst :
      z ∉ SelectedClass D.A S.oppApex1 radius := by
    intro hzFirst
    exact hzFirstHit
      (Finset.mem_filter.mpr ⟨hzInterior, hzFirst⟩)
  have hzA : z ∈ D.A := (mem_selectedClass.mp hzSecond).1
  let goodSource : CarrierVertex D.A := ⟨z, hzA⟩
  have hgoodNe : goodSource ≠ P.source := by
    intro h
    apply hzCurrent
    have hzEq : z = P.source.1 := by
      simpa [goodSource] using congrArg Subtype.val h
    simp [currentSourcePoint, hzEq]
  have hgoodOutside : goodSource ∈ outsideFirstApexFiber R :=
    mem_outsideFirstApexFiber_of_not_mem_firstClass_distinctGoodSource R
      (by simpa [goodSource] using hzFirst)
  have hgoodNotBad :
      goodSource ∉ interiorPairBadOutsideSources R := by
    intro hsourceBad
    apply hzBad
    apply Finset.mem_image.mpr
    refine ⟨goodSource, ?_, rfl⟩
    exact Finset.mem_filter.mpr ⟨hsourceBad,
      by simpa [goodSource] using And.intro hzSecond hzCapInterior⟩
  have hgoodSurvival :
      HasNEquidistantPointsAt 4 (D.A.erase R.interior_q)
          ((lateFirstApexSystem R).centerAt
            goodSource.1 goodSource.2) ∨
        HasNEquidistantPointsAt 4 (D.A.erase R.interior_w)
          ((lateFirstApexSystem R).centerAt
            goodSource.1 goodSource.2) := by
    by_contra hnone
    push_neg at hnone
    exact hgoodNotBad
      (Finset.mem_filter.mpr ⟨hgoodOutside, hnone⟩)
  have hgoodRowBound :=
    actualLateRow_secondClassInterior_card_le_two
      R P.surface goodSource
        (by simpa [goodSource] using hzSecond)
        (by simpa [goodSource] using hzCapInterior)
  obtain ⟨peer, hpeerNe, hpeerClass, hpeerInterior,
      hpeerOmitted, hblockersNe⟩ :=
    exists_omittedSecondClassInteriorPeer
      R goodSource P.hrho P.hfive hgoodRowBound
  exact ⟨goodSource, hgoodNe,
    by simpa [goodSource] using hzSecond,
    by simpa [goodSource] using hzCapInterior,
    hgoodOutside, hgoodSurvival, peer, hpeerNe, hpeerClass,
    hpeerInterior, hpeerOmitted, hblockersNe⟩

#print axioms exactFourRigid221_exists_distinctGoodSource_with_omittedPeer

end ATailFrontierLiveClosure
end Problem97
