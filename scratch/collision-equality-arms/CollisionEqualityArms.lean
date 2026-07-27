import Erdos9796Proof.P97.ATail.FrontierLiveClosure

/-!
# Collision equality arms

Scratch audit of the four blocker/source equality alternatives in the live
two-source-exact-collision-row frontier.
-/

open scoped EuclideanGeometry

namespace Problem97
namespace CollisionEqualityArms

open ATailCommonDeletionTwoCenter
open ATailCriticalPairFrontier
open ATailLocalizedCollisionMutualOmissionCycle
open ATailOrientedPhysicalApexIngress
open ATailRetainedStrictInteriorPairSelector

attribute [local instance] Classical.propDecidable

/-- The first blocker/source equality makes the corresponding requested cross hit
impossible: it identifies that point with the center of the target shell. -/
theorem first_eq_source₁_implies_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h :
      H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₁) :
    Pρ.source₁ ∉
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
  rw [← h]
  exact
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.center_not_mem_support

/-- The second blocker/source equality also identifies the proposed hit with the
center of the target shell. -/
theorem first_eq_source₂_implies_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h :
      H.centerAt P.source₁ P.source₁_mem_A = Pρ.source₂) :
    Pρ.source₂ ∉
      (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support := by
  rw [← h]
  exact
    (H.selectedAt P.source₁
      P.source₁_mem_A).toCriticalFourShell.center_not_mem_support

/-- The reverse first blocker/source equality identifies the proposed hit with the
center of the reverse target shell. -/
theorem reverse_eq_source₁_implies_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₁) :
    P.source₁ ∉
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
  rw [← h]
  exact
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support

/-- The reverse second blocker/source equality likewise excludes the corresponding
requested cross hit. -/
theorem reverse_eq_source₂_implies_not_mem
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (h :
      H.centerAt Pρ.source₁ Pρ.source₁_mem_A = P.source₂) :
    P.source₂ ∉
      (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
  rw [← h]
  exact
    (H.selectedAt Pρ.source₁
      Pρ.source₁_mem_A).toCriticalFourShell.center_not_mem_support

private def qDeletedK4ClassToSelectedFourClass
    {D : CounterexampleData} {q center : ℝ²} {B : Finset ℝ²}
    (K : U5QDeletedK4Class D q center B)
    (hcard : B.card = 4) :
    SelectedFourClass D.A center where
  support := B
  support_subset_A := by
    intro y hy
    have hyErase : y ∈ (D.skeleton q).erase center := K.subset hy
    have hySkeleton : y ∈ D.skeleton q := (Finset.mem_erase.mp hyErase).2
    exact (Finset.mem_erase.mp hySkeleton).2
  support_card := hcard
  radius := K.radius
  radius_pos := K.radius_pos
  support_eq_radius := K.same_radius
  center_not_mem := by
    intro hcenter
    exact (Finset.mem_erase.mp (K.subset hcenter)).1 rfl

private theorem qDeletedK4Class_support_eq_selectedShell
    {D : CounterexampleData} {H : CriticalShellSystem D.A}
    {source deleted : ℝ²} {B : Finset ℝ²}
    (hsource : source ∈ D.A)
    (K :
      U5QDeletedK4Class D deleted (H.centerAt source hsource) B)
    (hcard : B.card = 4) :
    B = (H.selectedAt source hsource).toCriticalFourShell.support := by
  exact H.selectedFourClass_support_eq_shell source hsource
    (qDeletedK4ClassToSelectedFourClass K hcard)

/-- The blocker-centered q-deleted rows confirm omission, rather than supply
the positive memberships requested by the production theorem. -/
theorem commonDeletionRows_imply_source₁_cross_omissions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (hLPρ : LPρ.fresh = Pρ.source₁)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (hLP : LP.fresh = P.source₁) :
    Pρ.source₁ ∉
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support ∧
      P.source₁ ∉
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support := by
  have hLPρSupport :
      LPρ.packet.B₂ =
        (H.selectedAt P.source₁ P.source₁_mem_A).toCriticalFourShell.support :=
    qDeletedK4Class_support_eq_selectedShell
      P.source₁_mem_A LPρ.packet.row₂ LPρ.packet.B₂_card
  have hLPSupport :
      LP.packet.B₂ =
        (H.selectedAt Pρ.source₁ Pρ.source₁_mem_A).toCriticalFourShell.support :=
    qDeletedK4Class_support_eq_selectedShell
      Pρ.source₁_mem_A LP.packet.row₂ LP.packet.B₂_card
  constructor
  · rw [← hLPρSupport, ← hLPρ]
    exact LPρ.packet.row₂.q_not_mem
  · rw [← hLPSupport, ← hLP]
    exact LP.packet.row₂.q_not_mem

/-- The mutual-omission-cycle fields point in the same negative direction:
both oriented cycles store omissions and no positive cross incidence. -/
theorem mutualOmissionCycles_record_cross_omissions
    {D : CounterexampleData} {S : SurplusCapPacket D.A} {radius ρ : ℝ}
    {H : CriticalShellSystem D.A}
    {F : CriticalPairFrontier D S radius H}
    {R : FrontierCommonDeletionParentResidual F}
    (P : RetainedInteriorBlockerCollision R)
    {Fρ : CriticalPairFrontier D S ρ H}
    {Rρ : FrontierCommonDeletionParentResidual Fρ}
    (Pρ : RetainedInteriorBlockerCollision Rρ)
    (LPρ : LocalizedCollisionCommonDeletion P)
    (MPρ : LocalizedCollisionMutualOmissionCycle P LPρ)
    (LP : LocalizedCollisionCommonDeletion Pρ)
    (MP : LocalizedCollisionMutualOmissionCycle Pρ LP) :
    LPρ.fresh ∉
        (H.selectedAt MPρ.collisionSource
          MPρ.collisionSource_mem_A).toCriticalFourShell.support ∧
      MPρ.collisionSource ∉
        (H.selectedAt LPρ.fresh
          LPρ.packet.q_mem_A).toCriticalFourShell.support ∧
      LP.fresh ∉
        (H.selectedAt MP.collisionSource
          MP.collisionSource_mem_A).toCriticalFourShell.support ∧
      MP.collisionSource ∉
        (H.selectedAt LP.fresh
          LP.packet.q_mem_A).toCriticalFourShell.support := by
  exact ⟨MPρ.fresh_not_mem_collisionSource_shell,
    MPρ.collisionSource_not_mem_fresh_shell,
    MP.fresh_not_mem_collisionSource_shell,
    MP.collisionSource_not_mem_fresh_shell⟩

#print axioms first_eq_source₁_implies_not_mem
#print axioms first_eq_source₂_implies_not_mem
#print axioms reverse_eq_source₁_implies_not_mem
#print axioms reverse_eq_source₂_implies_not_mem
#print axioms commonDeletionRows_imply_source₁_cross_omissions
#print axioms mutualOmissionCycles_record_cross_omissions

end CollisionEqualityArms
end Problem97
