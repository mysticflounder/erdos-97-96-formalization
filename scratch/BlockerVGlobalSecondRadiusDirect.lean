import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Direct audit of the blocker-`v` global second-radius route

Under `hblocker`, the proposed second-radius witness after erasing `source`
is not an available route to the blocker-`v` terminal: it is exactly a
`no_qfree_at` contradiction.  Global `K4` supplies the witness only
disjunctively, with an exact-four ambient class through `source` as the
uneliminated alternative.
-/

namespace Problem97.ATailFrontierLiveClosure

open ATailCriticalPairFrontier
open ATailUniqueFourLateChoiceTerminalScratch

theorem blockerV_no_sourceDeletion_secondRadius
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    ¬ ∃ tau : ℝ, 0 < tau ∧
      4 ≤ (SelectedClass (D.A.erase P.source.1) P.v.1 tau).card := by
  rintro ⟨tau, htau, hfour⟩
  apply (lateFirstApexSystem R).no_qfree_at P.source.1 P.source.2
  rw [hblocker]
  exact ⟨tau, htau, by simpa [SelectedClass] using hfour⟩

theorem blockerV_globalK4_exact_source_pin
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    ∃ tau : ℝ, 0 < tau ∧
      (SelectedClass D.A P.v.1 tau).card = 4 ∧
      P.source.1 ∈ SelectedClass D.A P.v.1 tau := by
  have hsourceNeV : P.source ≠ P.v := by
    simpa [P.huSource] using P.huNeV
  have hvNeSource : P.v.1 ≠ P.source.1 := by
    intro h
    exact hsourceNeV (Subtype.ext h.symm)
  have hvErase : P.v.1 ∈ D.A.erase P.source.1 :=
    Finset.mem_erase.mpr ⟨hvNeSource, P.v.2⟩
  rcases selectedClass_erase_witness_or_exact_erased_pin D.K4 hvErase with
    hwitness | hpin
  · exact (blockerV_no_sourceDeletion_secondRadius P hblocker hwitness).elim
  · exact hpin

theorem blockerV_crossDeletion_center_is_not_v
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hblocker :
      (lateFirstApexSystem R).centerAt P.source.1 P.source.2 = P.v.1) :
    (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ≠ P.v.1 := by
  intro hvCenter
  have hne := P.jointDeletion.blockers_ne
  rw [P.huSource, hblocker, hvCenter] at hne
  exact hne rfl

theorem blockerV_globalDeletion_restores_at_physical_apex
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : ATailUniqueArmRouteAuditScratch.OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R) :
    ∀ s ∈ P.globalDeletion.deleted,
      HasNEquidistantPointsAt 4
        (D.A \ P.globalDeletion.deleted.erase s) S.oppApex2 := by
  intro s hs
  simpa only [P.hcenter] using P.globalDeletion.restores s hs

end Problem97.ATailFrontierLiveClosure
