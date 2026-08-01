import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Second strict-cap outside-pair bridge probe

This scratch file checks the exact one-equation consumer left by the live
first-fiber deletion branch.
-/

namespace Problem97
namespace ATailFrontierLiveClosure

open scoped EuclideanGeometry

open ATailBlockerMultiplicityGeometry
open ATailCriticalPairFrontier
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- Scratch-only public reconstruction of the private indexed-cap adapter in
`ATailFirstFiberOverlapDescent`. -/
theorem false_of_two_cap_centers_bisect_outside_pair_probe
    {D : CounterexampleData} (S : SurplusCapPacket D.A) (k : Fin 3)
    {c d a b : ℝ²}
    (hcCap : c ∈ S.capByIndex k)
    (hdCap : d ∈ S.capByIndex k)
    (hcd : c ≠ d)
    (haA : a ∈ D.A) (hbA : b ∈ D.A) (hab : a ≠ b)
    (haOff : a ∉ S.capByIndex k) (hbOff : b ∉ S.capByIndex k)
    (hcEq : dist c a = dist c b)
    (hdEq : dist d a = dist d b) :
    False := by
  classical
  rcases S.capByIndex_cgn4g_capData D.convex k with
    ⟨m, L, Packet, _Hside, Hord, hcap⟩
  have hcImage : c ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hcCap
  have hdImage : d ∈ Finset.univ.image L.points := by
    rw [hcap]
    exact hdCap
  rcases Finset.mem_image.mp hcImage with ⟨ic, _hic, hic⟩
  rcases Finset.mem_image.mp hdImage with ⟨id, _hid, hid⟩
  have hic_ne_id : ic ≠ id := by
    intro h
    apply hcd
    calc
      c = L.points ic := hic.symm
      _ = L.points id := by simp [h]
      _ = d := hid
  have haOutside : a ∉ Finset.univ.image L.points := by
    simpa [hcap] using haOff
  have hbOutside : b ∉ Finset.univ.image L.points := by
    simpa [hcap] using hbOff
  rcases lt_or_gt_of_ne hic_ne_id with hlt | hgt
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hlt haA hbA haOutside hbOutside hab
      (by simpa [hic] using hcEq)
      (by simpa [hid] using hdEq)
  · exact CapSelectedRowCounting.outsidePair_unique_capCenter
      D.convex Hord Packet.mem_A hgt haA hbA haOutside hbOutside hab
      (by simpa [hid] using hdEq)
      (by simpa [hic] using hcEq)

/-- The exact one-equation bridge from the live first-fiber data to the
ordered-cap terminal. -/
theorem false_of_firstFiber_secondBlocker_bisects_outsidePair_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (Q : FreshOutsideFirstBlockerFiber P Pρ)
    (hblockersNe :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ≠
        H.centerAt P.source₁ P.source₁_mem_A)
    (hsecondEq :
      dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A) Q.source.1 =
        dist (H.centerAt Pρ.source₁ Pρ.source₁_mem_A)
          Q.otherOutsidePoint) :
    False := by
  have hsecondCenterCap :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      Pρ.blocker_mem_capInterior
  have hfirstCenterCap :
      H.centerAt P.source₁ P.source₁_mem_A ∈
        S.capByIndex S.oppIndex1 :=
    S.capInteriorByIndex_subset_capByIndex S.oppIndex1
      P.blocker_mem_capInterior
  have hfirstEq :
      dist (H.centerAt P.source₁ P.source₁_mem_A) Q.source.1 =
        dist (H.centerAt P.source₁ P.source₁_mem_A)
          Q.otherOutsidePoint :=
    ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.source.1 Q.source_mem_shell).trans
      ((H.selectedAt P.source₁
        P.source₁_mem_A).toCriticalFourShell.support_eq_radius
      Q.otherOutsidePoint Q.otherOutsidePoint_mem_shell).symm
  exact false_of_two_cap_centers_bisect_outside_pair_probe
    S S.oppIndex1 hsecondCenterCap hfirstCenterCap hblockersNe
    Q.source.2 Q.otherOutsidePoint_mem_A
    Q.otherOutsidePoint_ne_source.symm
    Q.source_not_mem_firstCap Q.otherOutsidePoint_not_mem_firstCap
    hsecondEq hfirstEq

/-- What the five-center residual projects to on the three canonical selected
rows: in every arm, the deleted collision endpoint is omitted by the source
row and by the opposite collision-blocker row. -/
theorem collisionFiveCenterDeletion_projects_to_omissions_probe
    {D : CounterexampleData} {S : SurplusCapPacket D.A}
    {radius ρ : ℝ} {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (source : CriticalShellSystem.CarrierVertex D.A)
    {a₂ a₃ : ℝ²}
    (hdeletion :
      ATailFirstFiberOverlapDescent.FirstFiberCollisionFiveCenterDeletionResidual
        P Pρ source a₂ a₃) :
    (P.source₁ ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
        P.source₁ ∉
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
      (Pρ.source₁ ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
        Pρ.source₁ ∉
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support) ∨
      (P.source₂ ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
        P.source₂ ∉
          (H.selectedAt Pρ.source₁
            Pρ.source₁_mem_A).toCriticalFourShell.support) ∨
      (Pρ.source₂ ∉
          (H.selectedAt source.1 source.2).toCriticalFourShell.support ∧
        Pρ.source₂ ∉
          (H.selectedAt P.source₁
            P.source₁_mem_A).toCriticalFourShell.support) := by
  rcases hdeletion with hP₁ | hPρ₁ | hP₂ | hPρ₂
  · exact Or.inl
      ⟨(cross_deletion_survives_iff_not_mem_selected_support
          H source.2).1 hP₁.1,
        (cross_deletion_survives_iff_not_mem_selected_support
          H Pρ.source₁_mem_A).1 hP₁.2.2.1⟩
  · exact Or.inr (Or.inl
      ⟨(cross_deletion_survives_iff_not_mem_selected_support
          H source.2).1 hPρ₁.1,
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).1 hPρ₁.2.2.1⟩)
  · exact Or.inr (Or.inr (Or.inl
      ⟨(cross_deletion_survives_iff_not_mem_selected_support
          H source.2).1 hP₂.1,
        (cross_deletion_survives_iff_not_mem_selected_support
          H Pρ.source₁_mem_A).1 hP₂.2.2.1⟩))
  · exact Or.inr (Or.inr (Or.inr
      ⟨(cross_deletion_survives_iff_not_mem_selected_support
          H source.2).1 hPρ₂.1,
        (cross_deletion_survives_iff_not_mem_selected_support
          H P.source₁_mem_A).1 hPρ₂.2.2.1⟩))

#print axioms false_of_firstFiber_secondBlocker_bisects_outsidePair_probe
#print axioms collisionFiveCenterDeletion_projects_to_omissions_probe

end ATailFrontierLiveClosure
end Problem97
