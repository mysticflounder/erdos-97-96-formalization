import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Isolated 4.27 check for first-fiber global-row overlap

This harness restates the three production helpers against the last built
`FrontierLiveClosure` interface, checks their exact live call shapes, and
prints their transitive axiom profiles.
-/

namespace Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal

open ATailCriticalPairFrontier
open ATailBlockerMultiplicityGeometry
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

variable
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)

theorem firstFiber_globalRow_inter_firstShell_card_le_two_scratch
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    (Kq.support ∩
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 := by
  have hcentersNe :
      Q.source.1 ≠ H.centerAt P.source₁ P.source₁_mem_A := by
    intro hcenters
    apply
      (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass.center_not_mem
    simpa [hcenters] using Q.source_mem_shell
  exact
    SelectedFourClass.inter_card_le_two Kq
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.toSelectedFourClass
      hcentersNe

theorem firstFiber_globalRow_sdiff_firstShell_card_ge_two_scratch
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    2 ≤
      (Kq.support \
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support).card := by
  have hinter :
      (Kq.support ∩
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 :=
    firstFiber_globalRow_inter_firstShell_card_le_two_scratch
      P Pρ Q Kq
  have hdecomp :=
    Finset.card_sdiff_add_card_inter Kq.support
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support
  rw [Kq.support_card] at hdecomp
  omega

theorem exists_two_firstFiber_globalRow_points_outside_firstShell_scratch
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (Kq : SelectedFourClass D.A Q.source.1) :
    ∃ u ∈
        Kq.support \
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support,
      ∃ v ∈
          Kq.support \
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support,
        u ≠ v := by
  apply Finset.one_lt_card.mp
  have htwo :=
    firstFiber_globalRow_sdiff_firstShell_card_ge_two_scratch
      P Pρ Q Kq
  omega

example
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (qGlobalRow : SelectedFourClass D.A Q.source.1) :
    (qGlobalRow.support ∩
      (H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support).card ≤ 2 :=
  firstFiber_globalRow_inter_firstShell_card_le_two_scratch
    P Pρ Q qGlobalRow

example
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (qGlobalRow : SelectedFourClass D.A Q.source.1) :
    2 ≤
      (qGlobalRow.support \
        (H.selectedAt P.source₁
          P.source₁_mem_A).toCriticalFourShell.support).card :=
  firstFiber_globalRow_sdiff_firstShell_card_ge_two_scratch
    P Pρ Q qGlobalRow

example
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (qGlobalRow : SelectedFourClass D.A Q.source.1) :
    ∃ u ∈
        qGlobalRow.support \
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support,
      ∃ v ∈
          qGlobalRow.support \
            (H.selectedAt P.source₁
              P.source₁_mem_A).toCriticalFourShell.support,
        u ≠ v :=
  exists_two_firstFiber_globalRow_points_outside_firstShell_scratch
    P Pρ Q qGlobalRow

#print axioms firstFiber_globalRow_inter_firstShell_card_le_two_scratch
#print axioms firstFiber_globalRow_sdiff_firstShell_card_ge_two_scratch
#print axioms exists_two_firstFiber_globalRow_points_outside_firstShell_scratch

end Problem97.ATailFrontierLiveClosure.TwoSourceExactCollisionRowsTerminal
