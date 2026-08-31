import Erdos9796Proof.P97.ATail.FrontierLiveClosure.Rigid221Placement

/-! Scratch compile check for the B3 next-blocker physical-class boundary. -/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry
open ATailCriticalPairFrontier
open ATailUniqueArmRouteAuditScratch
open ATailUniqueFourLateChoiceTerminalScratch

attribute [local instance] Classical.propDecidable

example
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : OriginalUniqueFourResidual F}
    (P : ExactFourRigid221PhysicalApexSourceEqUContext R)
    (hnextClass :
      (lateFirstApexSystem R).centerAt P.v.1 P.v.2 ∈
        SelectedClass D.A S.oppApex2 P.rho) :
    ∃ xu : ℝ²,
      xu ≠ P.u.1 ∧
        (((lateFirstApexSystem R).selectedAt
            P.u.1 P.u.2).toCriticalFourShell.support ∩
          SelectedClass D.A S.oppApex2 P.rho = {P.u.1, xu}) ∧
        ((lateFirstApexSystem R).centerAt P.v.1 P.v.2 =
            P.jointDeletion.deleted.1 ∨
          (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = P.u.1 ∨
          (lateFirstApexSystem R).centerAt P.v.1 P.v.2 = xu) := by
  classical
  let Ku :=
    ((lateFirstApexSystem R).selectedAt P.u.1 P.u.2).toCriticalFourShell
  let Kv :=
    ((lateFirstApexSystem R).selectedAt P.v.1 P.v.2).toCriticalFourShell
  let C := SelectedClass D.A S.oppApex2 P.rho
  let Iu := Ku.support ∩ C
  let Iv := Kv.support ∩ C
  let c := (lateFirstApexSystem R).centerAt P.v.1 P.v.2
  have hIuCard : Iu.card = 2 := by
    rcases P.globalDeletion.rigid with ⟨hcard, _hrest⟩
    simpa [Iu, Ku, C] using hcard
  have huIu : P.u.1 ∈ Iu := by
    exact Finset.mem_inter.mpr ⟨
      by simpa [Iu, Ku] using Ku.q_mem_support,
      by simpa [Iu, C] using P.huClass⟩
  have companion_of_card_two
      (J : Finset ℝ²) (q : ℝ²)
      (hJCard : J.card = 2) (hqJ : q ∈ J) :
      ∃ x : ℝ², x ≠ q ∧ J = {q, x} := by
    obtain ⟨a, b, hab, hJ⟩ := Finset.card_eq_two.mp hJCard
    have hqa : q = a ∨ q = b := by
      rw [hJ] at hqJ
      simpa only [Finset.mem_insert, Finset.mem_singleton] using hqJ
    rcases hqa with rfl | rfl
    · exact ⟨b, Ne.symm hab, hJ⟩
    · refine ⟨a, hab, ?_⟩
      rw [hJ]
      ext z
      simp only [Finset.mem_insert, Finset.mem_singleton]
      tauto
  obtain ⟨xu, hxuNe, hIuEq⟩ :=
    companion_of_card_two Iu P.u.1 hIuCard huIu
  refine ⟨xu, hxuNe, by simpa [Iu, Ku, C] using hIuEq, ?_⟩
  have hcNotKv : c ∉ Kv.support := by
    simpa [c, Kv] using Kv.center_not_mem_support
  have hcNotIv : c ∉ Iv := by
    intro hcIv
    exact hcNotKv (Finset.mem_inter.mp hcIv).1
  have hcover : C = insert P.jointDeletion.deleted.1 (Iu ∪ Iv) := by
    rcases P.globalDeletion.rigid with ⟨_hIuCard, _hIvCard, _hdisjoint, hcover⟩
    simpa [C, Iu, Iv, Ku, Kv] using hcover
  have hcC : c ∈ C := by
    simpa [c, C] using hnextClass
  rw [hcover] at hcC
  simp only [Finset.mem_insert, Finset.mem_union] at hcC
  rcases hcC with hdeleted | hIu | hIv
  · exact Or.inl (by simpa [c] using hdeleted)
  · rw [hIuEq] at hIu
    simp only [Finset.mem_insert, Finset.mem_singleton] at hIu
    rcases hIu with hu | hxu
    · exact Or.inr (Or.inl (by simpa [c] using hu))
    · exact Or.inr (Or.inr (by simpa [c] using hxu))
  · exact False.elim (hcNotIv hIv)

end ATailFrontierLiveClosure
end Problem97
