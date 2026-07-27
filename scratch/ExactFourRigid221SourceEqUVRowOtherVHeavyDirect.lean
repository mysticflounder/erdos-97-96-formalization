/-
Copyright (c) 2026 Adam McKenna. All rights reserved.
Released under Apache 2.0 license as described in the file LICENSE.
Authors: Adam McKenna
-/
import scratch.ExactFourRigid221SourceEqUVRowOtherCapGrowth
import scratch.ExactFourRigid221SourceEqUOtherArmsCloser

/-!
# Exact-four source-equals-u cross-row branch: direct v-heavy narrowing

This file keeps the complete production context and every field of the
`vHeavy` cap-shape constructor.  The already checked common-boundary theorem
puts both row-bisector orders on one apex-cut convex boundary.

When the physical second cap has exactly five points, its strict interior has
cardinality three.  The source `u` and both named `v`-row points already lie
there, so they exhaust the interior.  Hence the actual `v`-row blocker is
`u`; the retained peer is either `v` or the point `xv`; and the remaining
named source-row companion `xu` and the global deletion occupy opposite
adjacent caps.  Substituting the two blocker identities into the common
boundary gives one of the two reverse four-point orders

`v < u < xv < xu` or `xu < xv < u < v`.

The large-second-cap arm remains explicit in the retained robust cap profile.
No conditional closer or additional geometric assumption is introduced.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailCriticalPairFrontier
open ATailExactFourPhysicalConsumer
open ATailExactFourRobustCapExpansion
open ATailTwoCenterCapLocalization
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

private theorem oppApex2_eq_oppositeVertexByIndex_oppIndex2
    {A : Finset ℝ²} (S : SurplusCapPacket A) :
    S.oppApex2 = S.oppositeVertexByIndex S.oppIndex2 := by
  rcases hi : S.surplusIdx with ⟨i, hi3⟩
  interval_cases i <;>
    simp [SurplusCapPacket.oppApex2,
      SurplusCapPacket.oppositeVertexByIndex,
      SurplusCapPacket.oppIndex2, hi]

/-- Direct, source-clean narrowing of the `vHeavy` constructor.

Besides retaining the complete input packet, the conclusion records the
checked common boundary and robust cap profile.  The final implication is
the strict exact-five reduction: its conclusion is expressed directly,
without introducing a proposition-valued specification or a conditional
closer. -/
theorem exactFourRigid221_sourceEqU_blockerVRowOther_vHeavy_direct
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblockerVRow :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho)
    (hblockerNeV :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠ P.v.1)
    (xu xv : ℝ²)
    (terminal :
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv)
    (blocker_eq :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv)
    (pair_interior :
      ({P.v.1, xv} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.v.1, xv})
    (blocker_interior :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈
        S.capInteriorByIndex S.oppIndex2)
    (row_cap_trace :
      ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {P.v.1, xv}) :
    (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ∈
        ((lateFirstApexSystem R).selectedAt
            P.v.1 P.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho ∧
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 ≠
        P.v.1 ∧
      ExactFourRigid221SourceEqUTerminal
        R P.rho P.u P.other P.v P.jointDeletion
          P.globalDeletion xu xv ∧
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = xv ∧
      ({P.v.1, xv} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 =
        {P.v.1, xv} ∧
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈
        S.capInteriorByIndex S.oppIndex2 ∧
      ((lateFirstApexSystem R).selectedAt
          P.v.1 P.v.2).toCriticalFourShell.support ∩
        S.capByIndex S.oppIndex2 = {P.v.1, xv} ∧
      ExactFourRigid221SourceEqUVHeavyCommonBoundary
        R P.rho P.u P.v xu xv ∧
      ExactFourRigid221SourceEqUVRowOtherCapProfile S ∧
      (S.oppCap2.card = 5 →
        S.capInteriorByIndex S.oppIndex2 =
            {P.u.1, P.v.1, xv} ∧
          (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = P.u.1 ∧
          (P.other = P.v ∨ P.other.1 = xv) ∧
          ((xu ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
                P.jointDeletion.deleted.1 ∈
                  S.rightAdjacentCapByIndex S.oppIndex2) ∨
            (P.jointDeletion.deleted.1 ∈
                S.leftAdjacentCapByIndex S.oppIndex2 ∧
              xu ∈ S.rightAdjacentCapByIndex S.oppIndex2)) ∧
          ∃ (card_pos : 0 < D.A.card)
              (boundary : Fin D.A.card → ℝ²)
              (source_index xu_index v_index xv_index : Fin D.A.card),
            Function.Injective boundary ∧
            Finset.univ.image boundary = D.A ∧
            EuclideanGeometry.IsCcwConvexPolygon boundary ∧
            boundary (⟨0, card_pos⟩ : Fin D.A.card) = S.oppApex2 ∧
            boundary source_index = P.u.1 ∧
            boundary xu_index = xu ∧
            boundary v_index = P.v.1 ∧
            boundary xv_index = xv ∧
            ((v_index < source_index ∧
                source_index < xv_index ∧
                xv_index < xu_index) ∨
              (xu_index < xv_index ∧
                xv_index < source_index ∧
                source_index < v_index))) := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt
      P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt
      P.v.1 P.v.2).toCriticalFourShell
  have hblockerEqU :
      (lateFirstApexSystem R).centerAt P.u.1 P.u.2 = xv := by
    simpa [P.huSource] using blocker_eq
  have huUSupport : P.u.1 ∈ Ku.support := by
    simpa [Ku] using Ku.q_mem_support
  have hvVSupport : P.v.1 ∈ Kv.support := by
    simpa [Kv] using Kv.q_mem_support
  have huRowTrace :
      Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho =
        {P.u.1, xu} := by
    simpa [Ku] using terminal.named_rows.u_row_trace
  have hvRowTrace :
      Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho =
        {P.v.1, xv} := by
    simpa [Kv] using terminal.named_rows.v_row_trace
  have hxuUSupport : xu ∈ Ku.support := by
    have hmem :
        xu ∈ Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
      rw [huRowTrace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxuClass :
      xu ∈ SelectedClass D.A S.oppApex2 P.rho := by
    have hmem :
        xu ∈ Ku.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
      rw [huRowTrace]
      simp
    exact (Finset.mem_inter.mp hmem).2
  have hxvVSupport : xv ∈ Kv.support := by
    have hmem :
        xv ∈ Kv.support ∩ SelectedClass D.A S.oppApex2 P.rho := by
      rw [hvRowTrace]
      simp
    exact (Finset.mem_inter.mp hmem).1
  have hxvNotUSupport : xv ∉ Ku.support := by
    intro hxv
    have hmemEq :
        ((lateFirstApexSystem R).centerAt P.u.1 P.u.2 ∈ Ku.support) =
          (xv ∈ Ku.support) :=
      congrArg (fun z : ℝ² => z ∈ Ku.support) hblockerEqU
    exact Ku.center_not_mem_support (hmemEq.mpr hxv)
  have hcommon :
      ExactFourRigid221SourceEqUVHeavyCommonBoundary
        R P.rho P.u P.v xu xv :=
    exactFourRigid221_sourceEqU_vHeavy_commonBoundary
      terminal pair_interior blocker_interior row_cap_trace
  have hprofile :
      ExactFourRigid221SourceEqUVRowOtherCapProfile S :=
    exactFourRigid221_sourceEqU_blockerVRowOther_capProfile P
  refine
    ⟨hblockerVRow, hblockerNeV, terminal, blocker_eq,
      pair_interior, blocker_interior, row_cap_trace,
      hcommon, hprofile, ?_⟩
  intro hsecondFive
  have hinteriorCard :
      (S.capInteriorByIndex S.oppIndex2).card = 3 := by
    rcases hprofile with
        ⟨hsecondSix, _, _⟩ |
        ⟨_, hinteriorThree, _, _, _⟩ |
        ⟨_, hinteriorThree, _, _⟩
    · omega
    · exact hinteriorThree
    · exact hinteriorThree
  have huInterior :
      P.u.1 ∈ S.capInteriorByIndex S.oppIndex2 := by
    rw [P.huSource]
    exact P.context.source_mem_interior
  have hpairSubset :
      ({P.v.1, xv} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    have hzInter :
        z ∈ ({P.v.1, xv} : Finset ℝ²) ∩
          S.capInteriorByIndex S.oppIndex2 := by
      rw [pair_interior]
      exact hz
    exact (Finset.mem_inter.mp hzInter).2
  have huNeVPoint : P.u.1 ≠ P.v.1 := by
    intro h
    apply P.huNeV
    exact Subtype.ext h
  have hvNeXv : P.v.1 ≠ xv :=
    terminal.named_rows.xv_ne_v.symm
  have huNeXv : P.u.1 ≠ xv := by
    intro h
    apply P.huOmitted
    have : P.u.1 ∈ Kv.support := by
      rw [h]
      exact hxvVSupport
    simpa [Kv] using this
  have htripleSubset :
      ({P.u.1, P.v.1, xv} : Finset ℝ²) ⊆
        S.capInteriorByIndex S.oppIndex2 := by
    intro z hz
    simp only [Finset.mem_insert, Finset.mem_singleton] at hz
    rcases hz with rfl | rfl | rfl
    · exact huInterior
    · exact hpairSubset (by simp)
    · exact hpairSubset (by simp)
  have htripleCard :
      ({P.u.1, P.v.1, xv} : Finset ℝ²).card = 3 := by
    simp [huNeVPoint, huNeXv, hvNeXv]
  have hinteriorEq :
      S.capInteriorByIndex S.oppIndex2 =
        {P.u.1, P.v.1, xv} := by
    have hEq :
        ({P.u.1, P.v.1, xv} : Finset ℝ²) =
          S.capInteriorByIndex S.oppIndex2 :=
      Finset.eq_of_subset_of_card_le htripleSubset (by
        rw [hinteriorCard, htripleCard])
    exact hEq.symm
  have hvBlockerEqU :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = P.u.1 := by
    have hchoice :
        (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = P.u.1 ∨
          (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = P.v.1 ∨
          (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = xv := by
      rw [hinteriorEq] at blocker_interior
      simpa only [Finset.mem_insert, Finset.mem_singleton] using
        blocker_interior
    rcases hchoice with hu | hv | hxv
    · exact hu
    · have hmemEq :
          ((lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈
              Kv.support) =
            (P.v.1 ∈ Kv.support) :=
        congrArg (fun z : ℝ² => z ∈ Kv.support) hv
      exact
        (Kv.center_not_mem_support
          (hmemEq.mpr hvVSupport)).elim
    · have hmemEq :
          ((lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈
              Kv.support) =
            (xv ∈ Kv.support) :=
        congrArg (fun z : ℝ² => z ∈ Kv.support) hxv
      exact
        (Kv.center_not_mem_support
          (hmemEq.mpr hxvVSupport)).elim
  have hdeletedNotInterior :
      P.jointDeletion.deleted.1 ∉
        S.capInteriorByIndex S.oppIndex2 := by
    intro hdeletedInterior
    rw [hinteriorEq] at hdeletedInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hdeletedInterior
    rcases hdeletedInterior with hdu | hdv | hdxv
    · apply P.jointDeletion.deleted_ne_u
      exact Subtype.ext hdu
    · apply P.jointDeletion.deleted_ne_v
      exact Subtype.ext hdv
    · apply P.jointDeletion.deleted_not_mem_vRow
      have : P.jointDeletion.deleted.1 ∈ Kv.support := by
        rw [hdxv]
        exact hxvVSupport
      simpa [Kv] using this
  have hotherPlacement :
      P.other = P.v ∨ P.other.1 = xv := by
    rcases terminal.other_placement with
        ⟨_, hdeletedInterior⟩ |
        ⟨hotherEq, _⟩ |
        ⟨hotherPointEq, _⟩
    · exact (hdeletedNotInterior hdeletedInterior).elim
    · exact Or.inl hotherEq
    · exact Or.inr hotherPointEq
  have hxuNotInterior :
      xu ∉ S.capInteriorByIndex S.oppIndex2 := by
    intro hxuInterior
    rw [hinteriorEq] at hxuInterior
    simp only [Finset.mem_insert, Finset.mem_singleton] at hxuInterior
    rcases hxuInterior with hxu | hxv | hxxv
    · exact terminal.named_rows.xu_ne_u hxu
    · apply P.hvOmitted
      have : P.v.1 ∈ Ku.support := by
        rw [← hxv]
        exact hxuUSupport
      simpa [Ku] using this
    · apply hxvNotUSupport
      rw [← hxxv]
      exact hxuUSupport
  have houtsideAdjacentOrientation :
      (xu ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) ∨
        (P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∧
          xu ∈ S.rightAdjacentCapByIndex S.oppIndex2) := by
    let T :=
      SelectedClass D.A
        (S.oppositeVertexByIndex S.oppIndex2) P.rho
    have hcenter :
        S.oppApex2 =
          S.oppositeVertexByIndex S.oppIndex2 :=
      oppApex2_eq_oppositeVertexByIndex_oppIndex2 S
    have hleftOne :
        (T ∩ S.leftAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.leftAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hrightOne :
        (T ∩ S.rightAdjacentCapByIndex S.oppIndex2).card ≤ 1 := by
      simpa [T] using
        S.rightAdjacentCap_at_opposite_card_le_one_of_convexIndep
          D.convex S.oppIndex2 P.rho
    have hcover :
        T \ S.capInteriorByIndex S.oppIndex2 ⊆
          (T ∩ S.leftAdjacentCapByIndex S.oppIndex2) ∪
            (T ∩ S.rightAdjacentCapByIndex S.oppIndex2) := by
      simpa [T] using
        S.selectedClass_sdiff_capInteriorByIndex_subset_adjacentCaps
          S.oppIndex2 P.hrho
    have hxuT : xu ∈ T := by
      simpa [T, ← hcenter] using hxuClass
    have hdeletedT : P.jointDeletion.deleted.1 ∈ T := by
      simpa [T, ← hcenter] using
        P.jointDeletion.deleted_mem_class
    have hxuOutside :
        xu ∈ T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hxuT, hxuNotInterior⟩
    have hdeletedOutside :
        P.jointDeletion.deleted.1 ∈
          T \ S.capInteriorByIndex S.oppIndex2 :=
      Finset.mem_sdiff.mpr ⟨hdeletedT, hdeletedNotInterior⟩
    have hxuLocation :
        xu ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∨
          xu ∈ S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hxuOutside) with hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hdeletedLocation :
        P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2 ∨
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2 := by
      rcases Finset.mem_union.mp (hcover hdeletedOutside) with
          hleft | hright
      · exact Or.inl (Finset.mem_inter.mp hleft).2
      · exact Or.inr (Finset.mem_inter.mp hright).2
    have hxuNeDeleted :
        xu ≠ P.jointDeletion.deleted.1 := by
      intro h
      apply P.jointDeletion.deleted_not_mem_uRow
      have : P.jointDeletion.deleted.1 ∈ Ku.support := by
        rw [← h]
        exact hxuUSupport
      simpa [Ku] using this
    have hnotBothLeft :
        ¬ (xu ∈ S.leftAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.leftAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hxuLeft, hdeletedLeft⟩
      have hpairSubset :
          ({xu, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.leftAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hxuT, hxuLeft⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedLeft⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({xu, P.jointDeletion.deleted.1} : Finset ℝ²).card = 2 := by
        simp [hxuNeDeleted]
      omega
    have hnotBothRight :
        ¬ (xu ∈ S.rightAdjacentCapByIndex S.oppIndex2 ∧
          P.jointDeletion.deleted.1 ∈
            S.rightAdjacentCapByIndex S.oppIndex2) := by
      rintro ⟨hxuRight, hdeletedRight⟩
      have hpairSubset :
          ({xu, P.jointDeletion.deleted.1} : Finset ℝ²) ⊆
            T ∩ S.rightAdjacentCapByIndex S.oppIndex2 := by
        intro z hz
        simp only [Finset.mem_insert, Finset.mem_singleton] at hz
        rcases hz with rfl | rfl
        · exact Finset.mem_inter.mpr ⟨hxuT, hxuRight⟩
        · exact Finset.mem_inter.mpr ⟨hdeletedT, hdeletedRight⟩
      have hpairLe := Finset.card_le_card hpairSubset
      have hpairCard :
          ({xu, P.jointDeletion.deleted.1} : Finset ℝ²).card = 2 := by
        simp [hxuNeDeleted]
      omega
    rcases hxuLocation with hxuLeft | hxuRight <;>
      rcases hdeletedLocation with hdeletedLeft | hdeletedRight
    · exact (hnotBothLeft ⟨hxuLeft, hdeletedLeft⟩).elim
    · exact Or.inl ⟨hxuLeft, hdeletedRight⟩
    · exact Or.inr ⟨hdeletedLeft, hxuRight⟩
    · exact (hnotBothRight ⟨hxuRight, hdeletedRight⟩).elim
  have hboundaryChain :
      ∃ (card_pos : 0 < D.A.card)
          (boundary : Fin D.A.card → ℝ²)
          (source_index xu_index v_index xv_index : Fin D.A.card),
        Function.Injective boundary ∧
        Finset.univ.image boundary = D.A ∧
        EuclideanGeometry.IsCcwConvexPolygon boundary ∧
        boundary (⟨0, card_pos⟩ : Fin D.A.card) = S.oppApex2 ∧
        boundary source_index = P.u.1 ∧
        boundary xu_index = xu ∧
        boundary v_index = P.v.1 ∧
        boundary xv_index = xv ∧
        ((v_index < source_index ∧
            source_index < xv_index ∧
            xv_index < xu_index) ∨
          (xu_index < xv_index ∧
            xv_index < source_index ∧
            source_index < v_index)) := by
    rcases hcommon with
      ⟨hcard, boundary, sourceBlockerIndex, sourceIndex, xuIndex,
        vBlockerIndex, vIndex, xvIndex, hinj, himage, hccw, hzero,
        hsourceBlocker, hsource, hxu, hsourceBetween,
        hvBlocker, hv, hxv, hvBetween, _, _, _, _, _⟩
    have hsourceBlockerIndex :
        sourceBlockerIndex = xvIndex := by
      apply hinj
      calc
        boundary sourceBlockerIndex =
            (lateFirstApexSystem R).centerAt P.u.1 P.u.2 :=
          hsourceBlocker
        _ = xv := hblockerEqU
        _ = boundary xvIndex := hxv.symm
    have hvBlockerIndex :
        vBlockerIndex = sourceIndex := by
      apply hinj
      calc
        boundary vBlockerIndex =
            (lateFirstApexSystem R).centerAt P.v.1 P.v.2 :=
          hvBlocker
        _ = P.u.1 := hvBlockerEqU
        _ = boundary sourceIndex := hsource.symm
    rw [hsourceBlockerIndex] at hsourceBetween
    rw [hvBlockerIndex] at hvBetween
    have hchain :
        (vIndex < sourceIndex ∧
            sourceIndex < xvIndex ∧
            xvIndex < xuIndex) ∨
          (xuIndex < xvIndex ∧
            xvIndex < sourceIndex ∧
            sourceIndex < vIndex) := by
      rcases hsourceBetween with hforward | hreverse <;>
        rcases hvBetween with hvforward | hvreverse
      · exact Or.inl ⟨hvforward.1, hforward.1, hforward.2⟩
      · omega
      · omega
      · exact Or.inr ⟨hreverse.1, hreverse.2, hvreverse.2⟩
    exact
      ⟨hcard, boundary, sourceIndex, xuIndex, vIndex, xvIndex,
        hinj, himage, hccw, hzero, hsource, hxu, hv, hxv, hchain⟩
  exact
    ⟨hinteriorEq, hvBlockerEqU, hotherPlacement,
      houtsideAdjacentOrientation, hboundaryChain⟩

#print axioms
  exactFourRigid221_sourceEqU_blockerVRowOther_vHeavy_direct

end ATailFrontierLiveClosure
end Problem97
