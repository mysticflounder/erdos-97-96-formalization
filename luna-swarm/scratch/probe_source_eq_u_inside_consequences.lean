import Erdos9796Proof.P97.ATail.FrontierLiveClosure.B1ExactFiveSourceBlockerOutcome

/-! Source-clean consequences of the two source-equals-`u` inside-placement
arms.  These probes intentionally stop before any open rigid terminal. -/

namespace Problem97.ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch
open ATailExactFourPhysicalConsumer
open Census554.GeneralCarrierBridge

attribute [local instance] Classical.propDecidable

theorem probe_sourceEqU_blockerDeleted_no_row_collision
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    {G : B1FullGeometricCoupledSourceResidual C}
    (P : B1ExactFiveSourceEqUBlockerInsideResidual C G)
    (_hblocker :
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 =
        G.jointDeletion.deleted.1) :
    G.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem C.R).selectedAt
          G.source.1 G.source.2).toCriticalFourShell.support ∧
      G.jointDeletion.deleted.1 ∉
        ((lateFirstApexSystem C.R).selectedAt
          G.v.1 G.v.2).toCriticalFourShell.support := by
  have hcenterEq :
      (lateFirstApexSystem C.R).centerAt G.u.1 G.u.2 =
        (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 :=
    congrArg (fun x : CarrierVertex D.A =>
      (lateFirstApexSystem C.R).centerAt x.1 x.2) P.parent.u_eq_source
  have hU := G.jointDeletion.deleted_not_mem_uRow
  have hU' : G.jointDeletion.deleted.1 ∉
      ((lateFirstApexSystem C.R).selectedAt
        G.source.1 G.source.2).toCriticalFourShell.support := by
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem C.R) G.u.2 G.source.2 hcenterEq
    rw [← hsupports]
    exact hU
  exact ⟨hU', G.jointDeletion.deleted_not_mem_vRow⟩

theorem probe_sourceEqU_vRow_inside_exact_slice
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {C : B1GlobalTransportContext (D := D) (S := S) (radius := radius)
      (H := H) (F := F)}
    {G : B1FullGeometricCoupledSourceResidual C}
    (P : B1ExactFiveSourceEqUBlockerInsideResidual C G)
    (hblockerVRow :
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∈
        ((lateFirstApexSystem C.R).selectedAt
            G.v.1 G.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 C.rho) :
      G.jointDeletion.deleted.1 ≠
        (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∧
      (((lateFirstApexSystem C.R).selectedAt
          G.source.1 G.source.2).toCriticalFourShell.support ∩
        SelectedClass D.A S.oppApex2 C.rho) ∩
        (((lateFirstApexSystem C.R).selectedAt
            G.v.1 G.v.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 C.rho) = ∅ ∧
      dist ((lateFirstApexSystem C.R).centerAt G.v.1 G.v.2)
          ((lateFirstApexSystem C.R).centerAt G.source.1 G.source.2) =
        dist ((lateFirstApexSystem C.R).centerAt G.v.1 G.v.2) G.v.1 ∧
      ((lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ≠ G.v.1 →
        ((lateFirstApexSystem C.R).selectedAt G.v.1 G.v.2).toCriticalFourShell.support ∩
            SelectedClass D.A S.oppApex2 C.rho =
          {G.v.1, (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2}) := by
  let Hlate := lateFirstApexSystem C.R
  have hcenterEq :
      (lateFirstApexSystem C.R).centerAt G.u.1 G.u.2 =
        (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 :=
    congrArg (fun x : CarrierVertex D.A =>
      (lateFirstApexSystem C.R).centerAt x.1 x.2) P.parent.u_eq_source
  let Iu :=
    (Hlate.selectedAt G.source.1 G.source.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 C.rho
  let Iv :=
    (Hlate.selectedAt G.v.1 G.v.2).toCriticalFourShell.support ∩
      SelectedClass D.A S.oppApex2 C.rho
  have hdisjoint : Disjoint Iu Iv := by
    rcases P.parent.globalDeletion.rigid with
      ⟨_hIuCard, _hIvCard, hdisjoint, _hcover⟩
    have hsupports :=
      ATailSurvivalCover.selectedSupports_eq_of_actualBlockers_eq
        (lateFirstApexSystem C.R) G.u.2 G.source.2 hcenterEq
    simpa [Iu, Iv, Hlate, hsupports] using hdisjoint
  have hblockerIv :
      (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 ∈ Iv := by
    simpa [Iu, Iv, Hlate] using hblockerVRow
  have hdeletedNeBlocker :
      G.jointDeletion.deleted.1 ≠
        (lateFirstApexSystem C.R).centerAt G.source.1 G.source.2 := by
    intro h
    apply G.jointDeletion.deleted_not_mem_vRow
    simpa [h] using (Finset.mem_inter.mp hblockerVRow).1
  have hvSupport :=
    (lateFirstApexSystem C.R).selectedAt G.v.1 G.v.2
      |>.toCriticalFourShell.q_mem_support
  have hdist :
      dist ((lateFirstApexSystem C.R).centerAt G.v.1 G.v.2)
          ((lateFirstApexSystem C.R).centerAt G.source.1 G.source.2) =
        dist ((lateFirstApexSystem C.R).centerAt G.v.1 G.v.2) G.v.1 := by
    exact
      ((lateFirstApexSystem C.R).selectedAt G.v.1 G.v.2
        |>.toCriticalFourShell.support_eq_radius
          ((lateFirstApexSystem C.R).centerAt G.source.1 G.source.2)
          (Finset.mem_inter.mp hblockerVRow).1).trans
      ((lateFirstApexSystem C.R).selectedAt G.v.1 G.v.2
        |>.toCriticalFourShell.support_eq_radius
          G.v.1 hvSupport).symm
  have hIvCard : Iv.card = 2 := by
    rcases P.parent.globalDeletion.rigid with
      ⟨_hIuCard, hIvCard, _hdisjoint, _hcover⟩
    simpa [Iv, Hlate] using hIvCard
  have hvIv : G.v.1 ∈ Iv := by
    exact Finset.mem_inter.mpr ⟨hvSupport, G.v_mem_class⟩
  refine ⟨hdeletedNeBlocker, ?_, hdist, ?_⟩
  ext x
  constructor
  · intro hx
    exact (Finset.disjoint_left.mp hdisjoint
      (Finset.mem_inter.mp hx).1 (Finset.mem_inter.mp hx).2).elim
  · simp
  intro hcNeV
  refine (Finset.eq_of_subset_of_card_le ?_ ?_).symm
  · intro x hx
    simp only [Finset.mem_insert, Finset.mem_singleton] at hx
    rcases hx with rfl | rfl
    · exact hvIv
    · exact hblockerIv
  · rw [hIvCard]
    have hvNot : G.v.1 ∉
        ({(lateFirstApexSystem C.R).centerAt G.source.1 G.source.2} : Finset _) := by
      simp [Ne.symm hcNeV]
    rw [Finset.card_insert_of_notMem hvNot]
    simp

end Problem97.ATailFrontierLiveClosure

#print axioms
  Problem97.ATailFrontierLiveClosure.probe_sourceEqU_blockerDeleted_no_row_collision
#print axioms
  Problem97.ATailFrontierLiveClosure.probe_sourceEqU_vRow_inside_exact_slice
